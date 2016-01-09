#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;


sub main {
  my $sum = 0;
  open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!\n.";
  while (my $line = <FILE>) {
    next if $line =~ m/^\s$/;
    $line =~ s/(^\s|\s*$)//g;
    $sum += $line;
  }; print $sum;

  close(FILE);
}

unless (caller) {
  main($ARGV[0]);
}