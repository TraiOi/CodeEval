#!/usr/bin/perl -w

use 5.14.2;
use warnings;
use strict;

open(INFILE, "<", $ARGV[0]) or die("[-] Cannot open file $ARGV[0] for reading: $!");
while(my $line = <INFILE>) {
   next if($line =~ m/^\s$/);  # skip blank lines
   $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
   my @opqr = split(" ", $line);
   my $o = $opqr[0]; my $p = $opqr[1];
   my $q = $opqr[2]; my $r = $opqr[3];
   if ($o==$q && $p==$r) {
      print "here\n";
   } elsif ($q>$o && $r>$p) {
      print "NE\n";
   } elsif ($q>$o && $r==$p) {
      print "E\n";
   } elsif ($q>$o && $r<$p) {
      print "SE\n";
   } elsif ($q==$o && $r<$p) {
      print "S\n";
   } elsif ($q<$o && $r<$p) {
      print "SW\n";
   } elsif ($q<$o && $r==$p) {
      print "W\n";
   } elsif ($q<$o && $r>$p) {
      print "NW\n";
   } else { print "N\n"; }
}
close(INFILE);