#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub testing {
  my @first = split("", $_[0]);
  my @second = split("", $_[1]);
  my $count = 0;
  for(my $i=0; $i<scalar(@first); $i++) {
    $count++ if ($first[$i] ne $second[$i]);
  }
  
  if ($count>6) {
    return "Critical";
  } elsif ($count<=6 && $count>4) {
    return "High";
  } elsif ($count<=4 && $count>2) {
    return "Medium";
  } elsif ($count<=2 && $count>0) {
    return "Low";
  } else { return "Done"; }
}
 
sub main {
  open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!\n.";
  while (my $line = <FILE>) {
    next if $line =~ m/^\s$/;
    $line =~ s/(^\s|\s*$)//g;
    my @input = split(/\|/, $line);
    $input[0] =~ s/(\s)//g;
    $input[1] =~ s/(\s)//g;
    print testing($input[0], $input[1]); print "\n";
  }

  close(FILE);
}

unless (caller) {
  main($ARGV[0]);
}