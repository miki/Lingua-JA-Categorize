package Lingua::JA::Categorize::Result;
use strict;
use warnings;
use base qw( Lingua::JA::Categorize::Base );

sub word_set {
    my $self     = shift;
    my $word_set = $self->{word_set};
    my @list;
    for ( sort { $word_set->{$b} <=> $word_set->{$a} } keys %$word_set ) {
        push( @list, { $_ => $word_set->{$_} } );
    }
    return \@list;
}

sub score {
    my $self = shift;
    my $num  = shift;
    $num ||= 3;
    unless ( $self->word_set->[0] ) {
        return undef;
    }
    my $score = $self->{score};
    my @list;
    my $i = 0;
    for ( sort { $score->{$b} <=> $score->{$a} } keys %$score ) {
        push( @list, { $_ => $score->{$_} } ) if $score->{$_} > 0;
        $i++;
        last if ( $i == $num );
    }
    return \@list;
}

sub no_matches {
    my $self = shift;
    my $no_matches = $self->{no_matches};
    return $no_matches;
}

sub matches {
    my $self = shift;
    my $matches = $self->{matches};
    return $matches;
}

1;
__END__

=head1 NAME

Lingua::JA::Categorize::Result - Result of L::J::C working 

=head1 SYNOPSIS

  use Lingua::JA::Categorize::Result;

  my $result = Lingua::JA::Categorize::Result->new(word_set => $word_set, score => $score);
  print Dumper $result->score;
  print Dumper $result->word_set;

=head1 DESCRIPTION

Lingua::JA::Categorize::Result is a result storage of L::J::C working 

=head1 METHODS

=head2 new

=head2 score  

=head2 word_set

=head2 matches 

=head2 no_matches 

=head1 AUTHOR

takeshi miki E<lt>miki@cpan.orgE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
