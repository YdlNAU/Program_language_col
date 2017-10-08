use strict;
use warnings;
use List::Util "sum";

# I put the sub here for iteration
#

sub fibonacci {
    my $number = shift;    # get the first argument

    if ( $number == 0 or $number == 1 ) {    # base case
        return $number;
    }

    else {                                   # recursive step
        return fibonacci( $number - 1 ) + fibonacci( $number - 2 );
    }

}

sub is_prime {
    my $n = shift;
    return 1 if ( $n == 2 );
    return 0 if ( $n < 2 || $n % 2 == 0 );
    my $index = 0;

    for ( 2 .. ( int( sqrt($n) ) + 1 ) ) {
        $index = 1 if ( $n % $_ == 0 );
    }

    if ($index) {
        return 0;
    }
    else {
        return 1;
    }
}

sub is_palindromic {
    my $str         = $_[0];
    my @array       = split //, $str;
    my @reverse     = reverse @array;
    my $reverse_str = join '', @reverse;
    return 1 if $str eq $reverse_str;
    return 0;
}

sub num_divisor{
    my $num_divisor;
    my $n = shift;
    my $i;

    for ($i = 1; $i * $i <= $n; $i++){
	$num_divisor += 2 if $n % $i == 0;
	$num_divisor -= 1 if $i * $i == $n;

    }
    return $num_divisor;

}


sub prob23_type_of_number{

    my $sum_divisors;
    my $n = shift;
    my $i;

    for ($i = 1; $i * $i <= $n; $i++){
	if ( $n % $i == 0) {
	    if ( $i * $i == $n ){
		$sum_divisors += $i;
	    }else{
		$sum_divisors +=  $i + $n / $i;
		# not include $n it-self
	    }
	} 

    }

    $sum_divisors -= $n;

    if ( $sum_divisors < $n) {
	
	return "deficient";
    }elsif ($sum_divisors > $n){

	return "abundant";
    }else{
	return "perfect";
    }

}



sub large_factorial {
    my $n = shift;
    my @arr = split //, 0 x 400;
    $arr[0] = 1;
    my $length = 350;

    for ( my $i = 1 ; $i <= $n ; $i++ ) {

	# multiply 2 for each item in array
        for ( my $j = $length - 2 ; $j >= 0 ; $j-- ) {
            $arr[$j] *= 2;
            $arr[ $j + 1 ] += int( $arr[$j] / 10 );
            $arr[$j] %= 10;
        }

    }
    return @arr;

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

sub factorial {
    my $n = shift;
    my $value =1;
    for (my $j=1; $j <= $n; $j++ ){
	$value *= $j;	
    }
    return $value;
}




1;
