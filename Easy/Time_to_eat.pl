#!/usr/bin/perl -w

use 5.14.2;
use strict;
use warnings;

sub timeStamps {
   return reverse(sort(@_));
}

sub main {
   open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0].\n";
   while (my $line = <FILE>) {
      next if $line =~ m/^\s$/;
      $line =~ s/(^\s|\s*$)//g;
      my @time = split(" ", $line);
      print join(" ", timeStamps(@time)); print "\n";
   }
   close(FILE);
}

unless (caller) {
   main($ARGV[0]);
}