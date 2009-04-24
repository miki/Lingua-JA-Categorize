package Lingua::JA::Categorize;
use strict;
use warnings;
use Lingua::JA::Categorize::Tokenizer;
use Lingua::JA::Categorize::Categorizer;
use Lingua::JA::Categorize::Generator;
use Lingua::JA::Categorize::Result;
use base qw( Lingua::JA::Categorize::Base );

__PACKAGE__->mk_accessors($_) for qw( tokenizer categorizer generator );

our $VERSION = '0.00003';

sub new {
    my $class = shift;
    my $self  = $class->SUPER::new(@_);
    $self->tokenizer( Lingua::JA::Categorize::Tokenizer->new );
    $self->categorizer( Lingua::JA::Categorize::Categorizer->new );
    $self->generator( Lingua::JA::Categorize::Generator->new );
    return $self;
}

sub categorize {
    my $self       = shift;
    my $text       = shift;
    my $return_num = shift || 20;
    my $word_set   = $self->tokenizer->tokenize( \$text, $return_num );
    my $score = $self->categorizer->categorize($word_set);
    return Lingua::JA::Categorize::Result->new(
        word_set => $word_set,
        score    => $score
    );
}

sub generate {
    my $self       = shift;
    my $categories = shift;
    my $brain      = $self->categorizer->brain;
    $self->generator->generate( $categories, $brain );
}

sub load {
    my $self      = shift;
    my $save_file = shift;
    $self->categorizer->load($save_file);
}

sub save {
    my $self      = shift;
    my $save_file = shift;
    $self->categorizer->save($save_file);
}

1;
__END__

=head1 NAME

Lingua::JA::Categorize - Naive Bayes Classifier for Japanese document.

=head1 SYNOPSIS

  use Lingua::JA::Categorize;

  # generate
  my $categorizer = Lingua::JA::Categorize->new;
  $categorizer->generate($category_conf);
  $categorizer->save('save_file');

  # categorize
  my $categorizer = Lingua::JA::Categorize->new;
  $categorizer->load('save_file');
  my $result = $categorizer->categorize($text);
  print Dumper $result->score;

=head1 DESCRIPTION

Lingua::JA::Categorize is a Naive Bayes classifier for Japanese document.

B<THIS MODULE IS IN ITS ALPHA QUALITY.>

=head1 METHODS

=head2 new

The constructor method.

=head2 categorize($text, $return_num)

This method accepts two arguments, a $text and an optional $return_num.
It return Lingua::JA::Categorize::Result object.

=head2 generate($configuration_data)

This generate primary data set from the category configuration.

=head2 load('filename')

Load the saved file (that is Storable).

=head2 save('filemname')

Save the data to filename (that is Storable).

=head2 tokenizer

Accessor method to Lingua::JA::Categorize::Tokenizer.

=head2 categorizer

Accessor method to Lingua::JA::Categorize::Categorizer.

=head2 generator

Accessor method to Lingua::JA::Categorize::Generator.

=head1 AUTHOR

takeshi miki E<lt>miki@cpan.orgE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
