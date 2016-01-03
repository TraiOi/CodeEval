#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;
use List::MoreUtils qw(first_index);

sub dataRecovery {
  my $text = $_[0];
  my $num = $_[1];
  my @text_array = split(" ", $text); my $len = @text_array;
  my @num_array = split(" ", $num);
  foreach my $var (@num_array) { $var = $var-1; }
  my @result = ();
  for(my $i=0; $i<$len; $i++) {
    if (grep(/^$i$/, @num_array)) {
      my $index = first_index { $_ eq $i } @num_array;
      push(@result, $text_array[$index]);
    } else {
      push(@result, $text_array[$i]);
    }
  }

  return join(" ", @result);
}

sub main {
   open(FILE, "<", $_[0]) or die "[-] Cannot open file $_[0] for reading: $!.\n";
   while (my $line = <FILE>) {
      next if $line =~ m/^\s$/;
      $line =~ s/(^\s|\s*$)//g;
      my @data = split(";", $line);
      print dataRecovery($data[0], $data[1]); print "\n";
   }
   close(FILE);
}

unless (caller) {
   main($ARGV[0]);
}