#!/usr/bin/perl -w
$_ = <>;
chomp;
my $n = $_;

my $m = sqrt;

my @flag = ();

for (2..$m) {
    $flag[$_] = 1;
}
my $i;
my $j;
my $len_prime;
my @nums;
my @prime;
my $re;


for ( $i = 2; $i <= $m; ++$i) {
    if ( $flag[$i] == 1 ) {
        for ( $j = $i * 2; $j <= $m; $j += $i) {
            $flag[$j] = 0;
        }
    }
}
for ( $i = 2; $i <= $m; ++$i ) {
    if ( $flag[$i] == 1 ) {
        push @prime, $i;
    }
}
#print "@prime\n";

$len_prime = @prime;
$i = 0;
$nums[0] = 1;

while ( $n > 1 ) {
    last unless defined $prime[$i];
    
    while ( $n % $prime[$i] == 0) {
        if ( $nums[-1] != $prime[$i] ) {
            push @nums, $prime[$i];
        }
        $n /= $prime[$i];
    }
    $i++;
}
push @nums, $n;

$re = 1;
for ( @nums ) {
    $re *= $_;
}
$\ = $/;

print $re;
