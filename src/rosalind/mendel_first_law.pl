
use strict;

package Rosalind::IPRB;

use Moose;
with 'MooseX::Getopt';

has 'input' => (
    is      => 'ro',
    isa     => 'Str',
    default => '././data/rosalind/mendel_first_law.txt',
    lazy    => 1
);

sub run {
    my ($self) = @_;
    my $fh = IO::File->new( $self->input, 'r' );
    my ( $k, $m, $n ) = split( / /, $fh->getline );
    my $t     = $k + $m + $n;

    my $Hr    = ( $n / $t ) * ( ( $n - 1 ) / ( $t - 1 ) );        # Both homozygous recessive
    my $HrHtr = 2 * ( $n / $t ) * ( $m / ( $t - 1 ) ) * 0.5;      # Homezygous recessive & heterozygous recessive
    my $Htr   = ( $m / $t ) * ( ( $m - 1 ) / ( $t - 1 ) ) * 0.25; # Heterozygous recessive

    my $prob  = 1 - ($Hr + $HrHtr + $Htr);
    print $prob. "\n";
}

package main;
Rosalind::IPRB->new->run;
