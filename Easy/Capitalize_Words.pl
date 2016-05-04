#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub capitalizeWords {
  my @words = split(" ", $_[0]);
  foreach my $word (@words) {
    $word = ucfirst($word);
  }

  return join(" ", @words);
}

sub main {
  open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!\n.";
  while (my $line = <FILE>) {
    next if $line =~ m/^\s$/;
    $line =~ s/(^\s|\s*$)//g;
    print capitalizeWords($line); print "\n";
  }

  close(FILE);
}

unless (caller) {
  main($ARGV[0]);
}