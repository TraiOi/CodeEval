#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub swapCase {
  foreach my $word (@_) {
    if (ord($word)>=97 && ord($word)<=122) {
      $word = uc($word);
    } elsif (ord($word)>=65 && ord($word)<=90) {
      $word = lc($word);
    }
  }

  return join("", @_);
}

sub main {
  my $sum = 0;
  open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!\n.";
  while (my $line = <FILE>) {
    next if $line =~ m/^\s$/;
    $line =~ s/(^\s|\s*$)//g;
    my @words = split("", $line);
    print swapCase(@words); print "\n";
  }
}

unless (caller) {
  main($ARGV[0]);
}