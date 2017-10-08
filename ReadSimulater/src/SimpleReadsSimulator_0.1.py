#!/bin/python

import sys,os,re
from Bio import SeqIO
import numpy.random as nprnd #numpy is so great !

# Parameter Initiation
## input or output filenames
ref_genome = sys.argv[1]
reads_outFile_prefix = sys.argv[2]
out_file = sys.argv[3]
## sequence produce parameters
error_rate = 0 # allow no error
temple_len = 100 # tempelate length
pairEnd_read_len = 100 #
score_range=range(0,42) # use illumina 1.8+
temp_list = [i ** 6 for i in score_range]
score_dis_prob = [i * 1.0 / sum(temp_list) for i in temp_list] # the probability
reads_count=10
read1Len = pairEnd_read_len
read2Len = pairEnd_read_len
## other options
Paired = False # if you want to produce pair end reads or single end reads

# Note:
''' The fasta index is zero based !
'''


# Classes
class Read:
    def __init__(self,readIndex,subSequence,idPrefix):
        self.startPosition = readIndex
        self.id = '@'+idPrefix+'_SEQID_' + str(readIndex) + '_' + str(pairEnd_read_len)
        self.score = self.scoreGenerator(subSequence)
        self.seq = subSequence
        self.seqLen = len(subSequence)

    def addError(self):
        candAlleles = ['A','C','G','T']
        for i in range(self.seqLen):
            p = nprnd.uniform(0,1)
            if(p <= error_rate):
                candAlleles.remove(self.seq[i])
                temp_seq_list = list(self.seq)
                s = nprnd.choice(candAlleles,size =1)
                temp_seq_list[i] = s[0]
                self.seq = ''.join(temp_seq_list)
                candAlleles = ['A','C','G','T']
                self.id = self.id + "_ERROR:" + str(i)
                # add the single nucleus to the identifier

    def scoreGenerator(self,seq):
        # need some random, we add later
        rawScore = nprnd.choice(score_range,size = len(seq),p=score_dis_prob)
        sangerScore = [chr(x+33) for x in rawScore]
        return "".join(sangerScore)


    def addIndel(self):
        pass

    def pairedEndConverter(self):
        self.read1 = self.seq[0:read1Len]
        baseComplement = {'A': 'T', 'C': 'G', 'T': 'A', 'G': 'C'}
        tmpRead2 = self.seq[self.seqLen:self.seqLen-read2Len-1:-1]
        self.read2 = ''.join([baseComplement[x] for x in tmpRead2])
        self.read1Score = self.score[0:read1Len]
        self.read2Score = self.score[self.seqLen:self.seqLen-read2Len-1:-1]

    def writeToFile(self,readsFileHandle):
        if Paired == False:
            readsFileHandle.readsF.write(self.id + '\n')
            readsFileHandle.readsF.write(str(self.seq) + '\n')
            readsFileHandle.readsF.write('+' + '\n')
            readsFileHandle.readsF.write(self.score + '\n')
        else:
            readsFileHandle.reads1F.write(self.id + '/1\n')
            readsFileHandle.reads1F.write(str(self.read1) + '\n')
            readsFileHandle.reads1F.write('+' + '\n')
            readsFileHandle.reads1F.write(self.read1Score + '\n')

            readsFileHandle.reads2F.write(self.id + '/2\n')
            readsFileHandle.reads2F.write(str(self.read2) + '\n')
            readsFileHandle.reads2F.write('+' + '\n')
            readsFileHandle.reads2F.write(self.read2Score + '\n')

    def printer(self):
        print self.id
        print self.seq
        print self.score

class ReadsFileHandle:
    def __init__(self,filePrefix):
        if Paired == False:
            self.fileName = [filePrefix+'.fastq']
        else:
            self.fileName = [filePrefix+'1.fastq',filePrefix+'2.fastq']

    def fileOpen(self):
        if Paired == False:
            self.readsF = open(self.fileName[0],'a')
        else:
            self.reads1F = open(self.fileName[0],'a')
            self.reads2F = open(self.fileName[1],'a')

    def fileClose(self):
        if Paired == False:
            self.readsF.close()
        else:
            self.reads1F.close()
            self.reads2F.close()

    def fileDelete(self):
        for file in self.fileName:
            if os.path.isfile(file):
                print 'Removing ' + str(file) + '!'
                os.system('rm ' + file)

# Function for generating reads
def generateReads(seqBiopython):
    sequence = seqBiopython.seq
    idPrefix = seqBiopython.id
    # create the random reads start site in fasta
    reads_start_index = nprnd.randint(0,len(sequence), size=reads_count)

    for i in reads_start_index:
        # next if template length out of bound
        if i + temple_len > len(sequence) - 1:
            continue

        subSeq = str(sequence[i:i+temple_len])
        if Paired == True:
            read = Read(i,subSeq,idPrefix)
            read.pairedEndConverter()
            read.writeToFile(readsFileH)
        else:
            read = Read(i,subSeq,idPrefix)
            read.addError()
            read.writeToFile(readsFileH)

if __name__ == '__main__':
    readsFileH = ReadsFileHandle(reads_outFile_prefix)
    #Initialize the ReadsFileHandle class
    readsFileH.fileDelete()
    readsFileH.fileOpen()
    # Remove the out_file if exists
    if os.path.isfile(out_file):
        print 'Removing ' + out_file + '!'
        os.system('rm ' + out_file)

    for seqRecord in SeqIO.parse(sys.argv[1],'fasta'):
        generateReads(seqRecord)

    readsFileH.fileClose()

