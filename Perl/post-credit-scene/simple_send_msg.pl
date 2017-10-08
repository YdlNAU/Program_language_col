use strict;
use warnings;

# first, create your message
use Email::MIME;
my $message = Email::MIME->create(
    header_str => [
        From    => 'yudalang@liyang-lab.picb',
        To      => 'dongruipicb@gmail.com',
        Subject => 'For test',
    ],
    attributes => {
        encoding => 'quoted-printable',
        charset  => 'ISO-8859-1',
    },
    body_str => "This is a mail test!\n",
);

# send the message
use Email::Sender::Simple qw(sendmail);

sendmail($message);

=head1 a simple way to send the email

Learn from the http://learn.perl.org/examples/

=cut 

=head1 another tutorial 

You can also learn from: https://www.tutorialspoint.com/perl/perl_sending_email.htm

=cut 
