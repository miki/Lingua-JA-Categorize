package Lingua::JA::Categorize::Categorizer;
use strict;
use warnings;
use Algorithm::NaiveBayes;
use base qw( Lingua::JA::Categorize::Base );

__PACKAGE__->mk_accessors($_) for qw( brain );


sub new {
    my $class = shift;
    my $self  = $class->SUPER::new(@_);
    $self->brain( Algorithm::NaiveBayes->new( purge => 0 ) );
    return $self;
}

sub categorize{
    my $self = shift;
    my $word_set = shift;
    my $result = $self->brain->predict( attributes => $word_set );
    return $result;
}

sub save {
    my $self      = shift;
    my $save_file = shift;
    $self->brain->save_state($save_file);
}

sub load {
    my $self      = shift;
    my $save_file = shift;
    my $brain     = $self->brain;
    $brain = Algorithm::NaiveBayes->restore_state($save_file);
    $self->brain($brain);
}

1;
__END__

=head1 NAME

Lingua::JA::Categorize::Categorizer - The brain of L::J::C

=head1 SYNOPSIS

  use Lingua::JA::Categorize::Categorizer;

  my $categorizer = Lingua::JA::Categorize::Categorizer->new;
  $categorizer->load('save_file');
  my $result = $categorizer->categorize($text);
  print Dumper $result->score;

=head1 DESCRIPTION

Lingua::JA::Categorize::Categorizer is a brain of this module.

It is just a warpper of Algorithm::NaiveBayes.

=head1 METHODS

=head2 new

=head2 categorize

=head2 save

=head2 load

=head2 brain

=head1 AUTHOR

takeshi miki E<lt>miki@cpan.orgE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
