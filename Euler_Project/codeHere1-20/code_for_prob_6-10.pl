use strict;
use warnings;
use List::Util qw(sum product);

require "sub.pl";

# problem 6

my $sum_of_natural_num;
my $sum_of_squares;

foreach (1 .. 100) {
	$sum_of_natural_num+=$_;
	$sum_of_squares += $_ **2;	
}

my $diff= $sum_of_natural_num **2  - $sum_of_squares;

print "$diff\n";


# problem 7

# how about use the violent way

my $n;
my $num;

while (1) {
    $n++;
    if ( is_prime($n) ) {
        $num++;
        last if $num == 10001;
    }

}

print "$n\n";


# problem 8

my $str="7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450";

# print length($str) . "\n";
my $max=0;

my @arr = split //,$str; 
for my $i( 0.. ($#arr-12)){
	
    my $product = product @arr[$i .. $i+12];		
    $max = $product if $max < $product;
}

print "$max\n";



# problem 9
#
# actually the free variable are only one
# because there are the two express equals here
#

for my $a(1 .. 1000){
	for my $b($a+1 .. 1000){
		my $c = 1000 - $a - $b;

		if (($c > $b) && ($a*$a + $b*$b == $c*$c)){
			print "$a\t$b\t$c\n";
			print $a*$b*$c."\n";
		}

	}
}


# problem 10


my $sum;
for ( 1 .. 2000000 ){
    if ( is_prime($_)){
				$sum += $_;
		}
		
		print $_."\n" if $_ % 10000 == 0;

}

print "$sum\n"; # the result is 142913828920









