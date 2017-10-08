use bignum;

=head Feima dingli

1. http://www.xieguofang.cn/Maths/Number_Theory/Fermat%27s_Little_Theorem_1.htm

2. http://blog.sina.com.cn/s/blog_9f26be1d01012nyv.html

3. Simple code: http://www.iteye.com/topic/204837

=cut

my $max_recurring_cycle = 0;
my $res                 = 0;

for ( my $i = 2 ; $i <= 1000 ; $i++ ) {
    next if ( $i % 2 == 0 || $i % 5 == 0 );
    my $t = power($i);

    ( $res, $max_recurring_cycle ) = ( $i, $t ) if $t > $max_recurring_cycle;
    print "$i\t$t\n";

}

print "$res\n";

sub power {

    my $n = shift;
    my $k = 10;
    my $c = 1;

    while ( ( $k - 1 ) % $n != 0 ) {
        $k *= 10;
        $c++;
    }

    return $c;
}
