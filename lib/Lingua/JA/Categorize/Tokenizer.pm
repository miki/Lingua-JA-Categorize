package Lingua::JA::Categorize::Tokenizer;
use strict;
use warnings;
use Lingua::JA::TFIDF;
use base qw( Lingua::JA::Categorize::Base );

__PACKAGE__->mk_accessors($_) for qw( calc );


sub new {
    my $class = shift;
    my $self  = $class->SUPER::new(@_);
    $self->calc( Lingua::JA::TFIDF->new( %{ $self->config } ) );
    return $self;
}

sub tokenize {
    my $self      = shift;
    my $text_ref  = shift;
    my $threshold = shift;
    my $list      = $self->calc->tfidf($$text_ref)->list($threshold);
    my %hash;
    for(@$list){
        my( $word, $score ) = each(%$_);
        $hash{$word} = $score; 
    }
    return \%hash;
}

1;
__END__

=head1 NAME

Lingua::JA::Categorize::Tokenizer - Extract featured words from a document 

=head1 SYNOPSIS

  use Lingua::JA::Categorize::Tokenizer;

  my $tokenizer = Lingua::JA::Categorize::Tokenizer->new;
  my $word_set = $tokenizer->tokenize($text_ref);

=head1 DESCRIPTION

Lingua::JA::Categorize::Tokenizer is a featured word extractor.

It is just a warpper of Lingua::JA::TFIDF.

=head1 METHODS

=head2 new

=head2 tokenize

=head2 calc

=head1 AUTHOR

takeshi miki E<lt>miki@cpan.orgE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
