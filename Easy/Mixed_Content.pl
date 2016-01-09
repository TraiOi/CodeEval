#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub mixedContent {
  my @words_digits = split(",", $_[0]);
  my @words = ();
  my @digits = ();
  foreach my $var (@words_digits) {
    $var =~ m/([a-z]+)/ ? push(@words, $var) : push(@digits, $var);
  }
  my $words = join(",", @words);
  my $digits = join(",", @digits);
  
  if (!@words) {
    return $digits;
  } elsif (!@digits) {
    return $words
  } else {
    return $words."|".$digits;
  }
}
 
sub main {
  open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!\n.";
  while (my $line = <FILE>) {
    next if $line =~ m/^\s$/;
    $line =~ s/(^\s|\s*$)//g;
    print mixedContent($line); print "\n";
  }

  close(FILE);
}

unless (caller) {
  main($ARGV[0]);
}