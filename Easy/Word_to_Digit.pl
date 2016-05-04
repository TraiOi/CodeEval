#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub wordToDigit {
  my @result = ();
  foreach my $word (@_) {
    if ($word eq "zero") { 
      push(@result, 0);
    } elsif ($word eq "one") {
      push(@result, 1);
    } elsif ($word eq "two") {
      push(@result, 2);
    } elsif ($word eq "three") {
      push(@result, 3);
    } elsif ($word eq "four") {
      push(@result, 4);
    } elsif ($word eq "five") {
      push(@result, 5);
    } elsif ($word eq "six") {
      push(@result, 6);
    } elsif ($word eq "seven") {
      push(@result, 7);
    } elsif ($word eq "eight") {
      push(@result, 8);
    } else { push(@result, 9); }
  }

  return join("", @result);
}
 
sub main {
  open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!\n.";
  while (my $line = <FILE>) {
    next if $line =~ m/^\s$/;
    $line =~ s/(^\s|\s*$)//g;
    my @numbers = split(";", $line);
    print wordToDigit(@numbers); print "\n";
  }

  close(FILE);
}

unless (caller) {
  main($ARGV[0]);
}