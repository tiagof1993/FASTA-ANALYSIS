#Generate a set of sequences with seed between 1 and 100 and subs and adds varying between 0.1 and 5%
#rm sequence.fasta
rm sequence_model.fasta
rm shuffled.fasta.gz
rm ordered_sequence_model_size.fasta.gz
rm ordered_sequence_model_AT.fasta.gz
rm ordered_sequence_model_CG.fasta.gz
rm ordered_shuffled_size.fasta.gz
rm ordered_shuffled_AT.fasta.gz
rm ordered_shuffled_CG.fasta.gz


AlcoR simulation -rs  2000:0:1:0:0:0 > sequence_a.fasta
AlcoR simulation -rs  5000:0:3:0:0:0 > sequence_b.fasta
AlcoR simulation -rs 10000:0:5:0:0:0 > sequence_c.fasta
AlcoR simulation -rs 50000:0:7:0:0:0 > sequence_d.fasta
AlcoR simulation -rs 100000:0:11:0:0:0 > sequence_e.fasta
AlcoR simulation -rs 200000:0:13:0:0:0 > sequence_f.fasta  

#index=1
for x  in {1..400}
do
 for y in {0..10}
 do
    AlcoR simulation -fs 1:2000:0:$x:0.0$y:0:0:sequence_a.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:5000:0:$x:0.0$y:0:0:sequence_b.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:10000:0:$x:0.0$y:0:0:sequence_c.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:50000:0:$x:0.0$y:0:0:sequence_d.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:100000:0:$x:0.0$y:0:0:sequence_e.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:200000:0:$x:0.0$y:0:0:sequence_f.fasta >> sequence_model.fasta
   
       done
     done
####    
sed -i '/^$/d' sequence_model.fasta  

#Shuffle
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -s sequence_model.fasta shuffled.fasta 5 ; } 2>>shuffle_times.txt

#Sorting
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=S sequence_model.fasta ordered_sequence_model_size.fasta 5 ; } 2>>ordering_times.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=AT sequence_model.fasta ordered_sequence_model_AT.fasta 5 ; } 2>>ordering_times.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=CG sequence_model.fasta ordered_sequence_model_CG.fasta 5 ; } 2>>ordering_times.txt

#Shuffle + Sort
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=S shuffled.fasta ordered_shuffled_size.fasta 5 ; } 2>>ordering_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=AT shuffled.fasta ordered_shuffled_AT.fasta 5 ; } 2>>ordering_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=CG shuffled.fasta ordered_shuffled_CG.fasta 5 ; } 2>>ordering_times_s4.txt

#NAF
{ /bin/time -f "TIME\t%e\tMEM\t%M" ennaf --strict --temp-dir tmp/ --dna --level 22 sequence_model.fasta  ; } 2>>naf_times.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf sequence_model.fasta.naf -o sequence_model_naf.fasta ; } 2>>unnaf_times.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ennaf --strict --temp-dir tmp/ --dna --level 22 shuffled.fasta ; } 2>>naf_times_s2.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf shuffled.fasta.naf -o shuffled_naf.fasta ; } 2>>unnaf_times_s2.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level 22 ordered_sequence_model_size.fasta ; } 2>>naf_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ennaf --strict --temp-dir tmp/ --dna --level 22 ordered_sequence_model_AT.fasta ; } 2>>naf_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ennaf --strict --temp-dir tmp/ --dna --level 22 ordered_sequence_model_CG.fasta  ; } 2>>naf_times_s3.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf  ordered_sequence_model_size.fasta.naf -o ordered_sequence_model_size_naf.fasta ; } 2>>unnaf_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf  ordered_sequence_model_AT.fasta.naf -o ordered_sequence_model_AT_naf.fasta ; } 2>>unnaf_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf  ordered_sequence_model_CG.fasta.naf -o ordered_sequence_model_CG_naf.fasta ; } 2>>unnaf_times_s3.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level 22  ordered_shuffled_size.fasta ; } 2>>naf_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level 22 ordered_shuffled_AT.fasta  ; } 2>>naf_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level 22 ordered_shuffled_CG.fasta ; } 2>>naf_times_s4.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf ordered_shuffled_size.fasta.naf -o ordered_shuffled_size_naf.fasta ; } 2>>unnaf_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf ordered_shuffled_AT.fasta.naf -o ordered_shuffled_AT_naf.fasta ; } 2>>unnaf_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf ordered_shuffled_CG.fasta.naf -o ordered_shuffled_CG_naf.fasta ; } 2>>unnaf_times_s4.txt


#MFCompress
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 8 -t 8 sequence_model.fasta ; } 2>>mf_compresstimes.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 8 -t 8 shuffled.fasta ; } 2>>mf_compresstimes_s2.txt


