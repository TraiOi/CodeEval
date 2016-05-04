#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub stringMask {
  my $word = $_[0]; my $bin = $_[1];
  my @word_array = split("", $word); my $len = scalar(@word_array);
  my @bin_array = split("", $bin);
  my @result = ();
  for(my $i=0; $i<$len; $i++) {
    if ($bin_array[$i] == 1) {
      push(@result, uc($word_array[$i]));
    } else {
      push(@result, $word_array[$i]);
    }
  }

  return join("", @result);
}

sub main {
  open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!.\n";
  while (my $line = <FILE>) {
    next if $line =~ m/^\s$/;
    $line =~ s/(^\s|\s*$)//g;
    my @words = split(" ", $line);
    print stringMask($words[0], $words[1]); print "\n";
  }
  close(FILE);
}

unless (caller) {
  main($ARGV[0]);
}