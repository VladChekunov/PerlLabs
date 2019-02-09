
open(FH, '>', "data.txt") or die $!;

for (my $i=1; $i <= 9; $i++) {
	for (my $j=1; $j <= 9; $j++) {
		print FH ($j*$i);
		print FH "\t";
	}
	print FH "\n";
}
close(FH);
