#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub swapNumbers {
  my @lines = split(" ", $_[0]);
  foreach my $word (@lines) {
  my ($num1, $num2) = $word =~ m/(\d)\w+(\d)/;
  $word =~ s/^\d/$num2/;
  $word =~ s/\d$/$num1/;
  }

  return join(" ", @lines);
}
 
sub main {
  open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!\n.";
  while (my $line = <FILE>) {
    next if $line =~ m/^\s$/;
    $line =~ s/(^\s|\s*$)//g;
    print swapNumbers($line); print "\n";
  }

  close(FILE);
}

unless (caller) {
  main($ARGV[0]);
}