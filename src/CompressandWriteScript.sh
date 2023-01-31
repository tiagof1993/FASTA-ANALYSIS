#Stage 1

rm naf_times.txt
rm mbgctimes.txt
rm gzip_times.txt
rm mf_compresstimes.txt
rm lzma_times.txt
rm bzip2_times.txt
rm stage1_time.txt
rm unnaf_times.txt
rm mbgcdtimes.txt
rm mf_decompresstimes.txt
rm gunzip_times.txt
rm lzma_decompress_times.txt
rm bzip2_decompress_times.txt
#rm sequences_virus.fasta.gz
#rm sequences_virus.fasta.mfc
#rm sequences_virus.mbgc
#rm sequences_virus.naf
rm CVDB.fasta.gz
rm CVDB.fasta.mfc
rm CVDB.mbgc
rm CVDB.naf
rm CVDB_naf.fasta
rm CVDB_mbgc.fasta

#How to print it example:
#awk 'FNR ==1 {print $2}' mf_compresstimes.txt -> Tempo
#awk 'FNR ==1 {print $4}' mf_compresstimes.txt -> Memória Gasta

#Compress
#/bin/time -f "TIME\t%e\tMEM\t%M" ennaf --strict CVDB.fasta --temp-dir tmp/ |& grep "TIME"  |& tr '.' ',' |& awk '{ printf $2/60"\t"$4/1024/1024"\n" }' > naf_times.txt;
#  BYTES=`ls -la CVDB.naf | awk '{ print $5 }'`;
  
{ /bin/time -f "TIME\t%e\tMEM\t%M" ennaf --strict --temp-dir tmp/ --dna --level 22 CVDB.fasta  ; } 2>>naf_times.txt

#{ /bin/time -f "TIME\t%e\tMEM\t%M" ennaf --strict CVDB.fasta -o CVDB.naf --temp-dir tmp/  ; } 2>>naf_times.txt

#{ /bin/time -f "TIME\t%e\tMEM\t%M" ennaf CVDB.fasta --temp-dir tmp/ --dna --level 22   ; } 2>>naf_times.txt

#/bin/time -f "TIME\t%e\tMEM\t%M" mbgc -i CVDB.fasta CVDB.mbgc \
#  |& grep "TIME" \
#  |& tr '.' ',' \
 # |& awk '{ printf $2/60"\t"$4/1024/1024"\n" }' > mbgctimes.txt;
#  BYTES=`ls -la CVDB.mbgc | awk '{ print $5 }'`;
{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -i CVDB.fasta CVDB.mbgc ; } 2>>mbgctimes.txt

#/bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -1 -t 2 CVDB.fasta \
#  |& grep "TIME" \
#  |& tr '.' ',' \
#  |& awk '{ printf $2/60"\t"$4/1024/1024"\n" }' > mf_compresstimes.txt;
#  BYTES=`ls -la CVDB.fasta.mfc | awk '{ print $5 }'`;
#  printf "CVDB.fasta.mfc\t$BYTES";
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 1 -t 1 CVDB.fasta ; } 2>>mf_compresstimes.txt


#/bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 CVDB.fasta \
#  |& grep "TIME" \
#  |& tr '.' ',' \
#  |& awk '{ printf $2/60"\t"$4/1024/1024"\n" }' > gzip_times.txt;
#  BYTES=`ls -la CVDB.fasta.gz | awk '{ print $5 }'`;
{ /bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 CVDB.fasta ; } 2>>gzip_times.txt

#LZMA
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k -z CVDB.fasta ; } 2>>lzma_times.txt;

#Bzip2
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -9 -f -k -z CVDB.fasta ; } 2>>bzip2_times.txt;

#/bin/time -f "TIME\t%e\tMEM\t%M" unnaf CVDB.naf -o  CVDB.naf.fasta \
#  |& grep "TIME" \
#  |& tr '.' ',' \
#  |& awk '{ printf $2/60"\t"$4/1024/1024"\n" }' > unnaf_times.txt;
#  BYTES=`ls -la CVDB.naf.fasta | awk '{ print $5 }'`;
{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf CVDB.fasta.naf -o CVDB_naf.fasta ; } 2>>unnaf_times.txt

#{ time mbgc -d CVDB.mbgc CVDB_mbgc.fasta ; } 2>>mbgcdtimes.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 1 -t 1  CVDB.fasta.mfc ; } 2>>mf_decompresstimes.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c CVDB.fasta.gz >CVDB_gz.fasta  ; } 2>>gunzip_times.txt

#LZMA
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  CVDB.fasta.lzma ; } 2>>lzma_decompress_times.txt

#Bzip2
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d CVDB.fasta.bz2 ;} 2>>bzip2_decompress_times.txt


#Stage 2
rm naf_times_s2.txt
rm mbgctimes_s2.txt
rm gzip_times_s2.txt
rm mf_compresstimes_s2.txt
rm lzma_times_s2.txt
rm bzip2_times_s2.txt
rm mbgcdtimes_s2.txt
rm mf_decompresstimes_s2.txt
rm gunzip_times_s2.txt
rm stage2_time.txt
rm lzma_times_decompress_s2.txt
rm bzip2_times_decompress_s2.txt
rm shuffled.fasta.gz
rm shuffled.fasta.mfc
rm shuffled.mbgc
rm shuffled.naf
rm shuffled_naf.fasta
rm shuffled_mbgc.fasta

#{ ./SHUFFLE_FASTA AT 5 shuffled.fasta sequences_virus.fasta ; } 2>>shuffle_times.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -s CVDB.fasta shuffled.fasta 5 ; } 2>>shuffle_times.txt
#sed -i '$ s/.$//' shuffled.fasta
{ /bin/time -f "TIME\t%e\tMEM\t%M" ennaf -- strict --temp-dir tmp/ --dna --level 22 shuffled.fasta ; } 2>>naf_times_s2.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -i shuffled.fasta shuffled.mbgc ; } 2>>mbgctimes_s2.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 1 -t 1 shuffled.fasta ; } 2>>mf_compresstimes_s2.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 shuffled.fasta ; } 2>>gzip_times_s2.txt

#LZMA
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k shuffled.fasta ; } 2>> lzma_times_s2.txt;

