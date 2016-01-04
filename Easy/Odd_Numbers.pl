#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;


sub main {
  for(my $i=1; $i<=99; $i+=2) {
    print "$i\n";
  }
}

unless (caller) {
  main();
}