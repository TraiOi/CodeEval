#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub findAWriter {
  my @text = split("", $_[0]);
  my @index = split(" ", $_[1]);
  my @result = ();
  foreach my $num (@index) {
    push(@result, $text[$num-1]);
  }

  return join("", @result);
}
 
sub main {
  open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!\n.";
  while (my $line = <FILE>) {
    next if $line =~ m/^\s$/;
    $line =~ s/(^\s|\s*$)//g;
    my @input = split(/\|/, $line);
    print findAWriter($input[0], $input[1]); print "\n";
  }
}

unless (caller) {
  main($ARGV[0]);
}