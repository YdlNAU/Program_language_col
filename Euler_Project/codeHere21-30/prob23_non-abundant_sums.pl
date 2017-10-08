
require 'sub.pl';
use List::Util qw/sum/;
use Smart::Comments;

# get abundant number
my @arr_abundant;

for (12 .. 28123 ){ ### Evaluating [===|    ] % done
    push @arr_abundant, $_ if prob23_type_of_number($_)  eq "abundant" ;
}

my %hash;

# get no repeated abundant number
foreach my $i (@arr_abundant){ ### Evaluating [===|    ] % done
    foreach my $j (@arr_abundant) {
	my $positive = $i + $j;

	next if $positive > 28123;

	$hash{$positive} ++; 
    }
}

# get the sum of positive integers cannot be written as ...

my $sum_total;
my @arr_sum_two_abundant_numbers=sort {$a <=> $b}  keys %hash ;


my $n = 1;

foreach my $key (@arr_sum_two_abundant_numbers){
    for ( my $i=$n ; $i < $key ; $i++) {
    $sum_total +=   $i; 

    }
    $n = $key +1;
}
 print "$sum_total\n";


__END__

perfect
deficient
abundant


