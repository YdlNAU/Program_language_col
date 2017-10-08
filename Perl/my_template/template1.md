My first perl script template

=============================

This is the meta information:

\## Author: yudalang	       
\## Date: 2017/03/31		                   
\## contact: 346871663@qq.com or yudalang1994@gmail.com	          
\## usage:    	          
\## description: this is a perl template for refence	         

-----------------------------------------------------

# use modules:

```perl
use warnings;
use strict;

```
Do not forget !

or you can use alias in configure file : `alias perll='perl -w -Mstrict -Mdiagnostics' `Than use the script as `perll yourscript.pl`

I recommend the `diagnostics` and `SmartComments` modules ! as this two modules is very usefull !

# operate the folder than you can use this for doing some repeated and boring work

```perl
opendir FILE,'.' or die "unsucceed!"; # use the current folder for e.g.

my @fileNames;
while(my $name=readdir FILE){
    next if $name=~/^\./; # non-dot file
    next if $name=~/pl$/; # not this script

    ####Do sth
    push @fileNames,$name;
}
closedir FILE;
# than you can use the @fileNames array for further use !
############################################################
# there is another effcient way to do this:
# From http://perl.linuxtoy.org/files.html
my @files = grep { -f } glob( "*" ); 


# create the folder 
mkdir( FILENAME, MODE); 
# change the directory
chdir($dirName)
chdir("..")
# delete the floder
rmdir($dirName)
#delete the file
unlink($fileName)

# if you want to see the current directory
use Cwd;

my $dir = getcwd;

use Cwd 'abs_path';
my $abs_path = abs_path($file);

# or using the FileBin module

# or use another simple and effect way:

print $ENV{'PWD'};

```

**another important factor: File test**

```perl
# e.g.
if (-f "file.txt") { ... };
```
|   tester    |	explanation |
|:---------:|:-------------:|
|-r , -w|readable,weiteable|
|-x |executable|
|-e| exists|
|-f,-d,-l|is file,directory,symlink|
|-T,-B|text file,binary file|
|-M,-A|mod/access age in days|
|@stats=stat("filename")|13-element list with status|

One example here to produce the lot's of files:

```perl 
# Produce the 30 files here

print getcwd . "\n";

mkdir('test_floder');
chdir('test_floder');

print getcwd . "\n";

# create the files you need
for ( 1 .. 30 ) {

    my $fileName = "test.first" . $_ . ".txt";
    my $state    = system("touch $fileName; echo 'a	b   $_' >> $fileName");

    # if the system command succeed than it will return the 0; failure it return 1
    die if $state;
    ### $state
}
```

# operate the file

```perl
open IN1,$ARGV[0] or die "unsuccessful!!!!          msg:$!\n";
while (<IN1>){
    chomp;
      
}
close IN1;
##经常用到的把一个fasta文件以>之后的内容为key；以序列的内容为value存入一个hash
open FILE, $ARGV[0]  or die "can not open     msg:$!\n"; #打开文件  
my %hash;
while(<FILE>){  
    chomp;
    if(/^>/){  
      $key=$_;  
      next;
      $hash{$key}.=$_; # paste the string
}  
close FILE;
```


# use Bio::Perl

## it's really important ! here

```perl
use Bio::SeqIO;
die "perl $0 fastqfile" if (@ARGV<1);
## make by wu yufeng
## study date:19:47 2015/10/12

#下面的可以作为利用Bio::SeqIO的模板
my $file=$ARGV[0];
my $in = Bio::SeqIO->new(-file =>"$file" ,-format => 'Fasta');#声明$in是一个对象
#注意$file是一个你输入的包含很多>header seq 的序列

while ( my $obj= $in->next_seq() )#$seqObject是其中的一条序列
{
    my $id = $obj->id;			#表示得到序列的ID
    my $desc = $obj->desc;		    #表示对序列的描述
    my $seq = $obj->seq;		      #展示序列的本身
    my $len = $obj->length;		#表示序列的长度
    my $seq_type = $obj->alphabet;	      #序列的类型(dna还是蛋白质?)
    my $display_name = $obj->display_name;#貌似和ID是一样的
    my $display_id = $obj->display_id;	    #貌似和ID是一样的
    my $acc_num=$obj->accession_number;  #就是说明accession number
    print "$id\n$desc\n$display_name\n$display_id\n$acc_num\n\n";
}
$in->close();
```

