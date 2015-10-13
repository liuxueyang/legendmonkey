#!/usr/bin/perl -w
# count_substr_with_index.pl --- xueyang
# Author: liuxueyang <aries@Jemir>
# Created: 13 Oct 2015
# Version: 0.01

#use warnings;
#use strict;

($str, $substr) = @ARGV;

$i = 0;
while ( -1 != ($current = index($str, $substr, $i)) ) {
    push @found, $current;
    $i = $current + 1;
};
$\ = $/;
        
print "found at $_" for @found;
        

__END__

=head1 NAME

count_substr_with_index.pl - Describe the usage of script briefly
perl count_substr_with_index.pl abcsdfabcasegabc abc

=head1 SYNOPSIS

count_substr_with_index.pl [options] args

      -opt --long      Option description

=head1 DESCRIPTION

Stub documentation for count_substr_with_index.pl, 

=head1 AUTHOR

liuxueyang, E<lt>aries@JemirE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2015 by liuxueyang

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.2 or,
at your option, any later version of Perl 5 you may have available.

=head1 BUGS

None reported... yet.

=cut
