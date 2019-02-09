open(FILE, 'test.txt') or die "Can't read file 'filename' [$!]\n";
#@txt= split /\n/, (join "", <FILE>);
@txt=<FILE>;
chomp @txt;
open(FH, ">data.txt") or die $!;
foreach $str (@txt){
	@sum = split "\t", $str;
	$sumout = 0;
	$sumout+=$_ foreach @sum;
	#foreach $num (@sum){
	#	$sumout+=$num;
	#}
	print FH "$sumout\n";
}
close(FH);
