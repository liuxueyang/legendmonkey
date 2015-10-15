#!/usr/bin/perl
$\ = $/;

$rex = qr/my.STRING/is;
print $rex;

@fields = split(/\b(?:a|b|c)\b/, "liu a xue b yang c love");
print join "&", @fields;

$text_to_search = "example text with [foo] and more";
$search_string = quotemeta "[foo]";
print "search_string = $search_string";

print "wee" if $text_to_search =~ /$search_string/;

$str = "abcde";
print length $str;
print rindex $str, "d";
print rindex $str, "e";
print rindex $str, "e", length $str;
print rindex $str, "e", length $str + 100;
print rindex $str, "e", length $str + 1;
print rindex $str, "e", length $str - 1;

