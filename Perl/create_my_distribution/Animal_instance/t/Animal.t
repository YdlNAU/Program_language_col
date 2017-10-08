use strict;
use warnings;

use Test::More tests => 3;

BEGIN {
    use_ok( 'Animal' ) || print "Bail out!\n";

}

diag( "Testing Animal $Animal::VERSION, Perl $], $^X" );

#

ok( defined &Animal::speak, 'Animal::speak is defined ');
ok( defined &Animal::sound, 'Animal::sound is defined ');
