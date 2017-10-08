use strict;
use warnings;
use feature 'say';

use LWP::Simple;
my $content = get("http://perldoc.perl.org/perlvar.html");
die "Couldn't get it!" unless defined $content;


