$test = "тест. Тсет. Предложение 21321. Тест 5.";
@lists = split(/\b/gm, $test);

#$outstr = "";
#$i = 0;
#foreach $stri (@lists){
#	$i++;
#	if($i<@lists){
#		$outstr=$outstr.$stri."\n";
#	}else{
#		$outstr=$outstr.$stri;
#	}
#}

print join "\n", @lists;
