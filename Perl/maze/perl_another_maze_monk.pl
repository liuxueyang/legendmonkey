#!/usr/bin/perl
use strict;
use warnings;

my ($maxx, $maxy) = (shift || 11, shift || 11);
$maxx--;
$maxy--;
$_ < 1 and die for $maxx, $maxy;

my @maze;
my @visited;

my $ne = "\xe2\x95\xb1";
my $nw = "\xe2\x95\xb2";
# Use these if UTF8 diagonals are not available
# $ne = '/';
# $nw = '\\';

sub init {
    for my $j (0 .. $maxy) {
        for my $i (0 .. $maxx) {
            $maze[$i][$j] = '.';
        }
    }

    # start
    $maze[0][0] = $nw;
    $maze[1][0] = $nw;

    # top
    for (my $i = 2; $i <= $maxx; $i += 2) {
        $maze[$i][0] = $ne;
        $maze[$i+1][0] = $nw;
    }

    # left & right
    for my $i (0, $maxx) {
        for my $j (1 .. $maxy) {
            if ($maze[$i][$j-1] eq $ne) {
                $maze[$i][$j] = $nw;
            } else {
                $maze[$i][$j] = $ne;
            }
        }
    }

    # bottom
    for my $i (1 .. $maxx) {
        if ($maze[$i-1][$maxy] eq $ne) {
            $maze[$i][$maxy] = $nw;
        } else {
            $maze[$i][$maxy] = $ne;
        }
    }

    # bottom-right
    $maze[$maxx][$maxy] = $nw;

    # random inside
    for my $i (1 .. $maxx - 1) {
        for my $j (1 .. $maxy - 1) {
            $maze[$i][$j] = int rand 2 ? $ne : $nw;
        }
    }
} # init

sub show {
    for my $j(0 .. $maxy) {
        for my $i (0 .. $maxx) {
            # show all if top left is not visited
            if (! $visited[0][0] or $visited[$i][$j]) {
                print $maze[$i][$j];
            } else {
                print '?';
            }
        }
        print "\n";
    }
} # show

# turn face 45 degrees left
sub left {
    my($x, $y, $count) = @_;
    for (1 .. $count) {
        if ($y == 0) {
            $y = -1 * $x;
        } elsif ($x == 0) {
            $x = $y;
        } elsif ($x == $y) {
            $y = 0;
        } else { # $x != $y
            $x = 0;
        }
    }
    return($x, $y);
} # left

sub visit {
  @visited = map [ 0, (0) x $maxy ], 0 .. $maxx;
  $visited[0][0] = 1;
  my($x, $y) = (0, 0);
  my $face = [1, 1];

  while ($visited[1][0] == 0) {
      my $current = $maze[$x][$y];
      my ($lookx, $looky) = left(@$face, 1);
      if ($current eq $maze[$x+$lookx][$y+$looky]) {
          if ($current eq $maze[$x+$face->[0]][$y+$face->[1]]) {
              $x += $face->[0];
              $y += $face->[1];
          } else {
              ($lookx, $looky) = left(@$face, 7);
              if ($current eq $maze[$x+$lookx][$y+$looky]) {
                  $face = [ left(@$face, 4) ];
              } else {
                  $x += $lookx;
                  $y += $looky;
                  $face = [ left(@$face, 6) ];
              }
          }
      } else {
          $x += $lookx;
          $y += $looky;
          $face = [ left(@$face, 2) ];
      }
      $visited[$x][$y]++;

    # exit reached, turn back
      if($y == $maxy and $x >= $maxx - 1 and $maze[$x][$y] eq $nw) {
          if ($x != $maxx) {
              $x = $maxx;
          } else {
              $y = $maxy - 1;
          }
          $face = [-1, -1];
          $visited[$x][$y]++;
      }
  }
} # visit

sub not_connected {
    my @n;
    for my $j (1 .. $maxy - 1) {
        for my $i( 0 .. $maxx) {
            if (not $visited[$i][$j]) {
                if ($i > 1 and $visited[$i-1][$j]) {
                    push @n, [$i, $j, -1];
                } elsif ($i < $maxx-1 and $visited[$i+1][$j]) {
                    push @n, [$i, $j, 1];
                }
            }
        }
    }
    return @n;
} # not_connected

init();
show();
visit();
while (my @change = not_connected()) {

    # comment next line to hide progress
    show();

    #  for(0 .. int(rand $#change)/100){

    my ($i, $j, $looki) = @{ $change[int rand $#change] };
    my $current = $maze[$i+$looki][$j];
    print STDERR "Fill $i(+$looki):$j ($#change remanining)\n";
    $maze[$i+$looki][$j] = $current eq $nw ? $ne : $nw;
    #  }
    visit();
}


print "\n";
$visited[0][0] = 0; # force to show unvisited
show();
