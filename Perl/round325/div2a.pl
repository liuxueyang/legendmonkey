#!/usr/bin/perl
chomp($_ = <STDIN>);
chomp($line = <STDIN>);
@ar = split / /, $line;
$all = join('', @ar);

$all =~ /^0*(.*?)0*$/;
$match = $1;

$match =~ s/00+//g;

print length $match;

