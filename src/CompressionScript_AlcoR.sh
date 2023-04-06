
#Generate a set of sequences with seed between 1 and 100 and subs and adds varying between 0.1 and 5%
rm sequence.fasta 
rm sequence_model.fasta

AlcoR simulation -rs  2000:0:1:0:0:0 > sequence.fasta 
AlcoR simulation -rs  5000:0:1:0:0:0 >> sequence.fasta 
AlcoR simulation -rs 10000:0:1:0:0:0 >> sequence.fasta
AlcoR simulation -rs 50000:0:1:0:0:0 >> sequence.fasta
AlcoR simulation -rs 100000:0:1:0:0:0 >> sequence.fasta
AlcoR simulation -rs 200000:0:1:0:0:0 >> sequence.fasta   
#AlcoR simulation -rs  1000000:0:4:0:0:0 > sequence_model.fasta 
#for x in {1..50}
for x  in {2..400}
do 
 for y in {0..50}
 do
    AlcoR simulation -fs 1:2000:0:$x:0.0$y:0:0:sequence.fasta >> sequence.fasta
    AlcoR simulation -fs 2001:7000:0:$x:0.0$y:0:0:sequence.fasta >> sequence.fasta
    AlcoR simulation -fs 7001:17000:0:$x:0.0$y:0:0:sequence.fasta >> sequence.fasta
    AlcoR simulation -fs 17001:67000:0:$x:0.0$y:0:0:sequence.fasta >> sequence.fasta
    AlcoR simulation -fs 67001:167000:0:$x:0.0$y:0:0:sequence.fasta >> sequence.fasta
    AlcoR simulation -fs 167001:367000:0:$x:0.0$y:0:0:sequence.fasta >> sequence.fasta
    #AlcoR simulation -fs  1:1000000:0:$x:0.0$y:0:0:sequence_model.fasta >> sequence_model.fasta
       done
     done
####     
   
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 8 -t 8 sequence.fasta ; } 2>>mf_compresstimes.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -s sequence.fasta shuffled.fasta 5 ; } 2>>shuffle_times.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 8 -t 8 shuffled.fasta ; } 2>>mf_compresstimes_s2.txt

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=S sequence.fasta ordered_sequence_size.fasta 5 ; } 2>>ordering_times.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=AT sequence.fasta ordered_sequence_AT.fasta 5 ; } 2>>ordering_times.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=CG sequence.fasta ordered_sequence_CG.fasta 5 ; } 2>>ordering_times.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 8 -t 8 ordered_sequence_size.fasta ; } 2>>mf_compresstimes_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 8 -t 8 ordered_sequence_AT.fasta ; } 2>>mf_compresstimes_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 8 -t 8 ordered_sequence_CG.fasta ; } 2>>mf_compresstimes_s3.txt 

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=S shuffled.fasta ordered_shuffled_size.fasta 5 ; } 2>>ordering_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=AT shuffled.fasta ordered_shuffled_AT.fasta 5 ; } 2>>ordering_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=CG shuffled.fasta ordered_shuffled_CG.fasta 5 ; } 2>>ordering_times_s4.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 8 -t 8 ordered_shuffled_size.fasta ; } 2>>mf_compresstimes_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 8 -t 8 ordered_shuffled_AT.fasta ; } 2>>mf_compresstimes_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 8 -t 8 ordered_shuffled_CG.fasta ; } 2>>mf_compresstimes_s4.txt


{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 8 -t 8 sequence.fasta.mfc ; } 2>>mf_decompresstimes.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 8 -t 8 shuffled.fasta.mfc ; } 2>>mf_decompresstimes_s2.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 8 -t 8 ordered_sequence_size.fasta.mfc ; } 2>>mf_decompresstimes_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 8 -t 8 ordered_sequence_AT.fasta.mfc ; } 2>>mf_decompresstimes_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 8 -t 8 ordered_sequence_CG.fasta.mfc ; } 2>>mf_decompresstimes_s3.txt 

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 8 -t 8 ordered_shuffled_size.fasta.mfc ; } 2>>mf_decompresstimes_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 8 -t 8 ordered_shuffled_AT.fasta.mfc ; } 2>>mf_decompresstimes_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 8 -t 8 ordered_shuffled_CG.fasta.mfc ; } 2>>mf_decompresstimes_s4.txt
