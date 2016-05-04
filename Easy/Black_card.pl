#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub blackCard {
  my @names = split(" ", $_[0]);
  my $number = $_[1];
  $number =~ s/(^\s|\s*$)//g;
  my $index = 0;
  my $count = 0;
  while (scalar(@names)>1) {
    $count++;
    if ($count==$number) {
      $count=0;
      splice(@names, $index, 1);
      $index=0;
    } else { $index++; }
    $index %= scalar(@names);
  }
  return @names;
  
}

 
sub main {
  open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!\n.";
  while (my $line = <FILE>) {
    next if $line =~ m/^\s$/;
    $line =~ s/(^\s|\s*$)//g;
    my @input = split(/\|/, $line);
    print blackCard($input[0], $input[1]); print "\n";
  }

  close(FILE);
}

unless (caller) {
  main($ARGV[0]);
}