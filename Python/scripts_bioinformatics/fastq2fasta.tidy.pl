#!/usr/bin/env perl
# ===========================================================================
## author: unknow
## modifier: yudalang
## data: 2017.08.19

# ===========================================================================
use strict;
use warnings;
use Getopt::Std;
getopts('k');
our $opt_k;

my $file = $ARGV[0] or die "Usage: \n\n fastq2fasq.pl fastqfile > outputfile
The default mode is change the @... line, and only remain simple information.
If you need to keep all infor,Ples use fastq2fasta.pl -k fastqfile\t -k means keep\n";

open IN, "<$file" or die "File $file not found error here\n";
my $c         = 0;
my $id        = '';
my $seq       = '';
my $processed = 0;

while (<IN>) {
    chomp;
    $c++;
    if ( $c == 1 ) {
        $processed++;

        #print STDERR "$processed reads processed\r";
        if ( defined($opt_k) ) {
            $id = keep_processing($_);
        }
        else { $id = normal_processing($_); }
        #print $id. "\n";

    }
    elsif ( $c == 2 ) {
        $seq = $_;
    }
    elsif ( $c == 4 ) {
        $c = 0;
        print ">$id\n$seq\n";
        $id  = '';
        $seq = '';
    }
    else { }

}

close IN;

print STDERR "$processed reads processed\n\n";

##################################################################
## sub here ..

sub normal_processing {
    my @arr = split /_|(\s)/;
    my $id  = $arr[0];
    $id =~ s/@//;
    return "$id"."_" . $processed;
}

sub keep_processing {
    s/\@//;
    my $id = $_;
    return $id;
}
