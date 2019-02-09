open(FILE, 'test.txt') or die "$!\n";
@txt= split "\t", (join "", <FILE>);

for($i=2;$i<=$#txt;$i+=2){
	#if($i%2==0){
		print "\t$txt[$i]\n";
	#}
}
close(FILE);