#Bzip2
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -9 -f -k shuffled.fasta ; } 2>> bzip2_times_s2.txt;

#Decompress

{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf shuffled.fasta.naf -o shuffled_naf.fasta ; } 2>>unnaf_times_s2.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -d shuffled.mbgc shuffled_mbgc.fasta ; } 2>>mbgcdtimes_s2.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 1 -t 1 shuffled.fasta.mfc ; } 2>>mf_decompresstimes_s2.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c shuffled.fasta.gz >shuffled_gz.fasta ; } 2>>gunzip_times_s2.txt

#LZMA
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  shuffled.fasta.lzma ; } 2>> lzma_decompress_times_s2.txt

#Bzip2
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d  shuffled.fasta.bz2 ; } 2>> bzip2_decompress_times_s2.txt


#Stage 3

rm naf_times_s3.txt
rm mbgctimes_s3.txt
rm gzip_times_s3.txt
rm mf_compresstimes_s3.txt
rm lzma_times_s3.txt
rm unnaf_times_s3.txt
rm mbgcdtimes_s3.txt
rm gunzip_times_s3.txt
rm mf_decompresstimes_s3.txt
rm bzip2_times_s3.txt
rm lzma_decompress_times_s3.txt
rm bzip2_decompress_times_s3.txt
rm stage3_time.txt
#rm ordered_sequences_virus.fasta.gz
#rm ordered_sequences_virus.fasta.mfc
#rm ordered_sequences_virus.mbgc
#rm ordered_sequences_virus.naf
rm ordered_CVDB.fasta.gz
rm ordered_CVDB.fasta.mfc
rm ordered_CVDB.mbgc
rm ordered_CVDB.naf
rm ordered_CVDB_naf.fasta
rm ordered_CVDB_mbgc.fasta
rm ordering_times.txt

{/bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=S CVDB.fasta ordered_CVDB_size.fasta 5 ; } 2>>ordering_times.txt
#sed -i '$ s/.$//' ordered_CVDB_size.fasta
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=AT CVDB.fasta ordered_CVDB_AT.fasta 5 ; } 2>>ordering_times.txt
#sed -i '$ s/.$//' ordered_CVDB_AT.fasta
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=CG CVDB.fasta ordered_CVDB_CG.fasta 5 ; } 2>>ordering_times.txt
#sed -i '$ s/.$//' ordered_CVDB_CG.fasta

#sed $'s/\r//' -i ordered_CVDB_AT.fasta

#ennaf
{ /bin/time -f "TIME\t%e\tMEM\t%M" ennaf --strict  ordered_CVDB_size.fasta -o ordered_CVDB_size.naf --temp-dir tmp/  ; } 2>>naf_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ennaf --strict  ordered_CVDB_AT.fasta -o ordered_CVDB_AT.naf --temp-dir tmp/  ; } 2>>naf_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ennaf --strict  ordered_CVDB_CG.fasta -o ordered_CVDB_CG.naf --temp-dir tmp/  ; } 2>>naf_times_s3.txt

#mbgc
{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -i ordered_CVDB_size.fasta ordered_CVDB_size.mbgc ; } 2>>mbgctimes_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -i ordered_CVDB_AT.fasta ordered_CVDB_AT.mbgc ; } 2>>mbgctimes_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -i ordered_CVDB_CG.fasta ordered_CVDB_CG.mbgc ; } 2>>mbgctimes_s3.txt

#MFC
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -1 -t 2 ordered_CVDB_size.fasta ; } 2>>mf_compresstimes_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -1 -t 2 ordered_CVDB_AT.fasta ; } 2>>mf_compresstimes_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -1 -t 2 ordered_CVDB_CG.fasta ; } 2>>mf_compresstimes_s3.txt

#gzip
{ /bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 ordered_CVDB_size.fasta y ; } 2>>gzip_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 ordered_CVDB_AT.fasta y ; } 2>>gzip_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 ordered_CVDB_CG.fasta y ; } 2>>gzip_times_s3.txt

#LZMA
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k ordered_CVDB_size.fasta ; } 2>> lzma_times_s3.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k ordered_CVDB_AT.fasta ; } 2>> lzma_times_s3.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k ordered_CVDB_CG.fasta ; } 2>> lzma_times_s3.txt;


#Bzip2
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -9 -f -k ordered_CVDB_size.fasta ; } 2>> bzip2_times_s3.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -9 -f -k ordered_CVDB_AT.fasta ; } 2>>  bzip2_times_s3.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -9 -f -k ordered_CVDB_CG.fasta ; } 2>> bzip2_times_s3.txt;

#Decompress
#UNNAF
{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf  ordered_CVDB_size.naf -o ordered_CVDB_size_naf.fasta ; } 2>>unnaf_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf  ordered_CVDB_AT.naf -o ordered_CVDB_AT_naf.fasta ; } 2>>unnaf_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf  ordered_CVDB_CG.naf -o ordered_CVDB_CG_naf.fasta ; } 2>>unnaf_times_s3.txt

#MBGC
{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -d ordered_CVDB_size.mbgc ordered_CVDB_size_mbgc.fasta ; } 2>>mbgcdtimes_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -d ordered_CVDB_AT.mbgc ordered_CVDB_AT_mbgc.fasta ; } 2>>mbgcdtimes_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -d ordered_CVDB_CG.mbgc ordered_CVDB_CG_mbgc.fasta ; } 2>>mbgcdtimes_s3.txt

#MFCD
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -t 2 ordered_CVDB_size.fasta.mfc ; } 2>>mf_decompresstimes_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -t 2 ordered_CVDB_AT.fasta.mfc ; } 2>>mf_decompresstimes_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -t 2 ordered_CVDB_CG.fasta.mfc ; } 2>>mf_decompresstimes_s3.txt

#gunzip
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c ordered_CVDB_size.fasta.gz >ordered_CVDB_size_gz.fasta  ; } 2>>gunzip_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c ordered_CVDB_AT.fasta.gz >ordered_CVDB_AT_gz.fasta   ; } 2>>gunzip_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c ordered_CVDB_CG.fasta.gz >ordered_CVDB_CG_gz.fasta  ; } 2>>gunzip_times_s3.txt

