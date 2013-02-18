
use strict;

package Rosalind::CONS;

use Bio::SeqIO;
use Moose;
with 'MooseX::Getopt';

has 'input' => (
    is      => 'rw',
    isa     => 'Str',
    default => '././data/rosalind/consensus_profile.txt',
    lazy    => 1
);

has 'profile' => (
    traits  => ['Hash'],
    is      => 'rw',
    isa     => 'HashRef',
    handles => {
        get_profile => 'get',
        set_profile => 'set',
        bases       => 'keys',
    },
);

has 'seq_length' => (
    is      => 'rw',
    isa     => 'Int',
    default => 0,
    lazy    => 1
);

sub run {
    my ($self) = @_;
    my $FH = $self->read_FastA( $self->input );
    while ( my $seq = $FH->next_seq ) {
        my @alphabets = split( //, $seq->seq );
        if ( $self->seq_length == 0 ) {
            $self->create_empty_profile( length( $seq->seq ) );
        }
        for my $i ( 0 .. $#alphabets ) {
            my @data = @{ $self->get_profile( $alphabets[$i] ) };
            $data[$i] = $data[$i] + 1;
            $self->set_profile( $alphabets[$i] => \@data );
        }
    }
    print $self->get_consensus() . "\n";
    for my $base ( $self->bases ) {
        print $base. ": "
            . join( ' ', @{ $self->get_profile($base) } ) . "\n";
    }
}

sub get_consensus {
    my ($self) = @_;
    my $seq = "";
    for my $i ( 0 .. $self->seq_length ) {
        $seq .= $self->get_base_with_max_score($i);
    }
    return $seq;
}

sub get_base_with_max_score {
    my ( $self, $pos ) = @_;
    my $base  = "";
    my $score = 0;
    for my $b ( $self->bases ) {
        my @values = @{ $self->get_profile($b) };
        if ( $values[$pos] ) {
            if ( $values[$pos] > $score ) {
                $score = $values[$pos];
                $base  = $b;
            }
        }
    }
    return $base;
}

sub create_empty_profile {
    my ( $self, $l ) = @_;
    $self->seq_length($l);
    my @init = ( (0) x $l );
    $self->set_profile( A => \@init, C => \@init, G => \@init, T => \@init );
}

sub read_FastA {
    my ( $self, $input ) = @_;
    return Bio::SeqIO->new( -file => $input, -format => 'Fasta' );
}

1;

package main;
Rosalind::CONS->new->run;
