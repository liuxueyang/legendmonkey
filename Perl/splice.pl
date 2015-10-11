#!/usr/bin/perl

my @ar = (1, 2, 3, 4, 5);
splice @ar, 2, 2;
print "@ar\n"; # 1 2 5

splice @ar, 2, 0, (3, 4);
print "@ar\n";

