#bin/bash
#!/usr/bin/bash

# Scenario 1 - Compress original file (sequences_virus.fasta)

time {
rm naf_times.txt
rm mbgctimes.txt
rm gzip_times.txt
rm mf_compresstimes.txt
rm stage1_time.txt
rm sequences_virus.fasta.gz
rm sequences_virus.fasta.mfc
rm sequences_virus.mbgc
rm sequences_virus.naf


{ time ennaf --strict  sequences_virus.fasta -o sequences_virus.naf --temp-dir /tmp ; } 2>>naf_times.txt

{ time mbgc -i sequences_virus.fasta sequences_virus.mbgc ; } 2>>mbgctimes.txt

{ time ./MFCompressC sequences_virus.fasta ; } 2>>mf_compresstimes.txt

{ time gzip -k sequences_virus.fasta ; } 2>>gzip_times.txt


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

echo "${#times_arr[@]}"


declare -p times_arr
#for i in ${!fasta_arr[@]}; do
    
 #   time echo "$((${fasta_arr[i]}))"
 # done  

time_naf=$(awk '{print $1}' mbgc_time_total.txt)
#awk '{print $(time_naf)}'
#echo $((time_naf))
ls sequences_virus* -la -ltr | awk 'BEGIN{ OFS=","; print "File;Size;Time,"}; NR > 1{print $9,$5;}' > Output.csv
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
#rm stage1_time.txt
rm shuffled.fasta.gz
rm shuffled.fasta.mfc
rm shuffled.mbgc
rm shuffled.naf
#{ ./SHUFFLE_FASTA AT 5 shuffled.fasta sequences_virus.fasta ; } 2>>shuffle_times.txt
{ ./FASTA_ANALY -s AT sequences_virus.fasta shuffled.fasta 5 ; } 2>>shuffle_times.txt
{ time ennaf shuffled.fasta -o shuffled.naf --temp-dir /tmp ; } 2>>naf_times_s2.txt

{ time mbgc -i shuffled.fasta shuffled.mbgc ; } 2>>mbgctimes_s2.txt

{ time ./MFCompressC shuffled.fasta ; } 2>>mf_compresstimes_s2.txt

{ time gzip -k shuffled.fasta ; } 2>>gzip_times_s2.txt

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

echo "${#times_s2_arr[@]}"


declare -p times_s2_arr
#for i in ${!fasta_arr[@]}; do
    
 #   time echo "$((${fasta_arr[i]}))"
 # done  

#time_naf=$(awk '{print $1}' mbgc_time_total.txt)
#awk '{print $(time_naf)}'
#echo $((time_naf))
ls shuffled.* -la -ltr | awk 'BEGIN{ OFS=","; print "File;Size;Time,"}; NR > 1{print $9,$5;}' > Output_s2.csv
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
#rm stage1_time.txt
rm ordered_sequences_virus.fasta.gz
rm ordered_sequences_virus.fasta.mfc
rm ordered_sequences_virus.mbgc
rm ordered_sequences_virus.naf

{ time ./FASTA_ANALY -sort=CG sequences_virus.fasta ordered_sequences_virus.fasta 5 ; } 2>>ordering_times.txt
{ time ennaf --strict  ordered_sequences_virus.fasta -o ordered_sequences_virus.naf --temp-dir /tmp ; } 2>>naf_times_s3.txt
{ time mbgc -i ordered_sequences_virus.fasta ordered_sequences_virus.mbgc ; } 2>>mbgctimes_s3.txt

{ time ./MFCompressC ordered_sequences_virus.fasta ; } 2>>mf_compresstimes_s3.txt

{ time gzip -k ordered_sequences_virus.fasta y ; } 2>>gzip_times_s3.txt

declare -a times_s3_arr=()

#times_arr+=$(awk '{print $2}' OFS="|" naf_files.txt)
#while read line; do
#    times_arr+=($line)
#done < naf$_times.txt

awk 'FNR == 2 {print $2}' naf_times_s3.txt > naf_time_total_s3.txt
awk 'FNR == 2 {print $2}' mbgctimes_s3.txt > mbgc_time_total_s3.txt
awk 'FNR == 2 {print $2}' mf_compresstimes_s3.txt > mfcompress_time_total_s3.txt
awk 'FNR == 2 {print $2}' gzip_times_s3.txt > gzip_time_total_s3.txt

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

echo "${#times_s3_arr[@]}"


declare -p times_s3_arr
#for i in ${!fasta_arr[@]}; do
    
 #   time echo "$((${fasta_arr[i]}))"
 # done  

#time_naf=$(awk '{print $1}' mbgc_time_total.txt)
#awk '{print $(time_naf)}'
#echo $((time_naf))
ls ordered_sequences_virus* -la -ltr | awk 'BEGIN{ OFS=","; print "File;Size;Time,"}; NR > 1{print $9,$5;}' > Output_s3.csv
#for i in ${!times_arr[@]}; do
    
echo $(awk '{print $1}' naf_time_total_s3.txt) 
#| awk '{print $1;}' OFS="," > Output_n.csv
   
 # done  

}

#Scenario 4 - Shuffle then Order then Compress
time {
#{ time ./SHUFFLE_FASTA AT 5 shuffled.fasta sequences_virus.fasta ; } 2>>shuffle_times_s4.txt
#{ time ./FASTA_ANALY AT 5 ordered_shuffled.fasta shuffled.fasta ; } 2>>ordering_times_s4.txt
{ ./FASTA_ANALY -s sequences_virus.fasta shuffled.fasta 5 ; } 2>>shuffle_times_s4.txt
{ time ./FASTA_ANALY -sort=S shuffled.fasta ordered_shuffled.fasta 5 ; } 2>>ordering_times_s4.txt
{ time ennaf --strict  ordered_shuffled.fasta -o ordered_shuffled.naf --temp-dir /tmp ; } 2>>naf_times_s4.txt
{ time mbgc -i ordered_shuffled.fasta ordered_shuffled.mbgc ; } 2>>mbgctimes_s4.txt

{ time ./MFCompressC ordered_shuffled.fasta ; } 2>>mf_compresstimes_s4.txt

{ time gzip -k ordered_shuffled.fasta y ; } 2>>gzip_times_s4.txt

ls ordered_shuffled* -la -ltr | awk 'BEGIN{ OFS=","; print "File;Size,"}; NR > 1{print $9,$5;}' > Output_s4.csv


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

echo "${#times_s4_arr[@]}"


declare -p times_s4_arr
#for i in ${!fasta_arr[@]}; do
    
 #   time echo "$((${fasta_arr[i]}))"
 # done  

#time_naf=$(awk '{print $1}' mbgc_time_total.txt)
#awk '{print $(time_naf)}'
#echo $((time_naf))
ls ordered_sequences_virus* -la -ltr | awk 'BEGIN{ OFS=","; print "File;Size;Time,"}; NR > 1{print $9,$5;}' > Output_s4.csv
#for i in ${!times_arr[@]}; do
    
echo $(awk '{print $1}' naf_time_total_s4.txt) 

}
