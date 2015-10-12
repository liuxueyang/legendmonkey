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


