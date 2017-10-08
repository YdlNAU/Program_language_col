#!/usr/bin/env python

################################################################################
## author: yudalang
## date:   2017,08.15
## aim:	  take two locus files and than calcu interescion!
## usage: py intersection_two_locus_files.py locus_1 locus_2


################################################################################
import sys;


################################################################################
## function here !

def sum_locus( d ):
    return sum(len(i) for i in d.itervalues() );

################################################################################


filename = sys.argv[1];

try:
    f=open(filename, 'r');
except:
    print "File doesn't exist!" ;

d = {};

for line in f:
    line=line.rstrip();
    chrName,start = line.split('\t');
    if d.has_key(chrName):
	d[ chrName ][start ] = True ;
    else:
	d[ chrName ] = { start:True} ;
 
f.close();

count1 = sum_locus(d);

print 'Non-repeat Locus in  ', filename , 'is: ', count1;

################################################################################################

filename = sys.argv[2];

d2 = {};

try:
    f=open(filename, 'r');
except:
    print "File doesn't exist!" ;


for line in f:
    line=line.rstrip();
    chrName,start = line.split('\t');

    if d2.has_key(chrName):
	d2[ chrName ][start ] = True ;
    else:
	d2[ chrName ] = { start:True} ;
 
f.close();

count2 = sum_locus(d2);

print 'Non-repeat Locus in  ', filename , 'is: ', count2;


n = 0;

for i in d2.keys():
    for j in d2[ i ].keys():
	if d.has_key( i ) and d[ i ].has_key( j ) :
	    n += 1;  

print 'The intersected locus of files is: ', n;
print 'The ratios are ', round (n * 100.0 /count1 , 2) ,' and ' , round (n * 100.0 / count2 , 2) ;
print "{0:.2f}%".format(n * 100.0 /count1 )
print "{0:.2f}%".format(n * 100.0 /count2 )



