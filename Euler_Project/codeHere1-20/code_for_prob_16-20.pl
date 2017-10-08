use strict;
use warnings;
use List::Util qw/ max reduce /;


# problem 16
# I use perl one line in this problem
# And my code works well when the power is 10
# But when is comes to 1000 I get 1189, I know this is not the right anwser but I don't know why

perl -e ' $num = 2 ** 1000; while ($num > 0) { $tmp = $num % 10; $num -= $tmp;$num /= 10; $result += $tmp; print "$tmp\n" }; print "$result\n" ' 


# I now can use large_factorial() funtion!!

# the problem 17 is a little boring
# so I don't want to try!


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
# you need to recognize the dynamic status
for my $row ( 2 .. $#data ) {
    for my $col ( 1 .. $#{ $data[$row] } ) {
        if ( $col == 1 ) {

            $data[$row][$col] = $data[ $row - 1 ][$col] + $data[$row][$col];
        }
        elsif ( $col == $#{ $data[$row] } ) {
            $data[$row][$col] =
              $data[ $row - 1 ][ $col - 1 ] + $data[$row][$col];
        }
        else {
            $data[$row][$col] =
              max( $data[ $row - 1 ][ $col - 1 ], $data[ $row - 1 ][$col] ) +
              $data[$row][$col];
        }

    }

}

print max ( @{ $data[$#data] } ) . "\n";

#__DATA__
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


# problem 19 is not my taste
# Maybe another day!




# Ok I need to use the Math module Math::BigInt 

#problem 20 : use module

use strict;
use warnings;
use List::Util qw/ reduce sum/;
use Math::BigInt;

my $n = Math::BigInt -> new ('1');

for ( 1 .. 100){  ### Evaluating [===|    ] % done

  sleep(1);
  $n = $n * $_;
  

}


print "$n\n";

my @array = split //,$n;

print sum (@array) . "\n";


