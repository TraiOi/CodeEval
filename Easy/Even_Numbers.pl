#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub evenNumbers {
  ($_[0]%2==0) ? return 1 : return 0;
}
 
sub main {
  open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!\n.";
  while (my $line = <FILE>) {
    next if $line =~ m/^\s$/;
    $line =~ s/(^\s|\s*$)//g;
    print evenNumbers($line); print "\n";
  }

  close(FILE);
}

unless (caller) {
  main($ARGV[0]);
}