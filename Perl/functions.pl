#!/usr/bin/perl -w
# some useful functions..
# Author: liuxueyang <aries@Jemir>
# Created: 13 Oct 2015
# Version: 0.01

# use warnings;
# use strict;
# use 5.014;

print replace_substr_with_index(@ARGV), "\n";

# print replace_substr_with_index("abbccc", "ccc", "ddd");


# ========================================
# ========================================
# ========================================

sub replace_substr_with_index {
    $i = 0;
    ($str, $substr, $newsubstr) = @_;
    
    while ( -1 != ($current = index($str, $substr, $i)) ) {
        substr $str, $current, length($substr), $newsubstr;
        $i = $current + length($newsubstr);
    }
    $str;
}

sub repalce_substr_with_rindex {
    ($str, $substr, $newsubstr) = @_;
    $i = length($str);
    
    while ( -1 != ($current = rindex($str, $substr, $i)) ) {
        
    }
}

