# we can see the http://www.mathblog.dk/project-euler-31-combinations-english-currency-denominations/ as reference

# the brute force way is also cost less time


# 1 2	5   10	20  50	100 200

# use DP instead 

# the core is to define the state: 1. the number of different coins. 2. the value we need to split

my $target = 200;

my @coinSizes = qw/ 1 2 5 10 20 50 100 200/;

my @ways = (1);

for ( my $i = 0; $i< scalar @coinSizes; $i++){
    for ( my $j = $coinSizes[$i]; $j <= $target; $j++){
	$ways[$j] += $ways[ $j -$coinSizes[$i] ];
    }
}


print "@ways\n";

# This DP is interesting
# Besides there are another solution in the website:
# http://blog.csdn.net/z702143700/article/details/48998335
