use warnings;
use strict;
use Smart::Comments;
use List::Util qw/ first/;

# I need to addmint that I don't have any good idea of this. so I search the Int to get some sparks
# in the https://www.nayuki.io/page/next-lexicographical-permutation-algorithm
# There is an algo

my @arr_next = qw( 0 1 2 3 4 5 6 7 8 9 );
my $n = 1;
print "$n\t||@arr_next\n";
while (1){
    $n++;
    @arr_next =next_permutation( @arr_next);
    print "$n\t||@arr_next\n";
    last if @arr_next < 2;
    last if $n > 1000000;
}


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

