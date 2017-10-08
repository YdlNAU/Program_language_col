#!/usr/bin/env python

################################################################################
## author: yudalang

################################################################################
import sys;

################################################################################
## function here !

################################################################################
# Use the important function try!

## trace 1
'''
a=10
b=0
c=a/b
print "done"

'''

## trace 2
'''

a=10
b=0

try:
    c=a/b
    print c
except ZeroDivisionError,e:
    print e

print "done"


'''


## trace 3

print 'This is 1'

def pr():
    print 'This is 2'

print sys.exit(pr() )

# Summary :

try:

except :

else :

finally:
