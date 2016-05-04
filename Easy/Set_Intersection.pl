#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub setIntersection {
  my $first = $_[0]; my @first_array = split(",", $first);
  my $second = $_[1]; my @second_array = split(",", $second);
  my %first_hash = map{$_ =>1} @first_array;
  my @result = grep( $first_hash{$_}, @second_array);

  return join(",", @result);
}

sub main {
  open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!\n.";
  while (my $line = <FILE>) {
    next if $line =~ m/^\s$/;
    $line =~ s/(^\s|\s*$)//g;
    my @num = split(";", $line);
    print setIntersection($num[0], $num[1]); print "\n";
  }

  close(FILE);
}

unless (caller) {
  main($ARGV[0]);
}