use warnings;
use strict;
use feature qw/say/;

my $s ='';
my $n;
while (length($s) <= 1000000) {
    $n += 1;
    $s = $s . $n;
#say $s;
}

say $s[1];

exit;
my @arr = split //, $s;

my $prod=1;
for my $i( 1,10,100,1000,10000,100000,1000000) {
    say $arr[$i -1];
    $prod *= $arr[$i - 1];

}

say $prod;
