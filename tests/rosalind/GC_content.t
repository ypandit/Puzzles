
use Test::File;
use Test::Moose;
use Test::More qw/no_plan/;

BEGIN { require_ok('src/rosalind/GC_content.pl'); }

my $test = Rosaling::GC;

isa_ok( $test, 'Rosaling::GC' );
has_attribute_ok( $test, 'fasta' );
can_ok( $test, $_ ) for qw/run gc/;

is( $test->gc('ATGCCGTA'), '50', 'Returns correct GC percent' );
