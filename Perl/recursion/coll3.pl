#!/usr/bin/perl

use strict;
use warnings;

sub collatzStep{

	my $input = $_[0];

	my $counter = 0;

	if($input == 1){
		return 0;
	}elsif($input%2 == 1 ){
		$counter += collatzStep($input *3 +1);
	}else{
		$counter += collatzStep($input /2);
	}

	$counter = $counter + 1;

	return $counter;
}


my @maxValues;
my $minVal = 0;
my $col;
my $count;

for(my $i = 0; $i < 20; $i = $i + 1){
	if($i < 10){
		$maxValues[0][$i%10] = 0;
	}else{
		$maxValues[1][$i%10] = 0;
	}#print $i/10;
}

#loop
for(my $i = 2; $i < 1000; $i = $i + 1){

	$col = $i;
	$count = 0;

	#print $i, "\n";

	$count = collatzStep($col);

	#print "after loop\n";

	#if
	if($count > $maxValues[0][$minVal]){
		#loop
		for(my $j = 0; $j < 10; $j = $j + 1){
			if($j == $minVal){
				$maxValues[0][$j] = $count;
				$maxValues[1][$j] = $i;
			}
		}
		$minVal = 0;
		#print "In if \n";
		#loop
		for(my $k = 0; $k < 10; $k = $k + 1){
			if($maxValues[0][$k] < $maxValues[0][$minVal]){
				$minVal = $k;
			}
		}
	}
}

for(my $i = 0; $i < 10; $i = $i + 1){
	print "Value ", $maxValues[1][$i], " Steps Taken: ", $maxValues[0][$i],"\n";
}

