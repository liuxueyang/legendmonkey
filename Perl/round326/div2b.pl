#!/usr/bin/perl
while ( <> ) {
    chomp;
    $n = $_;
    
    for (1..sqrt($n)) {
        while ( $n % $_ == 0 ) {
            push @prime, $_;
            $n /= $_;
            
        }
    }
    $a = 2
    while ( $n > 1 ) {
    }
}
