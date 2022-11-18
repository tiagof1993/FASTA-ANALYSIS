#bin/bash
#!/usr/bin/bash

# Scenario 1 - Compress original file (sequences_virus.fasta)

time {
rm naf_times.txt
rm mbgctimes.txt
rm gzip_times.txt
rm mf_compresstimes.txt
rm stage1_time.txt
rm unnaf_times.txt
rm mbgcdtimes.txt
rm mf_decompresstimes.txt
rm gunzip_times.txt
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

#Compress

{ time ennaf --strict  CVDB.fasta -o CVDB.naf --temp-dir /tmp ; } 2>>naf_times.txt

{ time mbgc -i CVDB.fasta CVDB.mbgc ; } 2>>mbgctimes.txt

{ time ./MFCompressC CVDB.fasta ; } 2>>mf_compresstimes.txt

{ time gzip -k CVDB.fasta ; } 2>>gzip_times.txt

#Decompress

{ time unnaf CVDB.naf -o CVDB_naf.fasta --temp-dir /tmp ; } 2>>unnaf_times.txt

{ time mbgc -d CVDB.mbgc CVDB_mbgc.fasta ; } 2>>mbgcdtimes.txt

{ time ./MFCompressD -t 2  -o CVDB.fasta.mfc ; } 2>>mf_decompresstimes.txt

{ time gunzip -k CVDB.fasta.gz ; } 2>>gunzip_times.txt


#ls -la -ltr | grep \.naf$ |awk '{print $5;}' > naf_files.txt
#ls -la -ltr | grep \.mbgc$ |awk '{print $5;}' > mbgc_files.txt
#ls -la -ltr | grep \.gz$ |awk '{print $5;}' > gzip_files.txt
#ls -la -ltr | grep \.mfc$ |awk '{print $5;}' > mfc_files.txt

#ls sequences_virus* -la -ltr | grep \.naf$ |awk '{print $5;}' > naf_files.txt
#ls sequences_virus* -la -ltr | grep \.mbgc$ |awk '{print $5;}' > mbgc_files.txt
#ls sequences_virus* -la -ltr | grep \.gz$ |awk '{print $5;}' > gzip_files.txt
#ls sequences_virus* -la -ltr | grep \.mfc$ |awk '{print $5;}' > mfc_files.txt

#awk '{print $1}' OFS="|" naf_files.txt > output_naf.csv
#awk '{print $1}' OFS="|" mbgc_files.txt > output_mbgc.csv
#awk '{print $1}' OFS="|" gzip_files.txt > outfile_gzip.csv
#awk '{print $1}' OFS="|" mfc_files.txt > outfile_mfc.csv

#valgrind
#perfis de ordenação
#cg

declare -a times_arr=()

#times_arr+=$(awk '{print $2}' OFS="|" naf_files.txt)
#while read line; do
#    times_arr+=($line)
#done < naf$_times.txt
awk 'FNR == 2 {print $2}' naf_times.txt > naf_time_total.txt
awk 'FNR == 2 {print $2}' mbgctimes.txt > mbgc_time_total.txt
awk 'FNR == 2 {print $2}' mf_compresstimes.txt > mfcompress_time_total.txt
awk 'FNR == 2 {print $2}' gzip_times.txt > gzip_time_total.txt
awk 'FNR == 2 {print $2}' unnaf_times.txt > unnaf_time_total.txt
awk 'FNR == 2 {print $2}' mbgcdtimes.txt > mbgcd_time_total.txt
awk 'FNR == 2 {print $2}' mf_decompresstimes.txt > mfdecompress_time_total.txt
awk 'FNR == 2 {print $2}' gunzip_times.txt > gunzip_time_total.txt




#times_arr+=$(awk 'FNR == 2 {print $2}' mbgctimes.txt)
#times_arr+=$(awk 'FNR == 2 {print $2}' mf_compresstimes.txt)
#times_arr+=$(awk 'FNR == 2 {print $2}' gzip_times.txt)

while read line; do
   times_arr+=($line)
done < naf_time_total.txt
while read line; do
   times_arr+=($line)
done < mbgc_time_total.txt
while read line; do
    times_arr+=($line)
done < mfcompress_time_total.txt
while read line; do
    times_arr+=($line)
done < gzip_time_total.txt
while read line; do
   times_arr+=($line)
done < unnaf_time_total.txt
while read line; do
   times_arr+=($line)
done < mbgcd_time_total.txt
while read line; do
    times_arr+=($line)
done < mfdecompress_time_total.txt
while read line; do
    times_arr+=($line)
done < gunzip_time_total.txt

echo "${#times_arr[@]}"


declare -p times_arr
#for i in ${!fasta_arr[@]}; do
    
 #   time echo "$((${fasta_arr[i]}))"
 # done  

time_naf=$(awk '{print $1}' mbgc_time_total.txt)
#awk '{print $(time_naf)}'
#echo $((time_naf))
ls CVDB* -la -ltr | awk 'BEGIN{ OFS=","; print "File;Size;Time,"}; NR > 1{print $9,$5;}' > Output.csv
#for i in ${!times_arr[@]}; do
    
echo $(awk '{print $1}' naf_time_total.txt) 
#| awk '{print $1;}' OFS="," > Output_n.csv
   
 # done  
}

