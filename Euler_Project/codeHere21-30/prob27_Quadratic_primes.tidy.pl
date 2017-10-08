require 'sub.pl';

my $res = [ 0, 0 ];

for my $a ( -999 .. 999 ) {    ### Evaluating [===|    ] % done
    for my $b ( -1000 .. 1000 ) {

        my $num_of_primes = num_of_primes_quadratic( $a, $b );

        $res = [ $a * $b, $num_of_primes ] if ( $res->[1] < $num_of_primes );
	print "$a\t$b\t$num_of_primes\n";
    }

}


print "@{$res}\n";

# calcu the number of primes

sub num_of_primes_quadratic {

    # input coefficients a and b
    # output number of primes from n=0

    my $n = 0;
    while ( is_prime( $n * $n + $_[0] * $n + $_[1] ) ) {
        $n++;
    }

    return $n;

}
