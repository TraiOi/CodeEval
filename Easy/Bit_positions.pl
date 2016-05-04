#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub bitPositions {
  return ((sprintf("%b", $_[0] >> $_[1]-1) & 1) == (sprintf("%b", $_[0] >> $_[2]-1) & 1)) ? "true" : "false";
}
 
sub main {
  open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!\n.";
  while (my $line = <FILE>) {
    next if $line =~ m/^\s$/;
    $line =~ s/(^\s|\s*$)//g;
    my @data = split(",", $line);
    print bitPositions($data[0], $data[1], $data[2]); print "\n";
  }

  close(FILE);
}

unless (caller) {
  main($ARGV[0]);
}