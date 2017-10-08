use List::Util qw/sum/;

# We can establish an upper bound of the problem by figuring out that 9!*7 = 2540160 which is the upper limit. There is no possible higher value since 9!*8 also results in a 7 digit number.

my $sum_total;
for ( my $i = 11; $i <= 2540160; $i++ ){ ### Evaluating [===|    ] % done
   my @digits = split //,$i;
   my $sum_digits = sum @digits;

   my $sum_digits_factorials;
   map { $sum_digits_factorials += factorial($_)} @digits;

   print $i . "\n"  if $i ==  $sum_digits_factorials;
   $sum_total += $i if $i ==  $sum_digits_factorials;
}

print $sum_total;

##############################################################3

sub factorial {
    my $n = shift;
    my $value =1;
    for (my $j=1; $j <= $n; $j++ ){
	$value *= $j;	
    }
    return $value;
}
