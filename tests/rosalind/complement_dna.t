
use Test::Moose;
use Test::More qw/no_plan/;

BEGIN { require_ok('src/rosalind/complement_dna.pl'); }

my $test = Rosalind::REVC->new;

isa_ok( $test, 'Rosalind::REVC' );
has_attribute_ok( $test, $_ ) for qw/input complement/;
can_ok( $test, 'run' );

is( $test->get_complement('A'), 'T', 'Complement is correct' );
isnt( $test->get_complement('C'),
    'A', 'Doesn\'t return incorrect complement' )
