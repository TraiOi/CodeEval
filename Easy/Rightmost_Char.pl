#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub rightmostChar {
  my $string = $_[0];
  my $char = $_[1];
  return rindex($string, $char);
}

sub main {
  open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!\n.";
  while (my $line = <FILE>) {
    next if $line =~ m/^\s$/;
    $line =~ s/(^\s|\s*$)//g;
    my @string = split(",", $line);
    print rightmostChar($string[0], $string[1]); print "\n";
  }

  close(FILE);
}

unless (caller) {
  main($ARGV[0]);
}