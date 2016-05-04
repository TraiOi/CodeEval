#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub multiplesOfANumber {
  my $x = $_[0];
  my $n = $_[1];
  my $num = 1;
  for(my $i=0; $i<=$x; $i++) {
    $num = $n*$i;
    return $num if ($num>=$x);
  }
}

sub main {
  open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!\n.";
  while (my $line = <FILE>) {
    next if $line =~ m/^\s$/;
    $line =~ s/(^\s|\s*$)//g;
    my @num = split(",", $line);
    print multiplesOfANumber($num[0], $num[1]); print "\n";
  }
  close(FILE);
}

unless (caller) {
  main($ARGV[0]);
}