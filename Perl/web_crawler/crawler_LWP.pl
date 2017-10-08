use LWP::Simple;
# For use of this module, you can just `perldoc LWP::Simple` for more details

my $url = shift || die "Please provide the urls: $! ";
my $max = 10;

my $html = get($url);

my @urls;

# when to meet the <a> tag, store and print it !

while ($html =~ /<a (\S+)>/g ){
    push @urls , $1;
}

print $_ . "\n" for @urls;

print "--------------------------------------\n";
print  scalar @urls ;
