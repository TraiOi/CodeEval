#!/usr/bin/perl -w

use 5.14.2;
use strict;
use warnings;

sub fizzBuzz {
   my $x = $_[0];
   my $y = $_[1];
   my $n = $_[2];
   my $result = "";
   for (my $i=1; $i<=$n; $i++) {
      if ($i%$x==0 && $i%$y==0) {
         $result .= "FB ";
      } elsif ($i%$x==0) {
         $result .= "F ";
      } elsif ($i%$y==0) {
         $result .= "B ";
      } else { $result .= "$i "; }
   }
   $result =~ s/(\s*$)//g;
   
   return $result;
}

sub main {
  open(INFILE, "<", $_[0]) or die("[-] Cannot open file $_[0] for reading: $!");
  while(my $line = <INFILE>) {
     next if($line =~ m/^\s$/);
     $line =~ s/(^\s|\s*$)//g;
     my @num = split(" ", $line);
     print fizzBuzz($num[0], $num[1], $num[2]); print "\n";
  }
  close(INFILE);
}

unless (caller) {
   main($ARGV[0]);
}