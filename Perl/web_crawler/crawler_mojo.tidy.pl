# This is from http://www.php-oa.com/2013/05/24/mojo-perl-crawler.html

use strict;
use Mojo::UserAgent;
use Bloom::Filter;
use Smart::Comments;

my $dept_level = 2;
my $baseUrl    = Mojo::URL->new( $ARGV[0] || 'http://www.chinaunix.net' );
my ($domain)   = $baseUrl =~ qr#http://(?:www.)?([^/]+)#;
my $filter     = Bloom::Filter->new( capacity => 100000, error_rate => 0.0001 );
my $ua         = Mojo::UserAgent->new( max_redirects => 3 );

my $callback;
$callback = sub {
    my ( $ua, $tx ) = @_;
    return if !$tx->success;

    my $dept = $tx->req->headers->header('dept');
    return if $dept > $dept_level;    # 深度
    ++$dept;
    $tx->res->dom->find("a[href]")->each(
        sub {
            my $attrs  = shift->attr;
            my $newUrl = Mojo::URL->new( $attrs->{href} );

            # 修复 url 的路径
            if ( !$newUrl->host and !$newUrl->scheme ) {
                $newUrl->host( $tx->req->url->host );
                $newUrl->scheme( $tx->req->url->scheme );
            }
            $newUrl->fragment(undef);    # 去掉 foo=bar#23 后面的 #xxx

            # 域名, 协议, 后缀以下不对的都退出
            next if ( $newUrl->scheme ne 'http' && $newUrl->scheme ne 'https' );
            next if $newUrl->host !~ qr/$domain/;
            next
              if ( $newUrl->path =~
                /.(jpg|png|bmp|mp3|wma|wmv|gz|zip|rar|iso|pdf)$/i );

            if ( !$filter->check($newUrl) ) {
                print $filter->key_count(), " $dept ", $newUrl, "\n";
                $filter->add($newUrl);
                $ua->get( $newUrl => { dept => $dept } => $callback );
            }
        }
    );
};

$ua->get( $baseUrl => { dept => 1 } => $callback );
Mojo::IOLoop->start;
