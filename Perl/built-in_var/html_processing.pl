use strict;
use warnings;
use feature 'say';

open IN, "html" or die $!;

my %words;
while (<IN>) {
    while (/(\$\w+)/g) {
        $words{$1} = 1 if defined($1);
    }
}

say $_ for keys %words;
