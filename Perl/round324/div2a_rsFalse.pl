($n, $_) = split ' ', <>;
print /${n}0/ ? -1 : $_ . 0 x ($n - length)
