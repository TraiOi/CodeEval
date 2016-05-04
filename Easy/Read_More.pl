#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

open(INFILE, "<", $ARGV[0]) or die("[-] Cannot open file $ARGV[0] for reading: $!");
while(my $line = <INFILE>) {
   next if($line =~ m/^\s$/);  # skip blank lines
   $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
   my $len = length($line);
   if ($len<=55) { 
   	print "$line\n"; 
   	} else {
   		my $trim = substr($line, 0, 40);
   		my $char = " ";
   		my $index = rindex($trim, $char);
   		if ($index!=-1) {
   			$trim = substr($trim, 0, $index);
   		}
   		print "$trim... <Read More>\n";
   	}
}
close(INFILE);