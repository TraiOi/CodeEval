#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub simpleSorting {
  return join(" ", sort {$a<=>$b} @_);
}

sub main {
  open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!\n.";
  while (my $line = <FILE>) {
    next if $line =~ m/^\s$/;
    $line =~ s/(^\s|\s*$)//g;
    my @num = split(" ", $line);
    print simpleSorting(@num); print "\n";
  }

  close(FILE);
}

unless (caller) {
  main($ARGV[0]);
}