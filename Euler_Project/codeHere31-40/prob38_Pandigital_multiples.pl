require '/home/yudalang/github/practice-small-math-problem-by-perl/sub.pl';

my $res;

for (my $i=9387; $i>= 9234; $i--){
    $res = join '', ($i, $i*2);

    next if $res =~ /0/;
    ### $res
    last if is_pandigital($res);
}

print "$res\n";
