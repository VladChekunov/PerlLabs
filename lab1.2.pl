$stri = <>;
@nums = split(/\+/gm, $stri);

$sum = 0;
foreach $num (@nums){
	$sum = $sum+$num;
}

print $sum;
