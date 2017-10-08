use strict;
use warnings;
use Cwd;

print getcwd . "\n";

mkdir('test_floder');
chdir('test_floder');

print getcwd . "\n";

# create the files you need
for ( 1 .. 30 ) {

        my $fileName = "test.first" . $_ . ".txt";
	    my $state    = system("touch $fileName; echo 'a b   $_' >> $fileName");

	        # if the system command succeed than it will return the 0; failure it return 1
	        die if $state;
		    ### $state
}
