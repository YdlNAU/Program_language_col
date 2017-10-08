
=head1 Brute force
for my $numerator ( 10 .. 99 ){
    for my $denominator ( $numerator .. 99) {
	pr$intersection($numerator,$denominator) . "\n";
    }
}


#########################################################3

sub intersection{
    my @a = split //,$_[0];
    my @b = split //,$_[1];

    for my $i( @a){
	 for (@b){
	    return $_ if $_ == $i;
	 }
    }

    return 0;
}
=cut

my $denproduct = 1;
my $nomproduct = 1;

for ( my $i = 1 ; $i < 10 ; $i++ ) {
    for ( my $den = 1 ; $den < $i ; $den++ ) {
        for ( my $nom = 1 ; $nom < $den ; $nom++ ) {
            if ( ( $nom * 10 + $i ) * $den == $nom * ( $i * 10 + $den ) ) {
                $denproduct *= $den;
                $nomproduct *= $nom;
            }
        }
    }
}

print "$nomproduct/$denproduct\n";
