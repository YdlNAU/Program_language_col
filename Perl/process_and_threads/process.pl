use strict;
use warnings;
use Data::Dumper;

=head1 The basic knownledge

=head2 $$
use $$ to see the recent process

print "This program's PID is " . $$ ."\n";

sleep(5); # wait for not execute too fast!

=head2 getppid()

use getppid() function to get parent pid
my $parent_pid = getppid();

print "The parent_pid is $parent_pid\n";

=head2 call function: system()

# the first call function system()
my $output = system("ls -a"); # just print on the screen

## note the '' and "" are different
$PATH = "I am Perl Variable";

system('echo $PATH');  # Treats $PATH as shell variable
system("echo $PATH");  # Treats $PATH as Perl variable

print "$output\n"; # the $output is 0(succeed);

# a safe way is to use

unless (system "date") {  
    print "$!\n";  
    print "We gave you a date,Ok!\n";  
} 


=head2 call function: backsticks

collect the output from a program and do something to it

## with backticks

my @output = `ls -a`;

print "$output[0]\n"; # works, print the first file name .

=cut

# use fork()
# learn from http://www.runoob.com/perl/perl-process-management.html

print "The recent PID is $$\n";
my ( $pid, $ret );
# communication
# The pipe function creates two connected filehandles, a reader and writer, whereby anything written to the writer can be read from the reader.

pipe(PARENT_RD, CHILD_WT);

if ( !defined( $pid = fork() ) ) {

    # if there is not enough memory fork will return error
    # it's a securite way !
    die "error $!";
}
elsif ( $pid == 0 ) {
    print "This is the child process, the child PID is $$\n";

		close PARENT_RD; sleep(5);
		print CHILD_WT "Some stuff I write here";
		#exec("date") || die "can not print date information $!";

}
else {
    # we are in the parent process
    print "we are in the parent process\n";
    $ret = waitpid( $pid, 0 ); # we need to wait or the child processes will be zombies
    print "the finshed PID $ret\n";

		close CHILD_WT;
		my $str = <PARENT_RD>; print "$str\n";

}

# print "Here the PID is $$\n";
# you'd better not write here, or it will be excute twice !
