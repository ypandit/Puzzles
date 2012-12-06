
use strict;

package Rosaling::GC;

use Bio::SeqIO;
use Moose;
with 'MooseX::Getopt';

has 'fasta' => (
    is      => 'rw',
    isa     => 'Str',
    default => '././data/rosalind/GC_content.txt',
    lazy    => 1
);

sub run {
    my ($self) = @_;
    my $best_id;
    my $best_value = 0.0;
    my $in = Bio::SeqIO->new( -file => $self->fasta, -format => 'Fasta' );
    while ( my $seq = $in->next_seq() ) {
        my $gc_content = $self->gc( $seq->seq );
        if ( $best_value < $gc_content ) {
            $best_id    = $seq->id;
            $best_value = $gc_content;
        }
    }
    print $best_id . "\n";
    printf "%.6f", $best_value;
    print "%\n";
}

sub gc {
    my ( $self, $seq ) = @_;
    my $count = 0;
    my @alphabets = split( //, $seq );
    for my $a (@alphabets) {
        if ( $a eq 'G' || $a eq 'C' ) {
            $count = $count + 1;
        }
    }
    my $gc_content = ( $count / scalar @alphabets ) * 100;
    return $gc_content;
}

1;

package main;
Rosaling::GC->new->run;
