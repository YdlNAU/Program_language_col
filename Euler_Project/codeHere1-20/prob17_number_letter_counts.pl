open IN, $ARGV[0] or die "$!";

my %cordinate;
while (<IN>){
    chomp;
    
    my ($num,$letters) = split;
    $cordinate{$num} = $letters;

}

=head1 ensure the hash!

for my $key ( sort {$a <=> $b }keys %cordinate) {

    my $value =$cordinate{$key};
    print " $key\t$value\t";
    my $count = $value =~ tr/[a-z]//;

    print "$count\n";
}

=cut

my $sum;

for (1 .. 999){
    my $num_of_letters = get_letters($_);
    my $count = $num_of_letters =~ tr/[a-z]//;

    $sum += $count;
    print "$_\t$num_of_letters\t$count\t$sum\n";
}

# for 1000; one thousand

$sum += 11;

print "$sum\n";

sub get_letters{
    
    my $n = shift;

    die if $n >= 1000;

    my $result;

    if ($n <= 30){
	return $cordinate{$n};
    }elsif( $n < 100 ){
	# but in this time we don't need
	my ($decade,$unit) = split //, $n;
	
	return $cordinate{ $decade * 10}. " ".$cordinate{$unit};
    }else{

	my ($quotient,$remainder) = (int $n / 100 , $n % 100 );

	return $cordinate{$quotient}. " hundred ". get_letters( $remainder);
	
    }

}