#LZMA
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  ordered_CVDB_size.fasta.lzma ; } 2>> lzma_decompress_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  ordered_CVDB_AT.fasta.lzma ; } 2>> lzma_decompress_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  ordered_CVDB_CG.fasta.lzma ; } 2>> lzma_decompress_times_s3.txt

#Bzip2
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d  ordered_CVDB_size.fasta.bz2 ; } 2>> bzip2_decompress_times_s3
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d  ordered_CVDB_AT.fasta.bz2 ; } 2>> bzip2_decompress_times_s3
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d  ordered_CVDB_CG.fasta.bz2 ; } 2>> bzip2_decompress_times_s3



#Stage 4

rm naf_times_s4.txt
rm mbgctimes_s4.txt
rm gzip_times_s4.txt
rm mf_compresstimes_s4.txt
rm lzma_times_s4.txt
rm bzip2_times_s4.txt
rm unnaf_times_s4.txt
rm mbgcdtimes_s4.txt
rm gunzip_times_s4.txt
rm mf_decompresstimes_s4.txt
rm lzma_decompress_times_s4.txt
rm bzip2_decompress_times_s4.txt
rm ordering_times_s4.txt
rm stage4_time.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=S shuffled.fasta ordered_shuffled_size.fasta 5 ; } 2>>ordering_times_s4.txt
#sed -i '$ s/.$//' ordered_shuffled_size.fasta
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=AT shuffled.fasta ordered_shuffled_AT.fasta 5 ; } 2>>ordering_times_s4.txt
#sed -i '$ s/.$//' ordered_shuffled_AT.fasta
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=CG shuffled.fasta ordered_shuffled_CG.fasta 5 ; } 2>>ordering_times_s4.txt
#sed -i '$ s/.$//' ordered_shuffled_CG.fasta
{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level 22  ordered_shuffled_size.fasta ; } 2>>naf_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level 22 ordered_shuffled_AT.fasta  ; } 2>>naf_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level 22 ordered_shuffled_CG.fasta ; } 2>>naf_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -i ordered_shuffled_size.fasta ordered_shuffled_size.mbgc ; } 2>>mbgctimes_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -i ordered_shuffled_AT.fasta ordered_shuffled_AT.mbgc ; } 2>>mbgctimes_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -i ordered_shuffled_CG.fasta ordered_shuffled_CG.mbgc ; } 2>>mbgctimes_s4.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 1 -t 1 ordered_shuffled_size.fasta ; } 2>>mf_compresstimes_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 1 -t 1 ordered_shuffled_AT.fasta ; } 2>>mf_compresstimes_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 1 -t 1 ordered_shuffled_CG.fasta ; } 2>>mf_compresstimes_s4.txt


{ /bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 ordered_shuffled_size.fasta y ; } 2>>gzip_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 ordered_shuffled_AT.fasta y ; } 2>>gzip_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 ordered_shuffled_CG.fasta y ; } 2>>gzip_times_s4.txt

#LZMA
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k ordered_shuffled_size.fasta ; } 2>> lzma_times_s4.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k ordered_shuffled_AT.fasta ; } 2>> lzma_times_s4.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k ordered_shuffled_CG.fasta ; } 2>> lzma_times_s4.txt;

#Bzip2
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -9 -f -k ordered_shuffled_size.fasta ; } 2>> bzip2_times_s4.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -9 -f -k ordered_shuffled_AT.fasta ; } 2>> bzip2_times_s4.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -9 -f -k ordered_shuffled_CG.fasta ; } 2>> bzip2_times_s4.txt;


{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf ordered_shuffled_size.fasta.naf -o ordered_shuffled_size_naf.fasta ; } 2>>unnaf_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf ordered_shuffled_AT.fasta.naf -o ordered_shuffled_AT_naf.fasta ; } 2>>unnaf_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf ordered_shuffled_CG.fasta.naf -o ordered_shuffled_CG_naf.fasta ; } 2>>unnaf_times_s4.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -d ordered_shuffled_size.mbgc ordered_shuffled_mbgc_size.fasta ; } 2>>mbgcdtimes_s4_.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -d ordered_shuffled_AT.mbgc ordered_shuffled_mbgc_AT.fasta ; } 2>>mbgcdtimes_s4_.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -d ordered_shuffled_CG.mbgc ordered_shuffled_mbgc_CG.fasta ; } 2>>mbgcdtimes_s4_.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 1 -t 1 ordered_shuffled_size.fasta.mfc ; } 2>>mf_decompresstimes_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 1 -t 1 ordered_shuffled_AT.fasta.mfc ; } 2>>mf_decompresstimes_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 1 -t 1 ordered_shuffled_CG.fasta.mfc ; } 2>>mf_decompresstimes_s4.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c ordered_shuffled_size.fasta.gz >ordered_shuffled_size_gz.fasta  ; } 2>>gunzip_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c ordered_shuffled_AT.fasta.gz >ordered_shuffled_AT_gz.fasta ; } 2>>gunzip_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c ordered_shuffled_CG.fasta.gz >ordered_shuffled_CG_gz.fasta ; } 2>>gunzip_times_s4.txt


#LZMA
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  ordered_shuffled_size.fasta.lzma ; } 2>> lzma_decompress_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  ordered_shuffled_AT.fasta.lzma ; } 2>> lzma_decompress_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  ordered_shuffled_CG.fasta.lzma ; } 2>> lzma_decompress_times_s4.txt

#Bzip2
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d  ordered_shuffled_size.fasta.bz2 ; } 2>> bzip2_decompress_times_s4
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d  ordered_shuffled_AT.fasta.bz2 ; } 2>> bzip2_decompress_times_s4
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d  ordered_shuffled_CG.fasta.bz2 ; } 2>> bzip2_decompress_times_s4

#Writing data to xls file


rm Output_naf.csv

original_file_size=$(ls CVDB.fasta -la -ltr |awk '{print $5;}')

#Stage 4

