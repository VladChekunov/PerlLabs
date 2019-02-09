open(FILE, 'test.txt') or die "Can't read file 'filename' [$!]\n";
@txt= <FILE>;

open(FH, '>', "data.txt") or die $!;
foreach $word (@txt){
	@arr = split //, $word;
	#print "$arr[0]\n";
	if($arr[0] eq "b"){
		print FH "$word\n";
	}
}

close(FH);

