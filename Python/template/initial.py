#!/usr/bin/env python

################################################################################
## author: yudalang
## date:   2017,08.15
## aim:	  take two locus files and than calcu interescion!


################################################################################
import sys;


################################################################################
## function here !

################################################################################



filename = sys.argv[1];
try:
    f=open(filename, 'r');
except:
    print "File doesn't exist!" ;

if __name__ == '__main__':

for line in f:
    line=line.rstrip();
    #line.split(' ');
    print 1;

f.close();


'''
f=open('filename', 'w');

f.writelines(aList);

f.close;

for key, value in dict.items():
    print "%s key has the value %s (key, value)
'''