#awk  '{print $10,$6,"a"," b","c";}' OFS="," > Results.csv


#Scenario 2 - Shuffle Input File and then Compress

time {

rm naf_times_s2.txt
rm mbgctimes_s2.txt
rm gzip_times_s2.txt
rm mf_compresstimes_s2.txt
rm mbgcdtimes_s2.txt
rm mf_decompresstimes_s2.txt
run gunzip_times_s2.txt
#rm stage1_time.txt
rm shuffled.fasta.gz
rm shuffled.fasta.mfc
rm shuffled.mbgc
rm shuffled.naf
rm shuffled_naf.fasta
rm shuffled_mbgc.fasta

#{ ./SHUFFLE_FASTA AT 5 shuffled.fasta sequences_virus.fasta ; } 2>>shuffle_times.txt
{ ./FASTA_ANALY -sort=S CVDB.fasta shuffled.fasta 5 ; } 2>>shuffle_times.txt
sed -i '$ s/.$//' shuffled.fasta
{ time ennaf shuffled.fasta -o shuffled.naf --temp-dir /tmp ; } 2>>naf_times_s2.txt

{ time mbgc -i shuffled.fasta shuffled.mbgc ; } 2>>mbgctimes_s2.txt

{ time ./MFCompressC -1 -t 2 shuffled.fasta ; } 2>>mf_compresstimes_s2.txt

{ time gzip -k shuffled.fasta ; } 2>>gzip_times_s2.txt

#Decompress

{ time unnaf shuffled.naf -o shuffled_naf.fasta --temp-dir /tmp ; } 2>>unnaf_times_s2.txt

{ time mbgc -d shuffled.mbgc shuffled_mbgc.fasta ; } 2>>mbgcdtimes_s2.txt

{ time ./MFCompressD -t 2 shuffled.fasta.mfc ; } 2>>mf_decompresstimes_s2.txt

{ time gunzip -k shuffled.fasta.gz ; } 2>>gunzip_times_s2.txt

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


#Scenario 3 - Order Input File and then Compress

#{ time ./FASTA_ANALY AT 5 ordered_sequences_virus.fasta sequences_virus.fasta ; } 2>>ordering_times.tx

time {

rm naf_times_s3.txt
rm mbgctimes_s3.txt
rm gzip_times_s3.txt
rm mf_compresstimes_s3.txt
rm unnaf_times_s3.txt
rm mbgcdtimes_s3.txt
rm gunzip_times_s3.txt
rm mf_decompresstimes_s3.txt
#rm stage1_time.txt
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

{ time ./FASTA_ANALY -sort=S CVDB.fasta ordered_CVDB.fasta 5 ; } 2>>ordering_times.txt
sed -i '$ s/.$//' ordered_CVDB.fasta
{ time ennaf --strict  ordered_CVDB.fasta -o ordered_CVDB.naf --temp-dir /tmp ; } 2>>naf_times_s3.txt
{ time mbgc -i ordered_CVDB.fasta ordered_CVDB.mbgc ; } 2>>mbgctimes_s3.txt

{ time ./MFCompressC -1 -t 2 ordered_CVDB.fasta ; } 2>>mf_compresstimes_s3.txt

{ time gzip -k ordered_CVDB.fasta y ; } 2>>gzip_times_s3.txt

#Decompress
{ time unnaf  ordered_CVDB.naf -o ordered_CVDB_naf.fasta --temp-dir /tmp ; } 2>>unnaf_times_s3.txt
{ time mbgc -d ordered_CVDB.mbgc ordered_CVDB_mbgc.fasta ; } 2>>mbgcdtimes_s3.txt

{ time ./MFCompressD -t 2 ordered_CVDB.fasta.mfc ; } 2>>mf_decompresstimes_s3.txt

{ time gunzip -k ordered_CVDB.fasta.gz ; } 2>>gunzip_times_s3.txt

declare -a times_s3_arr=()

#times_arr+=$(awk '{print $2}' OFS="|" naf_files.txt)
#while read line; do
#    times_arr+=($line)
#done < naf$_times.txt

awk 'FNR == 2 {print $2}' naf_times_s3.txt > naf_time_total_s3.txt
awk 'FNR == 2 {print $2}' mbgctimes_s3.txt > mbgc_time_total_s3.txt
awk 'FNR == 2 {print $2}' mf_compresstimes_s3.txt > mfcompress_time_total_s3.txt
awk 'FNR == 2 {print $2}' gzip_times_s3.txt > gzip_time_total_s3.txt
awk 'FNR == 2 {print $2}' unnaf_times_s3.txt > unnaf_time_total_s3.txt
awk 'FNR == 2 {print $2}' mbgcdtimes_s3.txt > mbgcd_time_total_s3.txt
awk 'FNR == 2 {print $2}' mf_decompresstimes_s3.txt > mfdecompress_time_total_s3.txt
awk 'FNR == 2 {print $2}' gunzip_times_s3.txt > gunzip_time_total_s3.txt

#times_arr+=$(awk 'FNR == 2 {print $2}' mbgctimes.txt)
#times_arr+=$(awk 'FNR == 2 {print $2}' mf_compresstimes.txt)
#times_arr+=$(awk 'FNR == 2 {print $2}' gzip_times.txt)

while read line; do
   times_s3_arr+=($line)
done < naf_time_total_s3.txt
while read line; do
   times_s3_arr+=($line)
done < mbgc_time_total_s3.txt
while read line; do
    times_s3_arr+=($line)
done < mfcompress_time_total_s3.txt
while read line; do
    times_s3_arr+=($line)
done < gzip_time_total_s3.txt
while read line; do
   times_s3_arr+=($line)
done < unnaf_time_total_s3.txt
while read line; do
   times_s3_arr+=($line)
done < mbgcd_time_total_s3.txt
while read line; do
    times_s3_arr+=($line)
done < mfdecompress_time_total_s3.txt
while read line; do
    times_s3_arr+=($line)
done < gunzip_time_total_s3.txt

echo "${#times_s3_arr[@]}"


declare -p times_s3_arr
#for i in ${!fasta_arr[@]}; do
    
 #   time echo "$((${fasta_arr[i]}))"
 # done  

#time_naf=$(awk '{print $1}' mbgc_time_total.txt)
#awk '{print $(time_naf)}'
#echo $((time_naf))
ls ordered_CVDB* -la -ltr | awk 'BEGIN{ OFS=","; print "File;Size;Time,"}; NR > 1{print $9,$5;}' > Output_s3.csv
#for i in ${!times_arr[@]}; do
    
echo $(awk '{print $1}' naf_time_total_s3.txt) 
#| awk '{print $1;}' OFS="," > Output_n.csv
   
 # done  

}

rm naf_times_s4.txt
rm mbgctimes_s4.txt
rm gzip_times_s4.txt
rm mf_compresstimes_s4.txt
rm unnaf_times_s4.txt
rm mbgcdtimes_s4.txt
rm gunzip_times_s4.txt
rm mf_decompresstimes_s4.txt
rm ordering_times_s4.txt

#Scenario 4 - Shuffle then Order then Compress
time {
#{ time ./SHUFFLE_FASTA AT 5 shuffled.fasta sequences_virus.fasta ; } 2>>shuffle_times_s4.txt
#{ time ./FASTA_ANALY AT 5 ordered_shuffled.fasta shuffled.fasta ; } 2>>ordering_times_s4.txt
{ ./FASTA_ANALY -s CVDB.fasta shuffled_v2.fasta 5 ; } 2>>shuffle_times_s4.txt
sed -i '$ s/.$//' shuffled_v2.fasta
{ time ./FASTA_ANALY -sort=S shuffled_v2.fasta ordered_shuffled_v2.fasta 5 ; } 2>>ordering_times_s4.txt
sed -i '$ s/.$//' ordered_shuffled_v2.fasta
{ time ennaf --strict  ordered_shuffled_v2.fasta -o ordered_shuffled_v2.naf --temp-dir /tmp ; } 2>>naf_times_s4.txt
{ time mbgc -i ordered_shuffled_v2.fasta ordered_shuffled_v2.mbgc ; } 2>>mbgctimes_s4.txt

{ time ./MFCompressC ordered_shuffled_v2.fasta ; } 2>>mf_compresstimes_s4.txt

{ time gzip -k ordered_shuffled_v2.fasta y ; } 2>>gzip_times_s4.txt
{ time unnaf ordered_shuffled_v2.naf -o ordered_shuffled_v2_naf.fasta --temp-dir /tmp ; } 2>>unnaf_times_s4.txt
{ time mbgc -d ordered_shuffled_v2.mbgc ordered_shuffled_v2_mbgc.fasta ; } 2>>mbgcdtimes_s4_.txt

{ time ./MFCompressD ordered_shuffled_v2.fasta.mfc ; } 2>>mf_decompresstimes_s4.txt

{ time gunzip -k ordered_shuffled_v2.fasta.gz y ; } 2>>gunzip_times_s4.txt

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
done < mfcompress_time_total_s4.txt
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
ls ordered_CVDB* -la -ltr | awk 'BEGIN{ OFS=","; print "File;Size;Time,"}; NR > 1{print $9,$5;}' > Output_s4.csv
#for i in ${!times_arr[@]}; do
    
echo $(awk '{print $1}' naf_time_total_s4.txt) 

}
