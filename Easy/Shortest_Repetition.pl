#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub shortRepetition {
  my $string = $_[0];
  my $substr = "";
  for(my $i=0; $i<=length($string); $i++) {
    $substr = substr($string, 0, $i);
    my @result = split($substr, $string);
    return length($substr) if (!@result);
  }
}
 
sub main {
  open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!\n.";
  while (my $line = <FILE>) {
    next if $line =~ m/^\s$/;
    $line =~ s/(^\s|\s*$)//g;
    print shortRepetition($line); print "\n";
  }

  close(FILE);
}

unless (caller) {
  main($ARGV[0]);
}