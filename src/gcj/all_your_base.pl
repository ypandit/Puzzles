# All Your Base - http://code.google.com/codejam/contest/dashboard?c=189252

# @author - Yogesh Pandit
# @date - Aug 27, 2011

$filename = "././data/gcj/AYB-small.in";
open (FILE, $filename) or die $!;
my @lines = <FILE>;
my $count = 0;
foreach $line(@lines){
	chomp($line);
	if ($count !=0){
		my $seconds = &convert($line);
		print "Case #$count: $seconds\n";
	}
	$count++;
}

sub convert {
	my $seconds = 0;
	my %map = ();
	my $base = 0;
	my $index = 1;
	my $len = length($_[0]);
	my @chars = split(//, $_[0]);
	#print $_[0]."\t".$len;
	
	for($i=0; $i<$len; $i++) {
		#print @chars[$i]."\n";
		if(!exists $map{@chars[$i]}){
			if ($i != 0) {
				if ($index == 1) {
                    			$index--;
                		} elsif ($index == 0) {
                    			$index = 2;
                		} else {
                    			$index++;
                		}
			}
			$map {@chars[$i]} = $index;
			$base++;
		}
	}
	if (length(%map) == 1){
		$base = 2;
	}
	#print "base: $base\tLen: $len";
	
	for ($i=0; $i<$len; $i++) {
		$s = @chars[$i];
		$seconds += $map{$s} * ($base**($len-$i-1));
	}
	return $seconds;
	
}

