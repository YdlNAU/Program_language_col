use List::Util qw/sum/;

my $sum_total;

for my $n( 2 .. 999999 ){      ### Evaluating [===|    ] % done
    
    my @digits = split //,$n;
    my $sum = sum (map { $_ ** 5} @digits);
    
     if ($sum == $n){
	print $n . "\n";
	$sum_total += $sum;
     }

    
}

print "--------------------------------\n" . $sum_total ."\n";
