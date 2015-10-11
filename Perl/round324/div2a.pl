#!/usr/bin/perl -wn
use bigint;
chomp;
($n, $t) = split / /;
$start = 10 ** ($n - 1);
$end = 10 ** $n - 1;
if ($end < $t) {
    print "-1\n";
    next;
} elsif ($start <= $t && $end >= $t) {
    print "$t\n";
    next;
}
while ($start <= $end) {
    if ($start % $t == 0) {
	print $start, "\n";
	last;
    } else { 
	($start += 1);
    }
}
print "-1", "\n" if $start > $end;
