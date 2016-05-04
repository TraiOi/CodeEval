#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub trickOrTreat {
  my $candies = $_[3]*($_[0]*3 + $_[1]*4 + $_[2]*5);
  my $children = $_[0] + $_[1] + $_[2];

  return int($candies/$children);
}
 
sub main {
  open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!\n.";
  while (my $line = <FILE>) {
    next if $line =~ m/^\s$/;
    $line =~ s/(^\s|\s*$)//g;
    $line =~ m/Vampires: (\d+), Zombies: (\d+), Witches: (\d+), Houses: (\d+)/;
    print trickOrTreat($1, $2, $3, $4); print "\n";
  }

  close(FILE);
}

unless (caller) {
  main($ARGV[0]);
}