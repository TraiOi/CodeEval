#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub splitTheNumber {
  my $numbers = $_[0];
  my $patterns = $_[1];
  $patterns =~ m/[\+-]/;
  my $index = index($patterns, $&);
  my $substr_1 = substr($numbers, 0, $index);
  my $substr_2 = substr($numbers, $index, length($numbers));
  return ($& eq '+') ? $substr_1+$substr_2 : $substr_1-$substr_2;
}
 
sub main {
  open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!\n.";
  while (my $line = <FILE>) {
    next if $line =~ m/^\s$/;
    $line =~ s/(^\s|\s*$)//g;
    my @input = split(" ", $line);
    print splitTheNumber($input[0], $input[1]); print "\n";
  }

  close(FILE);
}

unless (caller) {
  main($ARGV[0]);
}