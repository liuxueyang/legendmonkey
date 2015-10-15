#!/usr/bin/perl

while (<>) {
    chomp;
    $n = $_;
    @p = ();
    @a = ();
    
    for ( 1..$n ) {
        $line = <>;
        chomp($line);
        ($a0, $p0) = split / /, $line;
        
        push @a, $a0;
    
            if ( ($len = @p) == 0 || $p0 < $p[-1] ) {
                push @p, $p0;
            } else {
                push @p, $p[-1];
            }
    
    }
    $sum = 0;
    
    for ( 0..($n-1) ) {
        $sum += $a[$_] * $p[$_];
    }
    $\ = $/;    
    print $sum;
}
