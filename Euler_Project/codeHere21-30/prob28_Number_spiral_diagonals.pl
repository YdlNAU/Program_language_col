
my $huan=1; # in the while loop the huan is the next one
my $increase = 0;
my $sum = 1;
my $n = 1;
my $huan_need = (1001 -1) / 2;

while ($huan <= $huan_need){
   $huan++;
   $increase += 2;
   for ( 1 .. 4){
	$n += $increase;
	$sum += $n;
   }
### $sum

}


print "$sum\n";
