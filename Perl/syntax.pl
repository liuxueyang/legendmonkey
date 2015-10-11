#!/usr/bin/perl

$rex = qr/my.STRING/is;
print $rex;
print "\n";

@fields = split(/\b(?:a|b|c)\b/, "liu a xue b yang c love");
print join "&", @fields;

   
