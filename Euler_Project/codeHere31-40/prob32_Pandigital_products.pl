# We could standing by the shoulder of the problem 24
# We first find the next permutation, and than use this permutation to see whether it could be a
# product of two numbers.

=head1 Notice
##############################################
# There are 9 sets here and 2 numbers are repeated

12,483,5796
18,297,5346
27,198,5346
28,157,4396
39,186,7254
4,1738,6952
4,1963,7852
42,138,5796
48,159,7632

56370

=cut

use List::Util qw/ first/;

# I need to addmint that I don't have any good idea of this. so I search the Int to get some sparks
# in the https://www.nayuki.io/page/next-lexicographical-permutation-algorithm
# There is an algo

my @arr_next = qw( 1 2 3 4 5 6 7 8 9 );
my $n        = 1;
my $sum;
while (1) {    ### Evaluating [===|    ] % done

#print "@arr_next\n";
    # determine
    # 1 4 4
    my $a    = join "", @arr_next[0];
    my $b    = join "", @arr_next[ 1 .. 4 ];
    my $prod = join "", @arr_next[ 5 .. 8 ];

    if ($a * $b == $prod){$sum += $prod;print "$a,$b,$prod\n"; }

    # 2 3 4
    my $a    = join "", @arr_next[ 0 .. 1 ];
    my $b    = join "", @arr_next[ 2 .. 4 ];
    my $prod = join "", @arr_next[ 5 .. 8 ];

    if ($a * $b == $prod){$sum += $prod;print "$a,$b,$prod\n"; }

    last if @arr_next == qw/ 9 8 7 6 5 4 3 2 1/;

    @arr_next = next_permutation(@arr_next);
    $n++;
}

print "$sum\n";

# input an @array
sub next_permutation {

    my @arr = @_;

    # find the longest non-increasing suffix
    my $pivot_index = first { $arr[ $_ - 1 ] < $arr[$_] } reverse( 1 .. $#arr );
    $pivot_index--;

    return 0 if $pivot_index < 0;

    # find the rightmost successor to pivot in the suffix
    my $successor = first { $arr[$_] > $arr[$pivot_index] }
    reverse( ( $pivot_index + 1 ) .. $#arr );

    # swap the pivot and successor
    # use new style
    ( $arr[$successor], $arr[$pivot_index] ) =
      ( $arr[$pivot_index], $arr[$successor] );

    # reverse the suffix
    @arr[ ( $pivot_index + 1 ) .. $#arr ] =
      reverse @arr[ ( $pivot_index + 1 ) .. $#arr ];

    return @arr;
}

