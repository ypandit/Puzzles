
use strict;

package Rosalind::CD;

use IO::File;
use Moose;
with 'MooseX::Getopt';

has 'input' => (
    is      => 'ro',
    isa     => 'Str',
    default => '././data/rosalind/complement_dna.txt',
    lazy    => 1
);

has 'complement' => (
    traits  => ['Hash'],
    is      => 'ro',
    isa     => 'HashRef',
    default => sub {
        {   A => 'T',
            T => 'A',
            C => 'G',
            G => 'C'
        };
    },
    handles => { get_complement => 'get' },
);

sub run {
    my ($self) = @_;
    my $FH        = IO::File->new( $self->input, 'r' );
    my $dna       = $FH->getline;
    my $reverse   = scalar reverse($dna);
    my @alphabets = split( //, $reverse );
    my $complement = "";
    for my $a (@alphabets) {
        $complement = $complement . $self->get_complement($a);
    }
    print $complement. "\n";
}

1;

package main;
Rosalind::CD->new->run;
