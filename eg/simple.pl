use strict;
use blib;
use Lingua::JA::Categorize;
use HTML::Feature;
use Data::Dumper;

my $categorizer = Lingua::JA::Categorize->new;
$categorizer->load("sample.bin");

my $feature = HTML::Feature->new(
    engines => [
        'HTML::Feature::Engine::LDRFullFeed',
        'HTML::Feature::Engine::GoogleADSection',
        'HTML::Feature::Engine::TagStructure',
    ]
);

while (1) {
    print "Input URL : ";
    my $url = <STDIN>;
    chomp $url;

    my $text = $feature->parse($url)->text;
    print "-" x 20, "\n";
    print $text, "\n";
    print "-" x 20, "\n";

    my $result = $categorizer->categorize($text);
    print Dumper $result->word_set;
    print "-" x 20, "\n";
    print Dumper $result->score;
    print "-" x 20, "\n";
}

