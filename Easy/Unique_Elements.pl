#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub uniq {
  my %seen;
  grep !$seen{$_}++, @_;
}

sub uniqueElements {
  return join(",", sort { $a<=>$b } (uniq(@_)));
}

sub main {
  my $sum = 0;
  open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!\n.";
  while (my $line = <FILE>) {
    next if $line =~ m/^\s$/;
    $line =~ s/(^\s|\s*$)//g;
    my @num = split(",", $line);
    print uniqueElements(@num); print "\n";
  }

  close(FILE);
}

unless (caller) {
  main($ARGV[0]);
}