$test = <>;
chomp $test;
@lists = split(/\,\s/gm, $test);
%hash = ();
foreach $stri (@lists){
	@sublists = split(/\:/gm, $stri);
	$hash{$sublists[0]}=$sublists[1];
	#%hash = (%hash, $sublists[0], $sublists[1]);
	#print $hash{$sublists[0]};
}
foreach $k (keys %hash){
	print "$k->$hash{$k}\n";
}

