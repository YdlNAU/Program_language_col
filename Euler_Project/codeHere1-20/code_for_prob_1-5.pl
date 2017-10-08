# Problem 1 
# https://projecteuler.net/problem=1
my $sum;

for ( 1..999 ){
        if ( ($_ % 3 == 0) || ($_ % 5 ==0)){
                $sum = $sum + $_;
                # print $_ . "\n";

        }

}

# Problem 2
# https://projecteuler.net/problem=2

my $sum;
my ( $prev, $cur ) = ( 0, 1 );

while ( $cur <= 4000000 ) {
    my $tmp = $cur;
    $cur  = $prev + $cur;
    $prev = $tmp;
    if ( $cur % 2 == 0 ) {
        $sum += $cur;

        # print $_ . "\n";

    }

}

print $sum. "\n";

my $sum   = 0;
my $n     = 0;
my $value = 0;

while ( $value <= 4000000 ) {
    $value = fibonacci($n);
    if ( $value % 2 == 0 ) {
        $sum += $value;
        print "$value\n";
    }
    $n++;

}

print "\n$sum\n";
## for summary

# the first one is considered to be a better programe here

############################################################

# This sub if using the recursive method
sub fibonacci {
    my $number = shift;    # get the first argument

    if ( $number == 0 or $number == 1 ) {    # base case
        return $number;
    }

    else {                                   # recursive step
        return fibonacci( $number - 1 ) + fibonacci( $number - 2 );
    }

}

# Problem 3
#
use strict;

my $value  = 600851475143;
my $factor = int( sqrt($value) ) + 1;

while ( $factor > 1 ) {
    if ( $value % $factor == 0 ) {
        if ( is_prime($factor) ) {
            print "the largest prime factor is\n " . "$factor";
            exit;
        }

    }
    print "$factor\n";

    $factor--;

}
# sub programe here

sub is_prime {
    my $n = $_[0];
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

# problem 4
#
use strict;

my @numbers = reverse( 100 .. 999 );
my %hash    = qw (max 0 first 0 second 0);

foreach my $first (@numbers) {
    foreach my $second (@numbers) {
        my $n = $first * $second;
        if ( is_palindromic($n) ) {
            if ( $hash{"max"} < $n ) {
                $hash{"max"}    = $n;
                $hash{"first"}  = $first;
                $hash{"second"} = $second;
            }
        }
    }
}

foreach my $key ( keys %hash ) {
    print "$key\t$hash{$key}\n";

}
############
sub is_palindromic {
    my $str         = $_[0];
    my @array       = split //, $str;
    my @reverse     = reverse @array;
    my $reverse_str = join '', @reverse;
    return 1 if $str eq $reverse_str;
    return 0;
}

# problem 5
#

use strict;
my $n = 20;

while (1){
  $n++;
  if( is_multipe($n)){
    print "$n\n";
    exit;
  }
  print "$n\n" if $n % 10000000 ==0;
}

# use List::Util "product";
# my $n= product (11..20);
# print is_multipe($n)."\n";


sub is_multipe{ # no need to be repeated
  my $num = $_[0];
  # if the number could be divided by 20, of course it could be divided by 2,4,5,10,20
  # if the number could be divided by 18, of course 2,3,6,9
  #				      16	    2,8,4
  #				      15	    3,5
  #				      14	    2,7
  #				      12	    2,6,3,4
  #				      

  #so you need to check 20,19,18,17,16,15,14,13,12,11
  my @check_num =(20,19,18,17,16,15,14,13,12,11);
  foreach (@check_num){
    return 0 if $num % $_ != 0;
  }
  return 1;
}
