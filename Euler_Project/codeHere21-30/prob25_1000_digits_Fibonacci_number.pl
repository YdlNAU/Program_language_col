use bigint;

my ($prev , $cur , $n) = ( 0 , 1 ,1);

while (1) {
    my $tmp =$cur;
    $cur = $prev + $cur;
    $prev = $tmp;
    $n++;

#print "$n\t$cur\n" ;
    last if length($cur) >= 1000;
}

print "$n\t$cur\n" ;

