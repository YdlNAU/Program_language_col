#!/usr/bin/env python

################################################################################
## author: yudalang
## date:   2017,08.15
## aim:	 just as it's name ! 


################################################################################
import sys;
from Bio.Seq import Seq





################################################################################
## function here !

################################################################################
strs = sys.argv[1];

seq = Seq(strs);

print 'The seq length is: ',len(strs);
print 'The reverse and complement sequence:';
print seq.reverse_complement()
print '\nThe complement sequence:';
print seq.complement()
print '\nThe reverse sequence:';
print strs[::-1]
print '\nTranslate to aa:'
print seq.translate()




