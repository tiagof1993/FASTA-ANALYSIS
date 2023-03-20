time{

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

#Scenario 4 - Shuffle then Order then Compress
#{ time ./SHUFFLE_FASTA AT 5 shuffled.fasta sequences_virus.fasta ; } 2>>shuffle_times_s4.txt
#{ time ./FASTA_ANALY AT 5 ordered_shuffled.fasta shuffled.fasta ; } 2>>ordering_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -s CVDB.fasta shuffled.fasta 5 ; } 2>>shuffle_times_s4.txt
#sed $'s/\r/\n/' -i shuffled.fasta
#sed -i '$ s/.$//' shuffled_v2.fasta
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=S shuffled.fasta ordered_shuffled_size.fasta 5 ; } 2>>ordering_times_s4.txt
#sed $'s/\r//' -i ordered_shuffled_size.fasta
#sed -i '$ s/.$//' ordered_shuffled_size.fasta
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=AT shuffled.fasta ordered_shuffled_AT.fasta 5 ; } 2>>ordering_times_s4.txt
#sed $'s/\r//' -i ordered_shuffled_AT.fasta
#sed -i '$ s/.$//' ordered_shuffled_AT.fasta
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=CG shuffled.fasta ordered_shuffled_CG.fasta 5 ; } 2>>ordering_times_s4.txt
#sed $'s/\r//' -i ordered_shuffled_CG.fasta
#sed -i '$ s/.$//' ordered_shuffled_CG.fasta
{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level 22  ordered_shuffled_size.fasta ; } 2>>naf_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level 22 ordered_shuffled_AT.fasta  ; } 2>>naf_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level 22 ordered_shuffled_CG.fasta ; } 2>>naf_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -i ordered_shuffled_size.fasta ordered_shuffled_size.mbgc ; } 2>>mbgctimes_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -i ordered_shuffled_AT.fasta ordered_shuffled_AT.mbgc ; } 2>>mbgctimes_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -i ordered_shuffled_CG.fasta ordered_shuffled_CG.mbgc ; } 2>>mbgctimes_s4.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 64 -t 8 ordered_shuffled_size.fasta ; } 2>>mf_compresstimes_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 64 -t 8 ordered_shuffled_AT.fasta ; } 2>>mf_compresstimes_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 64 -t 8 ordered_shuffled_CG.fasta ; } 2>>mf_compresstimes_s4.txt


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

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 64 -t 8 ordered_shuffled_size.fasta.mfc ; } 2>>mf_decompresstimes_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 64 -t 8 ordered_shuffled_AT.fasta.mfc ; } 2>>mf_decompresstimes_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 64 -t 8 ordered_shuffled_CG.fasta.mfc ; } 2>>mf_decompresstimes_s4.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c ordered_shuffled_size.fasta.gz >ordered_shuffled_size_gz.fasta  ; } 2>>gunzip_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c ordered_shuffled_AT.fasta.gz >ordered_shuffled_AT_gz.fasta ; } 2>>gunzip_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c ordered_shuffled_CG.fasta.gz >ordered_shuffled_CG_gz.fasta ; } 2>>gunzip_times_s4.txt


#LZMA
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  ordered_shuffled_size.fasta.lzma ; } 2>> lzma_decompress_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  ordered_shuffled_AT.fasta.lzma ; } 2>> lzma_decompress_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  ordered_shuffled_CG.fasta.lzma ; } 2>> lzma_decompress_times_s4.txt

#Bzip2
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d  ordered_shuffled_size.fasta.bz2 ; } 2>> bzip2_decompress_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d  ordered_shuffled_AT.fasta.bz2 ; } 2>> bzip2_decompress_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d  ordered_shuffled_CG.fasta.bz2 ; } 2>> bzip2_decompress_times_s4.txt

ls ordered_shuffled_v2* -la -ltr | awk 'BEGIN{ OFS=","; print "File;Size,"}; NR > 1{print $9,$5;}' > Output_s4.csv


#ls -la -ltr | grep \.naf$ |awk '{print $5;}' > naf_files_s4.txt
#ls -la -ltr | grep \.mbgc$ |awk '{print $5;}' > mbgc_files_s4.txt
#ls -la -ltr | grep \.gz$ |awk '{print $5;}' > gzip_files_s4.txt
#ls -la -ltr | grep \.mfc$ |awk '{print $5;}' > mfc_files_s4.txt

declare -a times_s4_arr=()

#times_arr+=$(awk '{print $2}' OFS="|" naf_files.txt)
#while read line; do
#    times_arr+=($line)
#done < naf$_times.txt
awk 'FNR == 2 {print $2}' naf_times_s4.txt > naf_time_total_s4.txt
awk 'FNR == 2 {print $2}' mbgctimes_s4.txt > mbgc_time_total_s4.txt
awk 'FNR == 2 {print $2}' mf_compresstimes_s4.txt > mfcompress_time_total_s4.txt
awk 'FNR == 2 {print $2}' gzip_times_s4.txt > gzip_time_total_s4.txt
awk 'FNR == 2 {print $2}' unnaf_times_s4.txt > unnaf_time_total_s4.txt
awk 'FNR == 2 {print $2}' mbgcdtimes_s4.txt > mbgcd_time_total_s4.txt
awk 'FNR == 2 {print $2}' mf_decompresstimes_s4.txt > mfdecompress_time_total_s4.txt
awk 'FNR == 2 {print $2}' gunzip_times_s4.txt > gunzip_time_total_s4.txt


#times_arr+=$(awk 'FNR == 2 {print $2}' mbgctimes.txt)
#times_arr+=$(awk 'FNR == 2 {print $2}' mf_compresstimes.txt)
#times_arr+=$(awk 'FNR == 2 {print $2}' gzip_times.txt)

while read line; do
   times_s4_arr+=($line)
done < naf_time_total_s4.txt
while read line; do
   times_s4_arr+=($line)
done < mbgc_time_total_s4.txt
while read line; do
    times_s4_arr+=($line)
while read line; do
    times_s4_arr+=($line)
done < gzip_time_total_s4.txt
while read line; do
   times_s4_arr+=($line)
done < unnaf_time_total_s4.txt
while read line; do
   times_s4_arr+=($line)
done < mbgcd_time_total_s4.txt
while read line; do
    times_s4_arr+=($line)
done < mfdecompress_time_total_s4.txt
while read line; do
    times_s4_arr+=($line)
done < gunzip_time_total_s4.txt

echo "${#times_s4_arr[@]}"


declare -p times_s4_arr
#for i in ${!fasta_arr[@]}; do
    
 #   time echo "$((${fasta_arr[i]}))"
 # done  

#time_naf=$(awk '{print $1}' mbgc_time_total.txt)
#awk '{print $(time_naf)}'
#echo $((time_naf))
ls ordered_shuffled* -la -ltr | awk 'BEGIN{ OFS=","; print "File;Size;Time,"}; NR > 1{print $9,$5;}' > Output_s4.csv
#for i in ${!times_arr[@]}; do
    
echo $(awk '{print $1}' naf_time_total_s4.txt)

}
