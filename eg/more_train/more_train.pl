use strict;
use warnings;
use FindBin::libs;
use HTTP::Async;
use HTTP::Request;
use HTML::Feature;
use LWP::Simple;
use Lingua::JA::Categorize;

our $VAR1;
require './more_train.data';

my $save_file = '../sample.bin';

my $f = HTML::Feature->new(
    engines => [
        'MyEngine::Osiete',
    ]
);

my $c = Lingua::JA::Categorize->new;
$c->load($save_file);
while ( my ( $label, $url ) = each %$VAR1 ) {
    my $content = get($url);
    my @lists = $content =~ m|<a href="(qa.+.html)">|g;
    my %check;
    my $async = HTTP::Async->new;
    $async->slots(5);
    for (@lists) {
        my $url = 'http://oshiete1.goo.ne.jp/' . $_;
        my $id = $async->add( HTTP::Request->new( GET => $url ) );
        $check{$id} = $label;
    }
    my @results = ();
    while ( my ( $response, $id ) = $async->wait_for_next_response ) {
        my $correct = $check{$id};
        if ( $response->code == 200 ) {
            my $text = $f->parse($response)->text;
            if ($text) {
                my $result = $c->categorize($text);
                my ( $label, $score ) = %{ $result->score->[0] };

                if ( $label ne $correct ) {
                    print $label, "\t => \t", $correct, "\n";
                    ## 補正学習せよ！
                    train( $correct, $text );
                }
                else {
                    print "OK\n";
                }
            }
            else {
                print "Fetch Error", "\n";
            }
        }
        else {
            print "Server Error", "\n";
        }
    }
}

$c->save($save_file);

sub train {
    my $label = shift;
    my $text  = shift;
    my $brain = $c->categorizer->brain;
    my $word_set;
    $word_set = $c->tokenizer->tokenize( \$text );
    $brain->add_instance( attributes => $word_set, label => $label );
    $brain->train;
}
