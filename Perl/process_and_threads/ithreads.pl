use strict;
use warnings;

use threads;

sub say_hello {
    printf("Hello thread! @_.\n");
    return ( rand(10) );
}

my $t5 = async{ 
	 
	for (1 .. 4){ sleep(3);print "$_\n";}
};

my $t4 = async{ 
	  printf("Hello thread!\n"); 
};

my $t1 = threads->create( \&say_hello, "param1", "param2" );
my $t2 = threads->create( "say_hello", "param3", "param4" );

my $t3 = threads->create(
    sub {
        printf("Hello thread! @_\n");
        return ( rand(10) );
    },
    "param5",
    "param6"
);

#In this example, we can find that $t5 thread didn't finish when the program exit

$t5 -> join();

__END__

# jion

sub func { 
	  sleep(1); 
		return(rand(10)); 
} 

my $t1 = threads->create( \&func ); 
my $t2 = threads->create( \&func ); 

printf("do something in the main thread\n"); 

my $t1_res = $t1->join(); 
my $t2_res = $t2->join(); 

printf("t1_res = $t1_res\nt2_res = $t2_res\n");



sub say_hello {
    my ($name) = @_;
    printf("Hello World! I am $name.\n");
}

my $t1 = threads->create( \&say_hello, "Alex" );
$t1->detach();

printf("doing something in main thread\n");
sleep(1);
