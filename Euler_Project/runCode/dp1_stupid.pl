use strict;
use warnings;
use List::Util qw/ max reduce /;

# problem 18

my ( $row, @data );
while (<DATA>) {
    $row++;
    my @arr = split;
    $data[$row]->[0] = 0;
    for ( 0 .. $#arr ) {
        $data[$row]->[ $_ + 1 ] = $arr[$_];
    }

}

# solve this problem with dynamic programming;
# following is the bad code

foreach my $first_col ( 1 .. $#{ $data[15] } ) {
    my $tmp_sum = $data[15][$first_col];
    print "$tmp_sum,";
    my $col = $first_col;
    for my $row ( reverse( 1 .. $#data - 1 ) ) {

        # adjacent numbers by col
        my @array;
        my $max_index = $#{ $data[ $row + 1 ] };

        if ( $col == 1 ) {
            push @array, 1;
        }
        elsif ( $col == $max_index ) {
            push @array, $col - 1;
        }
        else {
            push @array, $col - 1;
            push @array, $col;
        }

        # change the col to new index
        $col = reduce { $data[$row][$a] > $data[$row][$b] ? $a : $b } @array;

        #core code line here
        my $max_scalar = $data[$row][$col];
        print $max_scalar . ",";
        $tmp_sum += $max_scalar;    #print "$tmp_sum\n";

        # So I suddenly come up with a tip here,
        # instead of reduce {} 0,@strings

    }
    print "$tmp_sum\n";

}

__DATA__
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