{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 8 -t 8 ordered_sequence_model_size.fasta ; } 2>>mf_compresstimes_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 8 -t 8 ordered_sequence_model_AT.fasta ; } 2>>mf_compresstimes_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 8 -t 8 ordered_sequence_model_CG.fasta ; } 2>>mf_compresstimes_s3.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 8 -t 8 ordered_shuffled_size.fasta ; } 2>>mf_compresstimes_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 8 -t 8 ordered_shuffled_AT.fasta ; } 2>>mf_compresstimes_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 8 -t 8 ordered_shuffled_CG.fasta ; } 2>>mf_compresstimes_s4.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 8 -t 8 sequence_model.fasta.mfc ; } 2>>mf_decompresstimes.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 8 -t 8 shuffled.fasta.mfc ; } 2>>mf_decompresstimes_s2.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 8 -t 8 ordered_sequence_model_size.fasta.mfc ; } 2>>mf_decompresstimes_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 8 -t 8 ordered_sequence_model_AT.fasta.mfc ; } 2>>mf_decompresstimes_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 8 -t 8 ordered_sequence_model_CG.fasta.mfc ; } 2>>mf_decompresstimes_s3.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 8 -t 8 ordered_shuffled_size.fasta.mfc ; } 2>>mf_decompresstimes_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 8 -t 8 ordered_shuffled_AT.fasta.mfc ; } 2>>mf_decompresstimes_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 8 -t 8 ordered_shuffled_CG.fasta.mfc ; } 2>>mf_decompresstimes_s4.txt

#GZIP

{ /bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 sequence_model.fasta ; } 2>>gzip_times.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c sequence_model.fasta.gz >sequence_model_gz.fasta  ; } 2>>gunzip_times.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 shuffled.fasta ; } 2>>gzip_times_s2.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c shuffled.fasta.gz >shuffled_gz.fasta ; } 2>>gunzip_times_s2.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 ordered_sequence_model_size.fasta y ; } 2>>gzip_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 ordered_sequence_model_AT.fasta y ; } 2>>gzip_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 ordered_sequence_model_CG.fasta y ; } 2>>gzip_times_s3.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c ordered_sequence_model_size.fasta.gz >ordered_sequence_model_size_gz.fasta  ; } 2>>gunzip_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c ordered_sequence_model_AT.fasta.gz >ordered_sequence_model_AT_gz.fasta   ; } 2>>gunzip_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c ordered_sequence_model_CG.fasta.gz >ordered_sequence_model_CG_gz.fasta  ; } 2>>gunzip_times_s3.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 ordered_shuffled_size.fasta y ; } 2>>gzip_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 ordered_shuffled_AT.fasta y ; } 2>>gzip_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 ordered_shuffled_CG.fasta y ; } 2>>gzip_times_s4.txt


{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c ordered_shuffled_size.fasta.gz >ordered_shuffled_size_gz.fasta  ; } 2>>gunzip_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c ordered_shuffled_AT.fasta.gz >ordered_shuffled_AT_gz.fasta ; } 2>>gunzip_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c ordered_shuffled_CG.fasta.gz >ordered_shuffled_CG_gz.fasta ; } 2>>gunzip_times_s4.txt


#LZMA
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k -z sequence_model.fasta ; } 2>>lzma_times.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  sequence_model.fasta.lzma ; } 2>>lzma_decompress_times.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k shuffled.fasta ; } 2>> lzma_times_s2.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  shuffled.fasta.lzma ; } 2>> lzma_decompress_times_s2.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k ordered_sequence_model_size.fasta ; } 2>> lzma_times_s3.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k ordered_sequence_model_AT.fasta ; } 2>> lzma_times_s3.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k ordered_sequence_model_CG.fasta ; } 2>> lzma_times_s3.txt;

{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  ordered_sequence_model_size.fasta.lzma ; } 2>> lzma_decompress_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  ordered_sequence_model_AT.fasta.lzma ; } 2>> lzma_decompress_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  ordered_sequence_model_CG.fasta.lzma ; } 2>> lzma_decompress_times_s3.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k ordered_shuffled_size.fasta ; } 2>> lzma_times_s4.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k ordered_shuffled_AT.fasta ; } 2>> lzma_times_s4.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k ordered_shuffled_CG.fasta ; } 2>> lzma_times_s4.txt;

{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  ordered_shuffled_size.fasta.lzma ; } 2>> lzma_decompress_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  ordered_shuffled_AT.fasta.lzma ; } 2>> lzma_decompress_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  ordered_shuffled_CG.fasta.lzma ; } 2>> lzma_decompress_times_s4.txt




