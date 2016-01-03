#!/usr/bin/perl -w

use 5.14.2;
use strict;
use warnings;

sub main {
  for (my $i=1; $i<=12; $i++) {
   for (my $j=1; $j<=12; $j++) {
      printf("%4d", $i*$j);
   }; print "\n";
  }
}

unless (caller) {
   main($ARGV[0]);
}