#!/usr/bin/perl

$str = "01000";
$str =~ s/0$//g;

print length $str;
