$stri = "3+7:1+2";
@nums = split(/(\:|\+)/, $stri);

foreach $num (@nums){
	print $num."\n";
}

$sum = ($nums[0]+$nums[1])/($nums[2]+$nums[3]);

print $sum."\n";
