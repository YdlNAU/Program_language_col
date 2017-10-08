#!/usr/bin/env perl
#
# Name:        /picb/extprog/biopipeline/bin/bam2bw.pl
# Author:      Shanshan Zhu <sszhu1007@gmail.com>
# License:     GPL
# Created:     Mon Apr. 08, 2013 11:14:33
# Last Change: Shanshan Zhu <sszhu1007@gmail.com> Sun Jun. 01, 2014 19:34:04
# Modifir:     Yudalang
# Modify data: 20170823
#
use strict;
use warnings;
use File::Basename;
use File::Temp qw(tempfile);
my $genome= new File::Temp( UNLINK => 1 );
use Getopt::Long;

my $version='1';
my $command=join"\t",@ARGV;
warn "Command:\t$0\t$command\n"; 
local $|=1;
####################### USAGE;
sub usage {
    print <<"END_USAGE";
Usage: perl $0
        --input         FILENAMES ("," separated bam files)
        --dir           dirname, default "."
        --raw           if use raw read counts (no normalization, default normalized with BPKM)
        --varlen        if variable rlength, default not.
        --antisense     default sense strand.
        --help
END_USAGE
    exit;
}

####################### get options to overlap default values;
my ($input,$dir,$raw,$varlen,$output,$help,$antisense);
$output="output.txt";
$dir=".";
GetOptions (
            'input=s'       =>  \$input,
            'output=s'      =>  \$output,
            'dir=s'         =>  \$dir,
            'raw'           =>  \$raw,
            'varlen'        =>  \$varlen,
            'astisense'     =>  \$antisense,
            'help'          =>  \$help,
            ) or usage();
usage() if $help or !$input;

########### get modification bed files
my @files=@{&getFiles($input)};
print join ("\n",@files),"\n";

mkdir $dir,0751 unless -d $dir;

for my $file(@files){
    #### get count
    my $tag=basename($file);
    $tag=~s/\.[^.]*$//;
    my $count=0;
    my %chr2len;
    open my $in, "samtools idxstats $file |" or die;
    open my $out, ">$genome" or die;
    while(<$in>){
        my @F=split /\t/;
        next unless /^chr/;
        $count+=$F[2];
        $chr2len{$F[0]}=$F[1];
        print {$out} "$F[0]\t$F[1]\n";
    }

    #### get rlength
    open $in,"samtools view $file|" or die;
    my $rlength=0;
    while(<$in>){
        my @F=split /\t/;
        if($F[5]=~/^[\dM]*$/){
            # $rlength=scalar(split //,$F[9]);
            $rlength=length $F[9];
            last;
        }
    }
    my $depths=$count*$rlength;

    #### get total depths for varlen
    if($varlen){
        open $in,"samtools view $file|" or die;
        $depths=0;
        while(<$in>){
            my @F=split /\t/;
            $depths+=length $F[9];
        }
    }
    $,="\t";$\="\n";
    # my $ratio=1000000000/$count/($rlength-2*$over);
    # my $ratio=1000000000/$count/$rlength;
    my $ratio=1000000000/$depths;    ### updated by sszhu1007@gmail.com 13.08.05 14:32:44 ###
    $ratio=1 if $raw;    ### updated by sszhu1007@gmail.com 14.06.01 19:32:53 ###
    print "$file\t$count\t$rlength\t$depths\t$ratio\n";
    # /picb/student/zhangxiaoou/software/bin/bamTobw.sh
    #print "$count\t$rlength\t$depths\n";
    #print "genomeCoverageBed -split -bg -ibam $file -g $genome -scale $ratio|";
    #die;
    open $in,"genomeCoverageBed -split -bg -ibam $file -g $genome -scale $ratio|" or die;
    open $out,">$dir/$tag.bedgraph" or die;
    while(<$in>){
        chomp;
        my @F=split /\t/;
        $F[-1]=int($F[-1]+0.5);
        $F[-1]=-int($F[-1]+0.5) if $antisense;
        print {$out} @F if $chr2len{$F[0]} and $F[2]<=$chr2len{$F[0]};
    }
    print "bedGraphToBigWig $dir/$tag.bedgraph $genome $dir/$tag.bw\n";
    print `bedGraphToBigWig $dir/$tag.bedgraph $genome $dir/$tag.bw\n`;
}
sub getFiles{
    my $input=$_[0];
    my (@files,%files);
    for (split /,/,$input){#### get file names based on $methy_files;
        if(/\|/){
            my $bas=basename($_);
            my $dir=dirname($_);
            for my $f(split /\|/,$bas){
                map {push @files,$_ if ! $files{$_}++} glob "$dir/$f";     ### updated by sszhu1007@gmail.com 12.10.07 12:54:13 ###
            }
        }else{ map {push @files,$_ if ! $files{$_}++} glob $_; }
    }
    #@files=sort keys %files;
    return \@files;
}
=bash script
results="$RNA_seq/tophat2/ADAR1_diff_gtf"
cd $results
genome="/picb/extprog/biopipeline/data/database/20110414/UCSC/hg19/chrom.size"
for i in *.bam; do name=${i%%.bam}; 
    if ! [ -e $name.check ]; then touch $name.check;
    count=$(samtools idxstats $i | perl -ane '$a+=$F[2];END{print "$a"}')
    rlength=$(samtools view $i | perl -lane 'print scalar(split //,$F[9]) and last if $F[5]=~/^[\dM]*$/;')
    ratio=`echo "scale=8;1000000000/$count/$rlength" | bc`
    echo "$name $count $ratio"
    # genomeCoverageBed -split -bg -ibam $name.bam -g $genome -scale $ratio >  $name.bedgraph
    # some errors in hg19_all_chromo_no_hap.fa
    genomeCoverageBed -split -bg -ibam $name.bam -g $genome -scale $ratio | perl -lane '$,="\t";$a{$F[0]}=$F[1] and next if @F==2; $F[-1]=int($F[-1]+0.5); print @F if $a{$F[0]} and $F[2]<=$a{$F[0]}' $genome - > $name.bedgraph
    bedGraphToBigWig $name.bedgraph $genome $name.bw
    touch $name.check1
    fi;done

#sub sortByFirstNum{
#    my ($aa)=$a=~/(\d+)/g;
#    my ($bb)=$b=~/(\d+)/g;
#    $aa=0 unless $aa;
#    $bb=0 unless $bb;
#    $aa <=> $bb;
#}
#print join("\t",$f,map {sprintf "%d(%0.3g%%)",$f2tag2num{$f}{$_},$f2tag2num{$f}{$_}/$f2tag2num{$f}{"Total"}*100} @tags),"\n";
# vim:fdm=marker

