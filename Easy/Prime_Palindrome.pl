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

sub isPrimePalindrome {
  my $n = $_[0];
  my @n_array = split("", $n);
  my $len = scalar(@n_array);
  for(my $i=0; $i<$len/2; $i++) {
    return 0 if $n_array[$i]!=$n_array[$len-$i-1]; 
  }
  return 1;
}

sub main {
  my $num = 0;
  for(my $i=2; $i<1000; $i++) {
    if (isPrime($i)) {
      $num = $i if (isPrimePalindrome($i));
    }
  }
  print $num;
}

unless (caller) {
  main();
}