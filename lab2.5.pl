open(FILE, 'test.txt') or die "Can't read file 'filename' [$!]\n";
@txt= split /\s/, (join "", <FILE>);

foreach $word (@txt){
	@arr = split //, $word;
	#print "$#arr\n";
	if($#arr < 5){
		print "$word\n";
	}
}

close(FILE);
