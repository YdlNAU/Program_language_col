use strict;
use warnings;
# use Smart::Comments;
# use Math::BigInt;

# my $prev = Math::BigInt->new();      # defaults to 0
# my $cur  = $prev->copy();            # make a true copy
# even the module can not handle we really need to use the string, brute force way not works

=pod 
Now I think up an idea, just keep the last two digits for the $prev and $cur varibale and the weishu

look if that is the right anwser, if not just keep one more digit util get the right anwer

=cut

my ( $prev, $cur ) = ( 0, 1 );

while ( 1 ) {
    my $tmp = $cur;
    $cur  = $prev + $cur;
    $prev = $tmp;
    if ( $cur % 1e1000 == 0 ) {
       print $cur . "\n";
			 exit;
    }
### $cur
		print "$cur\n";
		last if $cur > 1e500 ;
}


