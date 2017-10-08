require '/home/yudalang/github/practice-small-math-problem-by-perl/sub.pl';

use Math::Prime::Util qw/ next_prime/;
use List::Util qw/sum/;

my @truncatable_primes;
my $n = 11;

while ($#truncatable_primes < 10 ) {
    my $len = length($n);
    my $is_truncatable=1;
    # left to right 
    for (my $i=1; $i < $len; $i++){

	$n =~ m/(\d{$i})$/;
	$is_truncatable = 0 unless is_prime($1);
    }
    # right to left
    for (my $i=1; $i < $len; $i++){

	$n =~ m/(^\d{$i})/;
	$is_truncatable = 0 unless is_prime($1);
    }
    
    push @truncatable_primes, $n  if  $is_truncatable;

    $n = next_prime($n);
}

print "@truncatable_primes\n";
print sum (@truncatable_primes) . "\n";
