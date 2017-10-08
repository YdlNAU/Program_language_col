# create single end reads
python SimpleReadsSimulator_0.1.py ../data/chr10.fa_soft reads_out statement
# turn to fasta files
fastq2fasta.tidy.pl -k reads_out.fastq > reads_out.fa
# use blast to alignment the sequence 
blastn -db $wk4/hg19_add_annotation/blastdb/hg19_common.fa -query reads_out.fa -out reads_out.fa_blastn_res -perc_identity 100 -ungapped -outfmt 7
# use perl to validate 
perl -wlane 'if (/^#/){ print; }else{  if ($F[3] ==100){print; @arr = split /_/,$F[0]; if($arr[2] + 1 != $F[8]){print ERROR "Warning!$_"}}  } ' reads_out.fa_blastn_res >tmp
