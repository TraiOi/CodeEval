#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub fibonacciSeries {
  my $path = $_[0];
  my @fib = (0, 1);
  my $tmp = 0;
  for(my $i=1; $i<$path; $i++) {
    $tmp = $fib[-2] + $fib[-1];
    push(@fib, $tmp);
  }
  return $fib[0] if $path == 0;
  return $fib[-1];
}

sub main {
  open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!\n.";
  while (my $line = <FILE>) {
    next if $line =~ m/^\s$/;
    $line =~ s/(^\s|\s*$)//g;
    print fibonacciSeries($line); print "\n";
  }
}

unless (caller) {
  main($ARGV[0]);
}