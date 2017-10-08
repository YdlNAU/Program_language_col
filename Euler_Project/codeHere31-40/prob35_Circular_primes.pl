require '/home/yudalang/github/practice-small-math-problem-by-perl/sub.pl';

my $count;

for (my $i=1; $i<= 1000000; $i++){ ### Working===[%]     done
    my @rotations = rotate_by1($i);
    my $is_all_prime=1;

    foreach my $n( @rotations){
	$is_all_prime = 0 unless is_prime($n);
    }

    $count ++ if $is_all_prime;
    print $i ."\n"  if $is_all_prime;
}


print $count;

   

