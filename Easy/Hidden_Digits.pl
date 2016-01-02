#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
while(my $line = <INFILE>) {
   next if($line =~ m/^\s$/);  # skip blank lines
   $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
   my $len = length($line);
   my $result = "";
   if ($line =~ m/[a-j0-9]/g) {
     for (my $i=0; $i<$len; $i++) {
        my $char = substr($line, $i, 1);
        if ($char =~ /a|0/) {
           $result .= "0";
        } elsif ($char =~ /b|1/) {
           $result .= "1";
        } elsif ($char =~ /c|2/) {
           $result .= "2";
        } elsif ($char =~ /d|3/) {
           $result .= "3";
        } elsif ($char =~ /e|4/) {
           $result .= "4";
        } elsif ($char =~ /f|5/) {
           $result .= "5";
        } elsif ($char =~ /g|6/) {
           $result .= "6";
        } elsif ($char =~ /h|7/) {
           $result .= "7";
        } elsif ($char =~ /i|8/) {
           $result .= "8";
        } elsif ($char =~ /j|9/) {
           $result .= "9";
        }
     }; print "$result\n";
   } else { print "NONE\n"; }
}
close(INFILE);