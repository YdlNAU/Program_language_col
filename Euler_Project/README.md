# practice-small-math-problem-by-perl
use perl to solve small math problem, in order to practise you perl programming skills

the math problems come from the website [Project Euler](https://projecteuler.net/)

**I really hope you can join me !**

# for example:

problem one:

*If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.*

*Find the sum of all the multiples of 3 or 5 below 1000.*

And you could answer the question like the following format:

```{perl}
# Problem 1 
# https://projecteuler.net/problem=1
my $sum;

for ( 1..999 ){
        if ( ($_ % 3 == 0) || ($_ % 5 ==0)){
                $sum = $sum + $_;
                # print $_ . "\n";

        }

}

print $sum. "\n";


```

# your harvest:

- you can practise you perl programming skils
- you can learn the math knowledge here: the concept of math is really really boring;
- you could be more logic in thinking;


# contact:

My name is yudalang, and I'm a perl Monk. I hope to find whom love programming with perl!



