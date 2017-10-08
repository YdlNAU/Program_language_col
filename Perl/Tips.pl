# here decument

If your string have multiple lines, you can use these tip

```perl
$heredoc = << "END";
    Today's wheather si very good!
    END
print $heredoc;
```

# woing to the perl autovivification you don't need to specify the length of an array
# in order to padding the array, you can try this way:

my @arr = split //, 1 x 101000000;

# create a new hash

my %hash = map {$_ , 1} qw/ a b c d e/;

# // operator

$a = $b // $c;

# if $b is undef , $a =$c else $a = $b
# at many times, we will write in this way !

$some_var //= 0;

# s///r

# if you want to get the new variable after subsition rather change the original var

$x = "I like dogs.";
$y = $x =~ s/dogs/cats/r;
print "$x $y\n"; # prints "I like dogs. I like cats."






