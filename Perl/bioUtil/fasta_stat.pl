use strict;
use warnings;

# get the base or AA composition
# ACGT

=pod
>seq_1
TTTTTGCCTGAGAGACCTCATTGCAGTTTCTGATTTTTTGATGTCTTCATCCATCACTGTCCTTGTCAAATAGTTTGGAACAGGTA
>seq_2
TTTTTGCCTGAGAGACCTCATTGCAGTTTCTGATTTTTTGATGTCTTCATCCATCACTGTCCTTGTCAAATAGTTTGGAACAGGTA
>seq_3
ACCGGCGTCAAAGTATTTAGCTGACTCGCCACACTCCACGGAAGCAATATGAAATGATCTGCTGCAGTGCTCTGAGCCCTA
>seq_4
TTTTTGCCTGAGAGACCTCATTGCAGTTTCTGATTTTTTGATGTCTTCATCCATCACTGTCCTTGTCAAATAGTTTGGAACAGGTA
>seq_5
ATGTGAACATGGAGGGGTGTGTGTGTCCGTGTGTAGGTTTGCGTGCATGCACACATGCATGTGTGTACTGGGGCATCC
>seq_6
TCAAGTGTCTCGTGTCTGCACGTGGGTGTCTGCACCCTCACGTGTCTCGTGTCCGCACAAGCATGTGTAGGTGTCCCTGCTGGGCTC
>seq_7
TCAAGTGTCTCGTGTCTGCACGTGGGTGTCTGCACCCTCACGTGTCTCGTGTCCGCACAAGCATGTGTAGGTGTCCCT
=cut


`bioseq -c Mapped_500.fa | perl -MStatistics::Descriptive -lane ' for (0 .. 3) { $F[$_+1] =~ /\((.*)%/;push @{$arr[$_]},$1;} ; END{ for (0 .. $#arr){ $stat =  Statistics::Descriptive::Full->new(); $stat -> add_data($arr[$_]); print $stat->mean()."\t".$stat->variance() }}'`


# -f switch

remove the gaps in the fasta file, and the output file have multiple lines.

