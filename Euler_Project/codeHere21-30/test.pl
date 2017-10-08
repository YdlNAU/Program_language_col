my @arr_next = qw( 1 2 3 4 5 6 7 8 9 );
my $n = 1;
my $sum;
### $n

    # determine
    # 1 4 4
    my $a = join "", @arr_next[0];
    my $b = join "",@arr_next[1 .. 4];
    my $prod = join "",@arr_next[5 .. 8];

print "$a\n$b\n$prod\n";

__END__
    $sum += $prod if $a * $b == $prod;
    # 4 1 4
    my $a = join  @arr_next[0 .. 3];
    my $b = join  @arr_next[4];
    my $prod = join @arr_next[5 .. 8];

    $sum += $prod if $a * $b == $prod;

    # 2 3 4
    my $a = join  @arr_next[0 .. 1];
    my $b = join  @arr_next[2 .. 4];
    my $prod = join @arr_next[5 .. 8];

    $sum += $prod if $a * $b == $prod;

    # 3 2 4
    my $a = join  @arr_next[0 .. 2];
    my $b = join  @arr_next[3 .. 4];
    my $prod = join @arr_next[5 .. 8];

    $sum += $prod if $a * $b == $prod;

