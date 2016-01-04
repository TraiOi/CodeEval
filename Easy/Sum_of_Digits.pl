#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub sumOfDigits {
  my $sum = 0;
  foreach my $digit (@_) {
    $sum+=$digit;
  }

  return $sum;
}

sub main {
  open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!\n.";
  while (my $line = <FILE>) {
    next if $line =~ m/^\s$/;
    $line =~ s/(^\s|\s*$)//g;
    my @digits = split("", $line);
    print sumOfDigits(@digits); print "\n";
  }
}

unless (caller) {
  main($ARGV[0]);
}