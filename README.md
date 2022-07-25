#Eficient_DNA_Compressor

The objective of this project is to find an improved way to compress files with genomic sequences (fasta,fastq,fa,etc). For that we already have a plentitude of compressing tools available in the market, such as NAF,MBGC,GZIP, among others.

But, if we can work on a previous ordered file, where we group the most similar sequences, it's reasonable to think, the end result will also improve. So, to achieve that, we'll run a C++ program dedicated to the order that type of file. The criteria used to do that can be decided by the user when he is running ./FASTA_ANALY. It can go from nucleotide pairs (AT or CG) to size and alphabetical order. Different types of criteria can be grouped to achieve better results.

On the other hand, there's also a compression script being developed where we test 4 different scenarios to understand what works best in compression. One where we just compress the original files, other where we order the sequences and then compress, another where we shuffle the sequences and then compress and finally, one where we mix the previous two strategies.

##Usage Example
` ./FASTA_ANALY -sort=AT 5 ordered_sequences_virus.fasta sequences_virus.fasta `

A description of the options available can be obtained by invoking:

` ./FASTA_ANALY -h `
