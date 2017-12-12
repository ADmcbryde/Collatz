#!/usr/bin/perl
# CSC 330
# Assignmant 3 - Collatz Conjecture
#
# Author: Devin McBryde
#
#
#

#strict requires for specific syntax with perl while warnings
#	enables warnings if certain actions occur during runtime
use strict;
use warnings;

#Function that will perform a collatz step
sub collatzStep{

	my $input = $_[0];

	#print $input, "\n";

	if($input%2 == 1 ){
		$input = $input *3 +1;
	}else{
		$input = $input /2;
	}

	

	return $input;
}

#stores the top ten highest values and the steps to 1
my @maxValues;

#the location of the minimum value in the array
my $minVal = 0;

#col holds the value of the iterated number
my $col;

#count tracks the number of iterations total
my $count;

#initialize the array to zeroes
for(my $i = 0; $i < 20; $i = $i + 1){
	if($i < 10){
		$maxValues[0][$i%10] = 0;
	}else{
		$maxValues[1][$i%10] = 0;
	}
}

#Main loop that goes through all values between 2 and 5000000000
#	Top value has the L suffix since literals are interpreted as integers

my $i = 1000000000000000;

while( $i > 1 ){

	my $alreadyexists = 0;


	#reset the next two values for the new number
	$col = $i;
	$count = 0;

	#Here we iterate values until they hit 1
	while($col > 1){

		

		#next two lines use the function, however the program then
		#	runs much slower

		#$count += 1;
		#$col = collatzStep(col);
		
		#This if statement will perform the operations the collatz sequence
		if($col&1){

			#If the number is odd the next number must be even
			#	therefore we can avoid logic checks by 
			#	performing both operations and adding 2
			#	to the count
			$col = ($col*3 +1)/2;
			$count += 2;
		}else{
			#If the number is even we divide by two and add one to count

			$col = $col/2;
			$count += 1;
		}

		#can replace the if statements and will accomplish the
		#	same goal, however tests have shown it to be slower
		#$col = ($col*3+1)*($col&1)+($col>>1)*(($col-1)&1);
	}

	#Here we avoid having a value with a duplicate number of steps using the boolean flag
	for(my $z = 0; $z < 10; $z = $z + 1){
		if($count == $maxValues[0][$z]){
			$alreadyexists = 1;
		}
	}

	#Here we check if the count is larger than the smallest count recorded and add if it is
	if($count > $maxValues[0][$minVal] && $alreadyexists != 1){
		
		#here we replace the value of the smallest count
		for(my $j = 0; $j < 10; $j = $j + 1){
			if($j == $minVal){
				$maxValues[0][$j] = $count;
				$maxValues[1][$j] = $i;
			}
		}

		#we now reset the minVal to look for the new lowest count value
		$minVal = 0;

		#search for the smallest count size in maxValues
		for(my $k = 0; $k < 10; $k = $k + 1){
			if($maxValues[0][$k] < $maxValues[0][$minVal]){
				$minVal = $k;
			}
		}
	}

	$i = $i - 1;

}

#Now we perform a basic selection sort on the step count before printing
for(my $i = 0; $i < 9; $i = $i+1){

	my $minValue = $maxValues[0][$i];
	my $minColNum = $maxValues[1][$i];
	my $minLocale = $i;
	
	for(my $j = $i+1; $j < 10; $j = $j+1){
	
		if($minValue < $maxValues[0][$j]){
			$minValue = $maxValues[0][$j];
			$minColNum = $maxValues[1][$j];
			$minLocale = $j;
		}
	
	}
	
	my $tempVal = $maxValues[0][$i];
	my $tempNum = $maxValues[1][$i];
	
	$maxValues[0][$i] = $minValue;
	$maxValues[0][$minLocale] = $tempVal;
	
	$maxValues[1][$i] = $minColNum;
	$maxValues[1][$minLocale] = $tempNum;
	
}

#print the maxValues array
for(my $i = 0; $i < 10; $i = $i + 1){
	print "Value ", $maxValues[1][$i], " Steps Taken: ", $maxValues[0][$i],"\n";
}

