use strict;
use warnings;

my $n = 0;
my @terms;
my @array = ( 0, 0 );    # the first one is the max index, next is the max num

while ( $n <= 1000000 ) {
    my $num_term = num_terms($n);

    if ( $array[1] < $num_term ) {
        $array[1] = $num_term;
        $array[0] = $n;
    }
    
    $n++;

    print "$array[0]\t$array[1]\n" if $n <=10;

}

print "$array[0]\t$array[1]\n";

sub num_terms {
    my $n     = shift;
    my $times = 1;
    my $trans;

    return 0 if $n == 0;
    return 1 if $n ==1;

    if   ( $n % 2 == 0 ) { $trans = $n / 2 }
    else                 { $trans = 3 * $n + 1 }
    while ( $trans > 1 ) {
        $times++;
        if   ( $trans % 2 == 0 ) { $trans = $trans / 2 }
        else                     { $trans = 3 * $trans + 1 }
    }

    return $times;

}
