$test = "1. тест\n 2. Тсет\n 3. 21321\n 4. Тест\n 5. Тест";
@lists = split(/\n/gm, $test);

$outstr = "";
$i = 0;

#foreach $stri (@lists){
#	$i++;
#	if($i<@lists){
#		$outstr=$outstr.$stri."%";
#	}else{
#		$outstr=$outstr.$stri;
#	}
#}

print join "\%", @lists;
