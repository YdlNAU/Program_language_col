



# problem 22

my $str;
open IN, "p022_names.txt" or die $!;

while (<IN>) {
    s/"//g;
    $str = $_;
}

my @names = split /,/, $str;
my @scores;

my $n;
my $sum_all;
foreach my $name ( sort @names ) {
    $n++;

    my @alphas = split //, $name;
    my $sum_name;
    for (@alphas) {
        $sum_name += case_to_alphabetical_order($_);

    }
    ### $sum_name

    $sum_name *= $n;

    print "$sum_name" if $name =~ /COLIN/i;
    print "$name\t$sum_name\n";

    $sum_all += $sum_name;

}

print "$sum_all\n";

#####################################
sub case_to_alphabetical_order {
    my $case = shift;

    my @cases = split //, "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    my $rank;
    for ( 1 .. 26 ) {
        if ( $cases[ $_ - 1 ] eq $case ) { $rank = $_; last }
    }

    return $rank;

}
