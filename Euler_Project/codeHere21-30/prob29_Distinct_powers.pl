use bigint;

my %hash;

for my $a( 2 .. 100){
    for my $b(2 .. 100){
	my $power = $a ** $b;
### $power

	$hash{$power} = 1;
    }
}

my @arr = keys %hash;

my $n=0;

__END__
foreach (sort {$a <=> $b} @arr) {  print ++$n."\t" . $_ ."\n";}
