require '/home/yudalang/github/practice-small-math-problem-by-perl/sub.pl';

# Note the problem is too easy so I just keep the core codes here !

    
    my $binary_n = sprintf("%b", $n) + 0;

    push @truncatable_primes, $n  if  is_palindromic($binary_n) && is_palindromic($n);
# It would be first is we first judge the binary number

