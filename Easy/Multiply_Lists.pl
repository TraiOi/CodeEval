#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub multiplyLists {
  my @list_1 = split(" ", $_[0]);
  my @list_2 = split(" ", $_[1]);
  my @result = ();
  for(my $i=0; $i<scalar(@list_1); $i++) {
    push(@result, $list_1[$i]*$list_2[$i]);
  }

  return join(" ", @result);
}
 
sub main {
  open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!\n.";
  while (my $line = <FILE>) {
    next if $line =~ m/^\s$/;
    $line =~ s/(^\s|\s*$)//g;
    my @input = split(/\|/, $line);
    print multiplyLists($input[0], $input[1]); print "\n";
  }

  close(FILE);
}

unless (caller) {
  main($ARGV[0]);
}