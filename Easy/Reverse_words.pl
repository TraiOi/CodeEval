#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub reverseWords {
  return join(" ", reverse(@_));
}

sub main {
  open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!.\n";
  while (my $line = <FILE>) {
    next if $line =~ m/^\s$/;
    $line =~ s/(^\s|\s*$)//g;
    my @words = split(" ", $line);
    print reverseWords(@words); print "\n";
  }
  close(FILE);
}

unless (caller) {
  main($ARGV[0]);
}