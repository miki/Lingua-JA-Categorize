package MyEngine::Osiete;
use strict;
use warnings;
use Encode;
use HTML::TreeBuilder::XPath;
use base qw(HTML::Feature::Base);

sub run {
    my $self     = shift;
    my $html_ref = shift;
    my $url      = shift;
    my $result   = shift;

    return $result unless $url =~ /oshiete/;


    my $tree     = HTML::TreeBuilder::XPath->new;
    $tree->parse($$html_ref);
    $tree->eof;
    my $text;

    for my $node ( $tree->findnodes('//span[@class="_LSUCS"]') ) {
        unless ( encode( "utf8", $node->as_text ) =~
            /この回答に(補足|お礼)をつける/ )
        {
            $text .= $node->as_text . "\n";
        }
    }

    my $http_URL_regex =
        q{\b(?:https?|shttp)://(?:(?:[-_.!~*'()a-zA-Z0-9;:&=+$,]|%[0-9A-Fa-f}
      . q{][0-9A-Fa-f])*@)?(?:(?:[a-zA-Z0-9](?:[-a-zA-Z0-9]*[a-zA-Z0-9])?\.)}
      . q{*[a-zA-Z](?:[-a-zA-Z0-9]*[a-zA-Z0-9])?\.?|[0-9]+\.[0-9]+\.[0-9]+\.}
      . q{[0-9]+)(?::[0-9]*)?(?:/(?:[-_.!~*'()a-zA-Z0-9:@&=+$,]|%[0-9A-Fa-f]}
      . q{[0-9A-Fa-f])*(?:;(?:[-_.!~*'()a-zA-Z0-9:@&=+$,]|%[0-9A-Fa-f][0-9A-}
      . q{Fa-f])*)*(?:/(?:[-_.!~*'()a-zA-Z0-9:@&=+$,]|%[0-9A-Fa-f][0-9A-Fa-f}
      . q{])*(?:;(?:[-_.!~*'()a-zA-Z0-9:@&=+$,]|%[0-9A-Fa-f][0-9A-Fa-f])*)*)}
      . q{*)?(?:\?(?:[-_.!~*'()a-zA-Z0-9;/?:@&=+$,]|%[0-9A-Fa-f][0-9A-Fa-f])}
      . q{*)?(?:#(?:[-_.!~*'()a-zA-Z0-9;/?:@&=+$,]|%[0-9A-Fa-f][0-9A-Fa-f])*}
      . q{)?};

    $text =~ s/$http_URL_regex//g;
    $result->text($text);
    if ( !$result->title ) {
        if ( my $title = $tree->look_down( _tag => "title" ) ) {
            $result->title( $title->as_text );
        }
    }
    if ( !$result->desc ) {
        if ( my $desc =
            $tree->look_down( _tag => 'meta', name => 'description' ) )
        {
            $result->desc( $desc->attr("content") );
        }
    }
    if ( $result->text ) {
        $result->{matched_engine} = 'MyEngine::Osiete';
    }
    return $result;
}
1;