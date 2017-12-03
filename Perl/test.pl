#!usr/bin/perl

use strict;
use warnings;

my $col = 3;
while($col > 1){
	$col = ($col*3+1)*($col&1)+($col>>1)*(($col-1)&1);
	print $col, "\n";
}
print $col, "\n";
