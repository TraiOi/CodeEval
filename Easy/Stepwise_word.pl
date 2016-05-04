#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub stepwiseWord {
  my @words = split(" ", $_[0]);
  my $longest_word = "";
  foreach my $word (@words) { 
    my $len = length($word);
    my $len_l = length($longest_word);
    $longest_word = $word if ($len>$len_l); 
  }
  my @result = split("", $longest_word);
  for(my $i=0; $i<scalar(@result); $i++) {
    $result[$i] = ("*"x$i).$result[$i];
  }

  return join(" ", @result);
}
 
sub main {
  open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!\n.";
  while (my $line = <FILE>) {
    next if $line =~ m/^\s$/;
    $line =~ s/(^\s|\s*$)//g;
    print stepwiseWord($line); print "\n";
  }

  close(FILE);
}

unless (caller) {
  main($ARGV[0]);
}