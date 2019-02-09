open(FILE, 'test.txt') or die "Can't read file 'filename' [$!]\n";
@txt= split /\s/, (join "", <FILE>);
chomp $txt;

open(FH, ">data.txt") or die $!;
$i = 1;
foreach $word (@txt){
	print FH $i."\.\s".$txt[$i]."\n";
	$i++;
}
close(FH)
