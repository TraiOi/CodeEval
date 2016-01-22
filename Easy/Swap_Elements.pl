#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub swapElements {
  my @numbers = split(" ", $_[0]);
  my @swap = split(", ", $_[1]);
  for(my $i=0; $i<scalar(@swap); $i++) {
    my @element = split("-", $swap[$i]);
    ($numbers[$element[0]], $numbers[$element[1]]) = ($numbers[$element[1]], $numbers[$element[0]]);
  }

  return join(" ", @numbers);
}
 
sub main {
  open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!\n.";
  while (my $line = <FILE>) {
    next if $line =~ m/^\s$/;
    $line =~ s/(^\s|\s*$)//g;
    my @input = split(":", $line);
    print swapElements($input[0], $input[1]); print "\n";
  }
  close(FILE);
}

unless (caller) {
  main($ARGV[0]);
}