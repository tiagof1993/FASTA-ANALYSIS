
time {

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
{ /bin/time -f "TIME\t%e\tMEM\t%M" ennaf shuffled.fasta -o shuffled.naf --temp-dir tmp/ --dna --level 22 ; } 2>>naf_times_s2.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -i shuffled.fasta shuffled.mbgc ; } 2>>mbgctimes_s2.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -1 -t 2 shuffled.fasta ; } 2>>mf_compresstimes_s2.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 shuffled.fasta ; } 2>>gzip_times_s2.txt

#LZMA
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k shuffled.fasta ; } 2>> lzma_times_s2.txt;

#Bzip2
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -9 -f -k shuffled.fasta ; } 2>> bzip2_times_s2.txt;

#Decompress

{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf shuffled.naf -o shuffled_naf.fasta ; } 2>>unnaf_times_s2.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -d shuffled.mbgc shuffled_mbgc.fasta ; } 2>>mbgcdtimes_s2.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -t 2 shuffled.fasta.mfc ; } 2>>mf_decompresstimes_s2.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c shuffled.fasta.gz >shuffled_gz.fasta ; } 2>>gunzip_times_s2.txt

#LZMA
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  shuffled.fasta.lzma ; } 2 >> lzma_decompress_times_s2.txt

#Bzip2
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d  shuffled.fasta.bz2 ; } 2 >> bzip2_decompress_times_s2

.txt

#ls -la -ltr | grep \.naf$ |awk '{print $5;}' > naf_files_s2.txt
#ls -la -ltr | grep \.mbgc$ |awk '{print $5;}' > mbgc_files_s2.txt
#ls -la -ltr | grep \.gz$ |awk '{print $5;}' > gzip_files_s2.txt
#ls -la -ltr | grep \.mfc$ |awk '{print $5;}' > mfc_files_s2.txt
declare -a times_s2_arr=()

#times_arr+=$(awk '{print $2}' OFS="|" naf_files.txt)
#while read line; do
#    times_arr+=($line)
#done < naf$_times.txt
awk 'FNR == 2 {print $2}' naf_times_s2.txt > naf_time_total_s2.txt
awk 'FNR == 2 {print $2}' mbgctimes_s2.txt > mbgc_time_total_s2.txt
awk 'FNR == 2 {print $2}' mf_compresstimes_s2.txt > mfcompress_time_total_s2.txt
awk 'FNR == 2 {print $2}' gzip_times_s2.txt > gzip_time_total_s2.txt
awk 'FNR == 2 {print $2}' unnaf_times_s2.txt > unnaf_time_total_s2.txt
awk 'FNR == 2 {print $2}' mbgcdtimes_s2.txt > mbgcd_time_total_s2.txt
awk 'FNR == 2 {print $2}' mf_decompresstimes_s2.txt > mfdecompress_time_total_s2.txt
awk 'FNR == 2 {print $2}' gunzip_times_s2.txt > gunzip_time_total_s2.txt


#times_arr+=$(awk 'FNR == 2 {print $2}' mbgctimes.txt)
#times_arr+=$(awk 'FNR == 2 {print $2}' mf_compresstimes.txt)
#times_arr+=$(awk 'FNR == 2 {print $2}' gzip_times.txt)

while read line; do
   times_s2_arr+=($line)
done < naf_time_total_s2.txt
while read line; do
   times_s2_arr+=($line)
done < mbgc_time_total_s2.txt
while read line; do
    times_s2_arr+=($line)
done < mfcompress_time_total_s2.txt
while read line; do
    times_s2_arr+=($line)
done < gzip_time_total_s2.txt
while read line; do
   times_s2_arr+=($line)
done < unnaf_time_total_s2.txt
while read line; do
   times_s2_arr+=($line)
done < mbgcd_time_total_s2.txt
while read line; do
    times_s2_arr+=($line)
done < mfdecompress_time_total_s2.txt
while read line; do
    times_s2_arr+=($line)
done < gunzip_time_total_s2.txt

echo "${#times_s2_arr[@]}"



declare -p times_s2_arr
#for i in ${!fasta_arr[@]}; do
    
 #   time echo "$((${fasta_arr[i]}))"
 # done  

#time_naf=$(awk '{print $1}' mbgc_time_total.txt)
#awk '{print $(time_naf)}'
ls shuffled.* -la -ltr | awk 'BEGIN{ OFS=","; print "File;Size;Time,"}; NR > 1{print $9,$5;}' > Output_s2.csv
#echo $((time_naf))
#for i in ${!times_arr[@]}; do
    
echo $(awk '{print $1}' naf_time_total_s2.txt) 
#| awk '{print $1;}' OFS="," > Output_n.csv
   
 # done  

}
