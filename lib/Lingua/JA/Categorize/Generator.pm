package Lingua::JA::Categorize::Generator;
use strict;
use warnings;
use Algorithm::NaiveBayes;
use Lingua::JA::Expand;
use base qw( Lingua::JA::Categorize::Base );

__PACKAGE__->mk_accessors($_) for qw( brain expander );

sub generate {
    my $self       = shift;
    my $categories = shift;
    my $brain      = shift;
    my $save_file  = shift;
    my $expander   = Lingua::JA::Expand->new;

    while ( my ( $label, $ref ) = each %$categories ) {
        print $label, "\n";
        my $weight  = $ref->{weight};
        my @keyword = @{ $ref->{keyword} };
        for my $keyword (@keyword) {
            my $word_set = $expander->expand($keyword);
            #$self->_expand_recursive( $word_set, $keyword );
            $brain->add_instance(
                attributes => $word_set,
                label      => $label,
            );
            if ( $weight > 1 ) {
                for ( 1 .. $weight ) {
                    $brain->add_instance(
                        attributes => { dummy => 0 },
                        label      => $label,
                    );
                }
            }
        }
        $brain->train;
    }
    $brain->save_state($save_file) if $save_file;
}

sub _expand_recursive {
    my $self     = shift;
    my $word_set = shift;
    my $keyword  = shift;
    my @array;
    for ( sort { $word_set->{$b} <=> $word_set->{$a} } keys %$word_set ) {
        push @array, $_;
    }
    for ( 1 .. 10 ) {
        my $n           = $_ - 1;
        my $sub_keyword = $array[$n];
        my $exp         = Lingua::JA::Expand->new;
        my $new_keyword = $keyword . ' ' . $sub_keyword;
        my $sub_result  = $exp->expand($new_keyword);
        $self->_merge_hash( $word_set, $sub_result );
    }
    use Data::Dumper;
    print Dumper $word_set;
}

sub _merge_hash {
    my $self       = shift;
    my $hash_ref_a = shift;
    my $hash_ref_b = shift;
    while ( my ( $key_b, $value_b ) = each %$hash_ref_b ) {
        $hash_ref_a->{$key_b} += $value_b;
    }
}

1;
__END__

=head1 NAME

Lingua::JA::Categorize::Generator - generator module 

=head1 SYNOPSIS

  use Lingua::JA::Categorize::Generator;

  # generate
  my $c = Lingua::JA::Categorize::Generator->new;
  $generator->generate($category_conf);

=head1 DESCRIPTION

Lingua::JA::Categorize::Generate is a generate module.

=head1 METHODS

=head2 generate

=head2 brain

=head2 expander

=head1 AUTHOR

takeshi miki E<lt>miki@cpan.orgE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
