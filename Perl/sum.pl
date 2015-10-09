#!/usr/bin/perl -wn

#while (<>)
#{
@temp = split / /;
if ($temp[1] !~ /cell1/) {
    $sum0 += $temp[1];
    print "$sum0\n";
}
#}
