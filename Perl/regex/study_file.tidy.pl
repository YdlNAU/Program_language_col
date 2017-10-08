=head1 cheatSheet
.   any character except newline
\w \d \s    word, digit, whitespace
\W \D \S    not word, digit, whitespace
[abc]	any of a, b, or c
[^abc]	not a, b, or c
[a-g]	character between a & g

^abc$	start / end of the string
\b \B	word, not-word boundary

\. \* \\    escaped special characters
\t \n \r    tab, linefeed, carriage return
\u00A9	unicode escaped ©

(abc)	capture group
\1  backreference to group #1
(?:abc)	non-capturing group
(?=abc)	positive lookahead
(?!abc)	negative lookahead

a* a+ a?    0 or more, 1 or more, 0 or 1
a{5} a{2,}  exactly five, two or more
a{1,3}	between one & three
a+? a{2,}?  match as few as possible
ab|cd	match ab or cd

=cut

# a website could be used to learn and test the regex: http://regexr.com/

# create the matrials

my $heredoc = << "END";
My diary 20130331
Today's whe
ather is very good!

I go to school with my friends.

We ate dinner togeter!
END
print "See the content =======================================\n";
print $heredoc;

# To see the last element !

my @arr = split //,$heredoc;

print "The last element $arr[-1]\n";
print "Last two $arr[-2]\n";


print "normal usage ===========================================\n";

# the normal usage of regex
my $str = $heredoc;

my $result = $str =~ m/Today/;print "$result\n"; # or 
# if matched the #result will be assigned else it won't be assigned
# same as !~
$result = $str !~ m/Today/;print "$result\twon't assign\n";  


print "/i modifier ===========================================\n";

# /i ignore lowercase or uppercase distinctions
$result = $str =~ m/today/;print "$result\t also succeed\n"; # or 
 

print "/s modifier ===========================================\n";

print " let . match \\n(new line) \n";
$result = $str =~ m/whe.ather/;print "$result\t won't assign\n"; # or 
$result = $str =~ m/whe.ather/s;print "$result\t also succeed\n"; # or 

print "/m modifier ===========================================\n";

# /m treat string as multiple lines.
# /s treat string as single line.

# With multiple lines, ^ and $ apply to individual lines (i.e. just before and after newlines).
# With a single line, ^ and $ apply to the whole, and \n just becomes another character you can match.

# capture group
$result = $str =~ m/(^.*$)/m;print "$result\t succeed\n"; # or 
print "capture: $1\n";
$result = $str =~ m/(^.*$)/s;print "$result\t also succeed\n"; # or 
print "capture: $1\n";

# Here is an interesting problem: what if you want to get the
# "I go to school with my friends."
# "We ate dinner togeter!"


print "use pos() function ===========================================\n";

# give location in string SCALAR where last m//g search left off
# please see the e.g.

my $str = "I saw a saw that could out saw any other saw I ever saw.";

while ($str =~ m/s/g){

    my $position = pos($str);

    print("Matched 's'at position $position\n");
} 
