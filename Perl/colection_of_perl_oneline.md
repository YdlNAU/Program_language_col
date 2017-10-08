
# remove the pod content in a file

This also means: Pod strip !

```perl
perl -lne ' BEGIN{ $should_print=1;$is_cut_or_back=0 } ; if ( $_ =~ /^=/) {$should_print = 0;$is_cut_or_back=0}else{$is_cut_or_back=0}; if ( $_ =~ /(cut)|(back)/ ){ $is_cut_or_back =1;$should_print =1}; print $_ if ($should_print==1 && $is_cut_or_back==0); ' 

```

or use the Module : Pod::Stripa 

```
use Pod::Strip;

my $p= Pod::Strip ->new;

my $podless;
$p->output_string(\$podless); # The place you need to output !

$p->parse_file( $ARGV[0]); # The file you need to parse

# $podless will now contain code without any POD

print "$podless\n";

```

