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


