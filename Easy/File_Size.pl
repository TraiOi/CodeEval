#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

sub fileSize {
  return -s $_[0];
}

sub main {
  print fileSize($_[0]);
}

unless (caller) {
  main($ARGV[0]);
}