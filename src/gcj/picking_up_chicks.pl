
# Picking Up Chicks - http://code.google.com/codejam/contest/dashboard?c=635101#s=p1

# @date: Sept 13, 2011

#use strict;
#use warnings;
use constant false => 0;
use constant true  => 1;

$filename = "././data/gcj/PUC-small.in";
open( FILE, $filename ) or die $!;

@lines     = <FILE>;
$num_cases = $lines[0];
$line      = 1;

for ( $i = 1; $i <= $num_cases; $i++ ) {
    @V  = split( ' ', $lines[$line] );
    @Xi = split( ' ', $lines[ $line + 1 ] );
    @Vi = split( ' ', $lines[ $line + 2 ] );
    $S = chick_in_time( \@V, \@Xi, \@Vi );
    print "Case #$i: $S\n";
    $line += 3;
}

sub chick_in_time {
    my ( $var, $loc, $speed ) = @_;

# print $speed->[0] . ", " . $loc->[1] . ", " . $loc->[2] . ", " . $loc->[3] . "\n";

    my $B            = $var->[2];
    my $T            = $var->[3];
    my $K            = $var->[1];
    my $final_chicks = 0;
    my @capable      = ();
    my $len          = @$loc;

    for ( my $j = 0; $j < $len; $j++ ) {
        if ( $loc->[$j] + $speed->[$j] * $T >= $B ) {
            $capable[$j] = true;
            $final_chicks++;
        }
        else {
            $capable[$j] = false;
        }
    }
    if ( $final_chicks < $K ) {
        return 'IMPOSSIBLE';
    }
    $final_chicks = 0;
    my $price = 0;
    my $S     = 0;
    for ( my $i = $len - 1; $i >= 0; $i-- ) {
        if ( $capable[$i] ) {
            $final_chicks++;
            if ( $price > 0 ) {
                $S += $price;
            }
        }
        else {
            $price++;
        }
        if ( $K == $final_chicks ) {
            return $S;
        }
    }
}
