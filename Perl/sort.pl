#!/usr/bin/perl -w

@unsorted = qw/Schumacher Hill Alesi Villeneuve Coulthard/;

@sorted = sort { $a cmp $b } @unsorted;

print "@sorted\n";

sub honestly {
    return -1 if $a eq "Hill";
    $a cmp $b;
}

@sorted1 = sort honestly @unsorted;

print "@sorted1\n";

@lst = (5, 4, 3, 2, 1);

print "@lst\n";

sub four_first {
    return -1 if $a == 4;
    return 1 if $b == 4;
    $a <=> $b;
}

@lst_sorted = sort four_first @lst;

print "@lst_sorted\n";

%constructors = (
    "Williams" => "Renault",
    "McLaren"  => "Mercedes",
    "Benetton" => "Renault",
    "Ferrari"  => "Ferrari",
    "Arrows"   => "Yamaha",
    );

#@teams = sort keys %constructors;

for (sort keys %constructors) {
    print $_, "-", $constructors{$_}, "\n";
}

print "-" x 20, "\n";

for (sort { $constructors{$a} cmp $constructors{$b} } 
     keys %constructors) {
    print $_, "-", $constructors{$_}, "\n";
}

sub myway {
    $constructors{$a} ne $constructors{$b} ? 
	return $constructors{$a} cmp $constructors{$b} :
	$a cmp $b;
}

print "-" x 20, "\n";

for (sort myway keys %constructors) {
    print $_, "-", $constructors{$_}, "\n";
}

($a, $b) = (2, 3);
$c = $a == $b ? 10 : 20;
print "c = $c\n";

sub add1 {
    $a = shift;
    $a + 1;
}

print add1(2), "\n";

$str = "ab cd ef";
if ($str =~ /(\w+)(\w+)/) {
    print $1, "-", $2, "\n";
}

$str = "Diggle and Shelley are friends...";
if ($num = $str =~ /Diggle|Shelley/) {
    print "we found Diggle or Steve!\n";
}

print "num = $num\n";
$str .= "this is nothing. this is already.";
if ($num = $str =~ s/this/that/g) {
    print qq{Replaced $num occurance(s) of "this"\n};
}
print "num = $num\n";
