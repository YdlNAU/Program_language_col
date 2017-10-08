my $sum;

my @arr;

for ( 2 .. 10000){  ### Evaluating [===|    ] % done
  
  my $a = $_;
  my $b = d($_);

  push @arr,[$a,$b] if (d($b) == $a) and ( $a != $b);

}

map { $sum += $_->[0]} @arr;

print "$sum\n";




sub d {
  
  my $n =shift;
  my $sum_num_divisor;

  for (my $i=1;$i*$i <= $n;$i++){
    if ( $n % $i == 0){
      $sum_num_divisor += $i;
      $sum_num_divisor += $n / $i unless ($i*$i == $n) or ($i == 1);
    }
  }

  return $sum_num_divisor;
}
