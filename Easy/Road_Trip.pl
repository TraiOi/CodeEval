#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub roadTrip {
  my @lines = split("; ", $_[0]);
  my @distances = ();
  foreach my $distance (@lines) {
    $distance =~ m/\D+(\d+)/;
    push(@distances, $1);
  }
  @distances = sort{$a<=>$b} @distances;
  my @result = ();
  push(@result, $distances[0]);
  for(my $i=1; $i<scalar(@distances); $i++) {
    push(@result, $distances[$i]-$distances[$i-1]);
  }

  return join(",", @result);

}
 
sub main {
  open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!\n.";
  while (my $line = <FILE>) {
    next if $line =~ m/^\s$/;
    $line =~ s/(^\s|\s*$)//g;
    print roadTrip($line); print "\n";
  }

  close(FILE);
}

unless (caller) {
  main($ARGV[0]);
}