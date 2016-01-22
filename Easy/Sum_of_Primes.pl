#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub isPrime {
  my $n = $_[0];
  my $sqrt = sqrt($n);
  for(my $i=2; $i<=$sqrt; $i++) {
    return 0 if $n%$i==0;
  }
  return 1;
}

sub main {
    my $sum = 0;
    my $count = 0;
    my $n = 2;
    while ($count<1000) {
      if (isPrime($n)) {
        $sum+=$n; $count++;
        }; $n++;
    }
    print $sum;
}

unless (caller) {
  main();
}