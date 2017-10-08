use strict;
use warnings;

use Email::Valid;

my @array = qw/ yudalang1994@gamil.com/;

for ( 1 .. 200 ) {
    my $email_address = 'fwea1' . $_ . "\@yoin\.com";
    my $address       = Email::Valid->address($email_address);

    print "$email_address\t";
    print( $address ? 'yes' : 'no' );
    print "\n";

}

