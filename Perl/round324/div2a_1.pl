#!/usr/bin/perl -wn
chomp;
($n, $t) = split / /;
$\ = $/;
if ( $n == 1 ) {
    print $t != 10 ? "$t" : "-1"; next;
}
$\ = '';

print "$t";
for ( 1..($n - length $t) ) {
    print "0";
}
print "\n";