#Decompression CG
#file_name=$(ls ordered_shuffled_CG* -la -ltr | grep \_bz2.fasta$ |awk '{print $9;}')
#size=$(ls ordered_shuffled_CG* -la -ltr | grep \._bz2.fasta$ |awk '{print $5;}')
file_name=$(ls ordered_shuffled_CG.fasta -la -ltr  |awk '{print $9;}')
size=$(ls ordered_shuffled_CG.fasta -la -ltr |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' bzip2_decompress_times_s4.txt)
memory=$(awk 'FNR ==3 {print $4}' bzip2_decompress_times_s4.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

#file_name=$(ls ordered_shuffled_CG* -la -ltr | grep \_lzma.fasta$ |awk '{print $9;}')
#size=$(ls ordered_shuffled_CG* -la -ltr | grep \._lzma.fasta$ |awk '{print $5;}')
file_name=$(ls ordered_shuffled_CG.fasta -la -ltr  |awk '{print $9;}')
size=$(ls ordered_shuffled_CG.fasta -la -ltr |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' lzma_decompress_times_s4.txt)
memory=$(awk 'FNR ==3 {print $4}' lzma_decompress_times_s4.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_CG* -la -ltr | grep \_gz.fasta$ |awk '{print $9;}')
size=$(ls ordered_shuffled_CG* -la -ltr | grep \._gz.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' gunzip_times_s4.txt)
memory=$(awk 'FNR ==3 {print $4}' gunzip_times_s4.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_CG* -la -ltr | grep \.mfc.d$ |awk '{print $9;}')
size=$(ls ordered_shuffled_CG* -la -ltr | grep \.mfc.d$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' mf_decompresstimes_s4.txt)
memory=$(awk 'FNR ==3 {print $4}' mf_decompresstimes_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_CG* -la -ltr | grep \._naf.fasta$ |awk '{print $9;}')
size=$(ls ordered_shuffled_CG* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' unnaf_times_s4.txt) 
memory=$(awk 'FNR ==3 {print $4}' unnaf_times_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

#Decompression AT
#file_name=$(ls ordered_shuffled_AT* -la -ltr | grep \_bz2.fasta$ |awk '{print $9;}')
#size=$(ls ordered_shuffled_AT* -la -ltr | grep \._bz2.fasta$ |awk '{print $5;}')
file_name=$(ls ordered_shuffled_AT.fasta -la -ltr  |awk '{print $9;}')
size=$(ls ordered_shuffled_AT.fasta -la -ltr |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' bzip_decompress_times_s4.txt)
memory=$(awk 'FNR ==2 {print $4}' bzip_decompress_times_s4.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

#file_name=$(ls ordered_shuffled_AT* -la -ltr | grep \_lzma.fasta$ |awk '{print $9;}')
#size=$(ls ordered_shuffled_AT* -la -ltr | grep \._lzma.fasta$ |awk '{print $5;}')
file_name=$(ls ordered_shuffled_AT.fasta -la -ltr  |awk '{print $9;}')
size=$(ls ordered_shuffled_AT.fasta -la -ltr |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' lzma_decompress_times_s4.txt)
memory=$(awk 'FNR ==2 {print $4}' lzma_decompress_times_s4.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_AT* -la -ltr | grep \_gz.fasta$ |awk '{print $9;}')
size=$(ls ordered_shuffled_AT* -la -ltr | grep \._gz.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' gunzip_times_s4.txt)
memory=$(awk 'FNR ==2 {print $4}' gunzip_times_s4.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_AT* -la -ltr | grep \.mfc.d$ |awk '{print $9;}')
size=$(ls ordered_shuffled_AT* -la -ltr | grep \.mfc.d$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' mf_decompresstimes_s4.txt)
memory=$(awk 'FNR ==2 {print $4}' mf_decompresstimes_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_AT* -la -ltr | grep \._naf.fasta$ |awk '{print $9;}')
size=$(ls ordered_shuffled_AT* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' unnaf_times_s4.txt) 
memory=$(awk 'FNR ==2 {print $4}' unnaf_times_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

#Decompression
#file_name=$(ls ordered_shuffled_size* -la -ltr | grep \_bz2.fasta$ |awk '{print $9;}')
#size=$(ls ordered_shuffled_size* -la -ltr | grep \._bz2.fasta$ |awk '{print $5;}')
file_name=$(ls ordered_shuffled_size.fasta -la -ltr  |awk '{print $9;}')
size=$(ls ordered_shuffled_size.fasta -la -ltr |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' bzip_decompress_times_s4.txt)
memory=$(awk 'FNR ==1 {print $4}' bzip_decompress_times_s4.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

#file_name=$(ls ordered_shuffled_size* -la -ltr | grep \_lzma.fasta$ |awk '{print $9;}')
#size=$(ls ordered_shuffled_size* -la -ltr | grep \._lzma.fasta$ |awk '{print $5;}')
file_name=$(ls ordered_shuffled_size.fasta -la -ltr  |awk '{print $9;}')
size=$(ls ordered_shuffled_size.fasta -la -ltr |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' lzma_decompress_times_s4.txt)
memory=$(awk 'FNR ==1 {print $4}' lzma_decompress_times_s4.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_size* -la -ltr | grep \_gz.fasta$ |awk '{print $9;}')
size=$(ls ordered_shuffled_size* -la -ltr | grep \._gz.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' gunzip_times_s4.txt)
memory=$(awk 'FNR ==1 {print $4}' gunzip_times_s4.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_size* -la -ltr | grep \.mfc.d$ |awk '{print $9;}')
size=$(ls ordered_shuffled_size* -la -ltr | grep \.mfc.d$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' mf_decompresstimes_s4.txt) 
memory=$(awk 'FNR ==1 {print $4}' mf_decompresstimes_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_size* -la -ltr | grep \._naf.fasta$ |awk '{print $9;}')
size=$(ls ordered_shuffled_size* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' unnaf_times_s4.txt) 
memory=$(awk 'FNR ==1 {print $4}' unnaf_times_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"File Name","Bytes","Seconds","RAM"
.
wq
EOF
}

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"Decompression Data",
.
wq
EOF
}

#Compression CG
file_name=$(ls ordered_shuffled_CG* -la -ltr | grep \.fasta.bz2$ |awk '{print $9;}')
size=$(ls ordered_shuffled_CG* -la -ltr | grep \.fasta.bz2$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' bzip2_times_s4.txt)
memory=$(awk 'FNR ==3 {print $4}' bzip2_times_s4.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls ordered_shuffled_CG* -la -ltr | grep \.fasta.lzma$ |awk '{print $9;}')
size=$(ls ordered_shuffled_CG* -la -ltr | grep \.fasta.lzma$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' lzma_times_s4.txt) 
memory=$(awk 'FNR ==3 {print $4}' lzma_times_s4.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls ordered_shuffled_CG* -la -ltr | grep \.fasta.gz$ |awk '{print $9;}')
size=$(ls ordered_shuffled_CG* -la -ltr | grep \.fasta.gz$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' gzip_times_s4.txt)
memory=$(awk 'FNR ==3 {print $4}' gzip_times_s4.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls ordered_shuffled_CG* -la -ltr | grep \.mfc$ |awk '{print $9;}')
size=$(ls ordered_shuffled_CG* -la -ltr | grep \.mfc$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' mf_compresstimes_s4.txt) 
memory=$(awk 'FNR ==3 {print $4}' mf_compresstimes_s4.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls ordered_shuffled_CG* -la -ltr | grep \.naf$ |awk '{print $9;}')
size=$(ls ordered_shuffled_CG* -la -ltr | grep \.naf$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' naf_times_s4.txt) 
memory=$(awk 'FNR ==3 {print $4}' naf_times_s4.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

#Compression AT
file_name=$(ls ordered_shuffled_AT* -la -ltr | grep \.fasta.bz2$ |awk '{print $9;}')
size=$(ls ordered_shuffled_AT* -la -ltr | grep \.fasta.bz2$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' bzip2_times_s4.txt) 
memory=$(awk 'FNR ==2 {print $4}' bzip2_times_s4.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time.$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls ordered_shuffled_AT* -la -ltr | grep \.fasta.lzma$ |awk '{print $9;}')
size=$(ls ordered_shuffled_AT* -la -ltr | grep \.fasta.lzma$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' lzma_times_s4.txt)
memory=$(awk 'FNR ==2 {print $4}' lzma_times_s4.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls ordered_shuffled_AT* -la -ltr | grep \.fasta.gz$ |awk '{print $9;}')
size=$(ls ordered_shuffled_AT* -la -ltr | grep \.fasta.gz$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' gzip_times_s4.txt) 
memory=$(awk 'FNR ==2 {print $4}' gzip_times_s4.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls ordered_shuffled_AT* -la -ltr | grep \.mfc$ |awk '{print $9;}')
size=$(ls ordered_shuffled_AT* -la -ltr | grep \.mfc$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' mf_compresstimes_s4.txt) 
memory=$(awk 'FNR ==2 {print $4}' mf_compresstimes_s4.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls ordered_shuffled_AT* -la -ltr | grep \.naf$ |awk '{print $9;}')
size=$(ls ordered_shuffled_AT* -la -ltr | grep \.naf$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' naf_times_s4.txt) 
memory=$(awk 'FNR ==2 {print $4}' naf_times_s4.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

#Compression
file_name=$(ls ordered_shuffled_size* -la -ltr | grep \.fasta.bz2$ |awk '{print $9;}')
size=$(ls ordered_shuffled_size* -la -ltr | grep \.fasta.bz2$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' bzip2_times_s4.txt) 
memory=$(awk 'FNR ==1 {print $4}' bzip2_times_s4.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls ordered_shuffled_size* -la -ltr | grep \.fasta.lzma$ |awk '{print $9;}')
size=$(ls ordered_shuffled_size* -la -ltr | grep \.fasta.lzma$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' lzma_times_s4.txt) 
memory=$(awk 'FNR ==1 {print $4}' lzma_times_s4.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls ordered_shuffled_size* -la -ltr | grep \.fasta.gz$ |awk '{print $9;}')
size=$(ls ordered_shuffled_size* -la -ltr | grep \.fasta.gz$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' gzip_times_s4.txt) 
memory=$(awk 'FNR ==1 {print $4}' gzip_times_s4.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls ordered_shuffled_size* -la -ltr | grep \.mfc$ |awk '{print $9;}')
size=$(ls ordered_shuffled_size* -la -ltr | grep \.mfc$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' mf_compresstimes_s4.txt)
time=$(awk 'FNR ==1 {print $4}' mf_compresstimes_s4.txt)  
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls ordered_shuffled_size* -la -ltr | grep \.naf$ |awk '{print $9;}')
size=$(ls ordered_shuffled_size* -la -ltr | grep \.naf$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' naf_times_s4.txt)
memory=$(awk 'FNR ==1 {print $4}' naf_times_s4.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}



file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"File Name","Bytes","Seconds","RAM","Compression Ratio"
.
wq
EOF
}


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"Stage 4",
.
wq
EOF
}




#Stage 3

#Decompression CG
#file_name=$(ls ordered_CVDB_CG* -la -ltr | grep \_bz2.fasta$ |awk '{print $9;}')
#size=$(ls sordered_CVDB_CG* -la -ltr | grep \._bz2.fasta$ |awk '{print $5;}')
file_name=$(ls ordered_CVDB_CG.fasta -la -ltr |awk '{print $9;}')
size=$(ls ordered_CVDB_CG.fasta -la -ltr |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' bzip2_decompress_times_s3.txt)
memory=$(awk 'FNR ==3 {print $4}' bzip2_decompress_times_s3.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

#file_name=$(ls ordered_CVDB_CG* -la -ltr | grep \_lzma.fasta$ |awk '{print $9;}')
#size=$(ls sordered_CVDB_CG* -la -ltr | grep \._lzma.fasta$ |awk '{print $5;}')
file_name=$(ls ordered_CVDB_CG.fasta -la -ltr |awk '{print $9;}')
size=$(ls ordered_CVDB_CG.fasta -la -ltr |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' lzma_decompress_times_s3.txt)
memory=$(awk 'FNR ==3 {print $4}' lzma_decompress_times_s3.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_CVDB_CG* -la -ltr | grep \_gz.fasta$ |awk '{print $9;}')
size=$(ls ordered_CVDB_CG* -la -ltr | grep \._gz.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' gunzip_times_s3.txt)
memory=$(awk 'FNR ==3 {print $4}' gunzip_times_s3.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_CVDB_CG* -la -ltr | grep \.mfc.d$ |awk '{print $9;}')
size=$(ls ordered_CVDB_CG* -la -ltr | grep \.mfc.d$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' mf_decompresstimes_s3.txt)
memory=$(awk 'FNR ==3 {print $4}' mf_decompresstimes_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_CVDB_CG* -la -ltr | grep \._naf.fasta$ |awk '{print $9;}')
size=$(ls ordered_CVDB_CG* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' unnaf_times_s3.txt)
memory=$(awk 'FNR ==3 {print $4}' unnaf_times_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

#Decompression AT
#file_name=$(ls ordered_CVDB_AT* -la -ltr | grep \_bz2.fasta$ |awk '{print $9;}')
#size=$(ls sordered_CVDB_AT* -la -ltr | grep \._bz2.fasta$ |awk '{print $5;}')
file_name=$(ls ordered_AT_size.fasta -la -ltr |awk '{print $9;}')
size=$(ls ordered_AT_size.fasta -la -ltr |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' bzip2_decompress_times_s3.txt)
memory=$(awk 'FNR ==2 {print $4}' bzip2_decompress_times_s3.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

#file_name=$(ls ordered_CVDB_AT* -la -ltr | grep \_lzma.fasta$ |awk '{print $9;}')
#size=$(ls sordered_CVDB_AT* -la -ltr | grep \._lzma.fasta$ |awk '{print $5;}')
file_name=$(ls ordered_CVDB_AT.fasta -la -ltr |awk '{print $9;}')
size=$(ls ordered_CVDB_AT.fasta -la -ltr |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' lzma_decompress_times_s3.txt)
memory=$(awk 'FNR ==2 {print $4}' lzma_decompress_times_s3.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}


file_name=$(ls ordered_CVDB_AT* -la -ltr | grep \_gz.fasta$ |awk '{print $9;}')
size=$(ls sordered_CVDB_AT* -la -ltr | grep \._gz.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' gunzip_times_s3.txt)
memory=$(awk 'FNR ==2 {print $4}' gunzip_times_s3.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_CVDB_AT* -la -ltr | grep \.mfc.d$ |awk '{print $9;}')
size=$(ls ordered_CVDB_AT* -la -ltr | grep \.mfc.d$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' mf_decompresstimes_s3.txt) 
memory=$(awk 'FNR ==2 {print $4}' mf_decompresstimes_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_CVDB_AT* -la -ltr | grep \._naf.fasta$ |awk '{print $9;}')
size=$(ls ordered_CVDB_AT* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' unnaf_times_s3.txt) 
memory=$(awk 'FNR ==2 {print $4}' unnaf_times_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

#Decompression

#file_name=$(ls ordered_CVDB_size* -la -ltr | grep \_bz2.fasta$ |awk '{print $9;}')
#size=$(ls sordered_CVDB_size* -la -ltr | grep \._bz2.fasta$ |awk '{print $5;}')
file_name=$(ls ordered_CVDB_size.fasta -la -ltr |awk '{print $9;}')
size=$(ls ordered_CVDB_size.fasta -la -ltr |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' bzip2_decompress_times_s3.txt)
memory=$(awk 'FNR ==1 {print $4}' bzip2_decompress_times_s3.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

#file_name=$(ls ordered_CVDB_size* -la -ltr | grep \_lzma.fasta$ |awk '{print $9;}')
#size=$(ls sordered_CVDB_size* -la -ltr | grep \._lzma.fasta$ |awk '{print $5;}')
file_name=$(ls ordered_CVDB_size.fasta -la -ltr |awk '{print $9;}')
size=$(ls ordered_CVDB_size.fasta -la -ltr |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' lzma_decompress_times_s3.txt)
memory=$(awk 'FNR ==1 {print $4}' lzma_decompress_times_s3.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}


file_name=$(ls ordered_CVDB_size* -la -ltr | grep \_gz.fasta$ |awk '{print $9;}')
size=$(ls sordered_CVDB_size* -la -ltr | grep \._gz.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' gunzip_times_s3.txt)
memory=$(awk 'FNR ==1 {print $4}' gunzip_times_s3.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_CVDB_size* -la -ltr | grep \.mfc.d$ |awk '{print $9;}')
size=$(ls ordered_CVDB_size* -la -ltr | grep \.mfc.d$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' mf_decompresstimes_s3.txt)
memory=$(awk 'FNR ==1 {print $4}' mf_decompresstimes_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_CVDB_size* -la -ltr | grep \._naf.fasta$ |awk '{print $9;}')
size=$(ls ordered_CVDB_size* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' unnaf_times_s3.txt) 
memory=$(awk 'FNR ==1 {print $4}' unnaf_times_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"File Name","Bytes","Seconds","RAM"
.
wq
EOF
}

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"Decompression Data",
.
wq
EOF
}


#Compression CG
file_name=$(ls ordered_CVDB_CG* -la -ltr | grep \.fasta.bz2$ |awk '{print $9;}')
size=$(ls ordered_CVDB_CG* -la -ltr | grep \.fasta.bz2$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' bzip2_times_s3.txt) 
memory=$(awk 'FNR ==3 {print $4}' bzip2_times_s3.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls ordered_CVDB_CG* -la -ltr | grep \.fasta.lzma$ |awk '{print $9;}')
size=$(ls ordered_CVDB_CG* -la -ltr | grep \.fasta.lzma$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' lzma_times_s3.txt)
memory=$(awk 'FNR ==3 {print $4}' lzma_times_s3.txt)  
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}


file_name=$(ls ordered_CVDB_CG* -la -ltr | grep \.fasta.gz$ |awk '{print $9;}')
size=$(ls ordered_CVDB_CG* -la -ltr | grep \.fasta.gz$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' gzip_times_s3.txt) 
memory=$(awk 'FNR ==3 {print $4}' gzip_times_s3.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls ordered_CVDB_CG* -la -ltr | grep \.mfc$ |awk '{print $9;}')
size=$(ls ordered_CVDB_CG* -la -ltr | grep \.mfc$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' mf_compresstimes_s3.txt) 
memory=$(awk 'FNR ==3 {print $4}' mf_compresstimes_s3.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls ordered_CVDB_CG* -la -ltr | grep \.naf$ |awk '{print $9;}')
size=$(ls ordered_CVDB_CG* -la -ltr | grep \.naf$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' naf_times_s3.txt) 
memory=$(awk 'FNR ==3 {print $4}' naf_times_s3.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

#Compression AT
file_name=$(ls ordered_CVDB_AT* -la -ltr | grep \.fasta.bz2$ |awk '{print $9;}')
size=$(ls ordered_CVDB_AT* -la -ltr | grep \.fasta.bz2$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' bzip2_times_s3.txt) 
memory=$(awk 'FNR ==2 {print $4}' bzip2_times_s3.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls ordered_CVDB_AT* -la -ltr | grep \.fasta.lzma$ |awk '{print $9;}')
size=$(ls ordered_CVDB_AT* -la -ltr | grep \.fasta.lzma$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' lzma_times_s3.txt)
memory=$(awk 'FNR ==2 {print $4}' lzma_times_s3.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}


file_name=$(ls ordered_CVDB_AT* -la -ltr | grep \.fasta.gz$ |awk '{print $9;}')
size=$(ls ordered_CVDB_AT* -la -ltr | grep \.fasta.gz$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' gzip_times_s3.txt) 
memory=$(awk 'FNR ==2 {print $4}' gzip_times_s3.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls ordered_CVDB_AT* -la -ltr | grep \.mfc$ |awk '{print $9;}')
size=$(ls ordered_CVDB_AT* -la -ltr | grep \.mfc$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' mf_compresstimes_s3.txt) 
memory=$(awk 'FNR ==2 {print $4}' mf_compresstimes_s3.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls ordered_CVDB_AT* -la -ltr | grep \.naf$ |awk '{print $9;}')
size=$(ls ordered_CVDB_AT* -la -ltr | grep \.naf$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' naf_times_s3.txt) 
memory=$(awk 'FNR ==2 {print $4}' naf_times_s3.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

#Compression size
file_name=$(ls ordered_CVDB_size* -la -ltr | grep \.fasta.bz2$ |awk '{print $9;}')
size=$(ls ordered_CVDB_size* -la -ltr | grep \.fasta.bz2$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' bzip2_times_s3.txt) 
memory=$(awk 'FNR ==1 {print $4}' bzip2_times_s3.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls ordered_CVDB_size* -la -ltr | grep \.fasta.lzma$ |awk '{print $9;}')
size=$(ls ordered_CVDB_size* -la -ltr | grep \.fasta.lzma$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' lzma_times_s3.txt) 
memory=$(awk 'FNR ==1 {print $4}' lzma_times_s3.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls ordered_CVDB_size* -la -ltr | grep \.fasta.gz$ |awk '{print $9;}')
size=$(ls ordered_CVDB_size* -la -ltr | grep \.fasta.gz$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' gzip_times_s3.txt) 
memory=$(awk 'FNR ==1 {print $4}' gzip_times_s3.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls ordered_CVDB_size* -la -ltr | grep \.mfc$ |awk '{print $9;}')
size=$(ls ordered_CVDB_size* -la -ltr | grep \.mfc$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' mf_compresstimes_s3.txt) 
memory=$(awk 'FNR ==1 {print $4}' mf_compresstimes_s3.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls ordered_CVDB_size* -la -ltr | grep \.naf$ |awk '{print $9;}')
size=$(ls ordered_CVDB_size* -la -ltr | grep \.naf$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' naf_times_s3.txt)
memory=$(awk 'FNR ==1 {print $4}' naf_times_s3.txt)  
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}



file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"File Name","Bytes","Seconds","RAM","Compression Ratio"
.
wq
EOF
}


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"Stage 3",
.
wq
EOF
}




#Decompression
#file_name=$(ls shuffled* -la -ltr | grep \_bz2.fasta$ |awk '{print $9;}')
#size=$(ls shuffled* -la -ltr | grep \._bz2.fasta$ |awk '{print $5;}')
file_name=$(ls shuffled.fasta -la -ltr  |awk '{print $9;}')
size=$(ls shuffled.fasta -la -ltr |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' bzip2_decompress_times_s2.txt)
memory=$(awk 'FNR ==1 {print $4}' bzip2_decompress_times_s2.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

#file_name=$(ls shuffled* -la -ltr | grep \_lzma.fasta$ |awk '{print $9;}')
#size=$(ls shuffled* -la -ltr | grep \._lzma.fasta$ |awk '{print $5;}')
file_name=$(ls shuffled.fasta -la -ltr  |awk '{print $9;}')
size=$(ls shuffled.fasta -la -ltr |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' lzma_decompress_times_s2.txt)
memory=$(awk 'FNR ==1 {print $4}' lzma_decompress_times_s2.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls shuffled* -la -ltr | grep \_gz.fasta$ |awk '{print $9;}')
size=$(ls shuffled* -la -ltr | grep \._gz.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' gunzip_times_s2.txt)
memory=$(awk 'FNR ==1 {print $4}' gunzip_times_s2.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | memory_x

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls shuffled* -la -ltr | grep \.mfc.d$ |awk '{print $9;}')
size=$(ls shuffled* -la -ltr | grep \.mfc.d$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' mf_decompresstimes_s2.txt) 
memory=$(awk 'FNR ==1 {print $4}' mf_decompresstimes_s2.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls shuffled* -la -ltr | grep \._naf.fasta$ |awk '{print $9;}')
size=$(ls shuffled* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' unnaf_times_s2.txt) 
memory=$(awk 'FNR ==1 {print $4}' unnaf_times_s2.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"File Name","Bytes","Seconds","RAM"
.
wq
EOF
}

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"Decompression Data",
.
wq
EOF
}


#Compression
file_name=$(ls shuffled* -la -ltr | grep \.fasta.bz2$ |awk '{print $9;}')
size=$(ls shuffled* -la -ltr | grep \.fasta.bz2$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' bzip2_times_s2.txt)
memory=$(awk 'FNR ==1 {print $4}' bzip2_times_s2.txt)  
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls shuffled* -la -ltr | grep \.fasta.lzma$ |awk '{print $9;}')
size=$(ls shuffled* -la -ltr | grep \.fasta.lzma$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' lzma_times_s2.txt)
memory=$(awk 'FNR ==1 {print $4}' lzma_times_s2.txt)  
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls shuffled* -la -ltr | grep \.fasta.gz$ |awk '{print $9;}')
size=$(ls shuffled* -la -ltr | grep \.fasta.gz$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' gzip_times_s2.txt)
memory=$(awk 'FNR ==1 {print $4}' gzip_times_s2.txt)  
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls shuffled* -la -ltr | grep \.mfc$ |awk '{print $9;}')
size=$(ls shuffled* -la -ltr | grep \.mfc$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' mf_compresstimes_s2.txt) 
memory=$(awk 'FNR ==1 {print $4}' mf_compresstimes_s2.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' ) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls shuffled* -la -ltr | grep \.naf$ |awk '{print $9;}')
size=$(ls shuffled* -la -ltr | grep \.naf$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' naf_times_s2.txt) 
memory=$(awk 'FNR ==1 {print $4}' naf_times_s2.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}



file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"File Name","Bytes","Seconds","RAM","Compression Ratio"
.
wq
EOF
}


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"Stage 2",
.
wq
EOF
}


#Stage 1

#file_name=$(ls CVDB* -la -ltr | grep \_bz2.fasta$ |awk '{print $9;}')
#size=$(ls CVDB* -la -ltr | grep \._bz2.fasta$ |awk '{print $5;}')
file_name=$(ls CVDB.fasta -la -ltr |awk '{print $9;}')
size=$(ls CVDB.fasta -la -ltr  |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' bzip2_decompress_times.txt)
memory=$(awk 'FNR ==1 {print $4}' bzip2_decompress_times.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x



file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

#file_name=$(ls CVDB* -la -ltr | grep \_lzma.fasta$ |awk '{print $9;}')
#size=$(ls CVDB* -la -ltr | grep \._lzma.fasta$ |awk '{print $5;}')
file_name=$(ls CVDB.fasta -la -ltr |awk '{print $9;}')
size=$(ls CVDB.fasta -la -ltr |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' lzma_decompress_times.txt)
memory=$(awk 'FNR ==1 {print $4}' lzma_decompress_times.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

#Decompression
file_name=$(ls CVDB* -la -ltr | grep \_gz.fasta$ |awk '{print $9;}')
size=$(ls CVDB* -la -ltr | grep \._gz.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' gunzip_times.txt)
memory=$(awk 'FNR ==1 {print $4}' gunzip_times.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls CVDB* -la -ltr | grep \.mfc.d$ |awk '{print $9;}')
size=$(ls CVDB* -la -ltr | grep \.mfc.d$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' mf_decompresstimes.txt) 
memory=$(awk 'FNR ==1 {print $4}' mf_decompresstimes.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x



file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls CVDB* -la -ltr | grep \._naf.fasta$ |awk '{print $9;}')
size=$(ls CVDB* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' unnaf_times.txt)
memory=$(awk 'FNR ==1 {print $4}' unnaf_times.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

#MFCompress




file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"File Name","Bytes","Seconds","RAM"
.
wq
EOF
}

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"Decompression Data",
.
wq
EOF
}

#Compression
#original_file_size=$(ls CVDB.fasta -la -ltr |awk '{print $5;}')
file_name=$(ls CVDB* -la -ltr | grep \.fasta.bz2$ |awk '{print $9;}')
size=$(ls CVDB* -la -ltr | grep \.fasta.bz2$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' bzip2_times.txt) 
memory=$(awk 'FNR ==1 {print $4}' bzip2_times.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls CVDB* -la -ltr | grep \.fasta.lzma$ |awk '{print $9;}')
size=$(ls CVDB* -la -ltr | grep \.fasta.lzma$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' lzma_times.txt) 
memory=$(awk 'FNR ==1 {print $4}' lzma_times.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

#original_file_size=$(ls CVDB.fasta -la -ltr |awk '{print $5;}')
file_name=$(ls CVDB* -la -ltr | grep \.fasta.gz$ |awk '{print $9;}')
size=$(ls CVDB* -la -ltr | grep \.fasta.gz$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' gzip_times.txt) 
memory=$(awk 'FNR ==1 {print $4}' gzip_times.txt) 
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio
.
wq
EOF
}

file_name=$(ls CVDB* -la -ltr | grep \.mfc$ |awk '{print $9;}')
size=$(ls CVDB* -la -ltr | grep \.mfc$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' mf_compresstimes.txt)
memory=$(awk 'FNR ==1 {print $4}' mf_compresstimes.txt)
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )
compression_speed=$(bc <<< ' scale=2;10**3*size/time')
compression_speed=$(echo $compression_speed | sed 's/,/./g' )
#compression_ratio=$((compression*100))

#echo $compression_ratio

printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
printf $compression_speed | tee compression_speed_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio,$compression_speed
.
wq
EOF
}

file_name=$(ls CVDB* -la -ltr | grep \.naf$ |awk '{print $9;}')
size=$(ls CVDB* -la -ltr | grep \.naf$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' naf_times.txt)
memory=$(awk 'FNR ==1 {print $4}' naf_times.txt) 
#compression_ratio=awk "BEGIN  { print size/original_file_size}"
compression_ratio=$(printf %.2f%% "$((10**3 * 100 * $size/$original_file_size))e-3")
compression_ratio=$(echo $compression_ratio | sed 's/,/./g' )
compression_speed=$(printf %.2f%% "$((10**3 * 100 * $size/$time))e-3")
compression_speed=$(echo $compression_speed | sed 's/,/./g' )
#compression_ratio=$((compression*100))

#echo $compression_ratio

printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
printf $compression_ratio | tee compression_ratio_x
printf $compression_speed | tee compression_speed_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory,$compression_ratio,$compression_speed
.
wq
EOF
}

#MFCompress


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"File Name","Bytes","Seconds","RAM","Compression Ratio","Compression Speed"
.
wq
EOF
}


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"Stage 1",
.
wq
EOF
}

