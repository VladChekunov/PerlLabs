open(FILE, 'test.txt') or die "Can't read file 'filename' [$!]\n";
@txt= split /\s/, (join "", <FILE>);
chomp $txt;

foreach $word (@txt){
	@arr = split //, $word;
	@sublists = split(/\:/gm, $stri);
	if($hash{$arr[0]} eq " "){
		$hash{$arr[0]}.=$word;
	}else{
		$hash{$arr[0]}.=" ".$word;
	}
	
}

foreach $k (keys %hash){
	print "$k->$hash{$k}\n";
}