### 属性说明，有些属性在genebank的格式下会显现

Table 1: Sequence Object Methods	

|NAME|		  RETURNS|		EXAMPLE|		      NOTE|
|:---:|:---:|:---:|:---:|
|accession_number |   identifier |     $acc = $so->accession_number	|get or set an identifier|
|alphabet   |   alphabet|	    $so->alphabet(‘dna’)  |    get or set the alphabet (‘dna’,"rna’,"protein’)|
|authority  |   authority, if available	|  $so->authority(“FlyBase”)|	get or set the organization|
|desc	|  description	|  $so->desc(“Example 1″)|      get or set a description|
|display_id|	identifier|	$so->display_id(“NP_123456″)|	  get or set an identifier|
|pision	|    pision, if available (e.g. PRI)|	$p = $so->pision  |    get pision (e.g. “PRI”)|
| get_dates|	array of dates, if available|	  @dates = $so->get_dates  |   get dates|
| get_secondary_accessions|	array of secondary accessions, if available|	@accs = $so->get_secondary_accessions|	  get other identifiers|
|  is_circular|	  Boolean |    if $so->is_circular { # }|	    get or set|
|keywords|keywords, if available|@array = $so->keywords|get or set keywords|
|length|length, a number|$len = $so->length|get the length|
|molecule|molecule type, if available |$type = $so->molecule|get molecule (e.g. “RNA”, “DNA”)|
|namespace|namespace, if available | $so->namespace(“Private”)|get or set the name space|
|new|Sequence object|$so = Bio::Seq->new(-seq => “MPQRAS”)|create a new one, see?Bio::Seq?for more|
|pid| pid, if available|$pid = $so->pid| get pid|
|primary_id|identifier|$so->primary_id(12345)|get or set an identifier|
|revcom|Sequence object|$so2 = $so1->revcom|Reverse complement|
|seq|sequence string|$seq = $so->seq|get or set the sequence|
|seq_version|version, if available|$so->seq_version(“1″)|get or set a version|
|species|Species object|$species_obj = $so->species|See?Bio::Species?for more|
|subseq|sequence string|$string = $seq_obj->subseq(10,40)|Arguments are start and end|
|translate|protein Sequence object|$prot_obj = $dna_obj->translate|See the?Bioperl Tutorial?for more|
|trunc|Sequence object|$so2 = $so1->trunc(10,40)|Arguments are start and end|


##下面是用法；
```perl
  use Bio::Seq;
  use Bio::SeqIO;
# my $seq_obj=Bio::Seq->new(-seq => "ATGTGCGTCA",
		# -display_id=> "#12345",
		# -desc =>"example 1",
		# -alphabet=>"dna"
		# );
# print $seq_obj->seq;print "\n";
# print $seq_obj->length;
  my $seqio_obj=Bio::SeqIO->new(-file=>"fiber_smallRNA_mapped.fa",
		    -format=>"fasta",
				  );
my $seq_obj=$seqio_obj->next_seq;
print $seq_obj->seq;print "\n";		
# 循环读取数据
while (my $seq_obj = $seqio_obj->next_seq() )
{
  print the sequence
    print $seq_obj->seq()."\n";
}
#从数据库中来获取
use Bio::DB::GenBank;
my $db_obj = Bio::DB::GenBank->new();
my $seq_obj1 = $db_obj->get_Seq_by_id(515056);
print $seq_obj1->seq(), "\n";
my $seq_obj2 = $db_obj->get_Seq_by_acc("141D_A");
print $seq_obj2->seq(), "\n";
my $seq_obj3 = $db_obj->get_Seq_by_version("141D_B");
print $seq_obj3->seq(), "\n";	
```

# 计算一段程序的执行时间

```perl
use Benchmark;
my $timeStart = Benchmark->new;

my $sum;
for my $tmp(1..10000000){
    $sum+=$tmp;
}
print "$sum\n";

my $timeEnd = Benchmark->new;
my $time = timediff($timeEnd, $timeStart);
print "the code took:",timestr($time),"\n";
```
# 计算一个数据结构所占用的内存

```perl
use Devel::Size qw/size total_size/;

print total_size(\@data_structure);
```

# Little tips

please see the `Tips.pl`


