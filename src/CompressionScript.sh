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
for i in ${!times_arr[@]}; do
    
   echo "$((${fasta_arr[i]}))" | awk 'NR>3{print $1;}' > Output_n.csv
   
  done  
 

}

#awk  '{print $10,$6,"a"," b","c";}' OFS="," > Results.csv


#Scenario 2 - Shuffle Input File and then Compress

time {
#{ ./SHUFFLE_FASTA AT 5 shuffled.fasta sequences_virus.fasta ; } 2>>shuffle_times.txt
{ ./FASTA_ANALY -s AT 5 shuffled.fasta sequences_virus.fasta ; } 2>>shuffle_times.txt
{ time ennaf --strict  shuffled.fasta -o shuffled.naf --temp-dir /tmp ; } 2>>naf_times_s2.txt

{ time mbgc -i shuffled.fasta shuffled.mbgc ; } 2>>mbgctimes_s2.txt

{ time ./MFCompressC shuffled.fasta ; } 2>>mf_compresstimes_s2.txt

{ time gzip -k shuffled.fasta ; } 2>>gzip_times_s2.txt

#ls -la -ltr | grep \.naf$ |awk '{print $5;}' > naf_files_s2.txt
#ls -la -ltr | grep \.mbgc$ |awk '{print $5;}' > mbgc_files_s2.txt
#ls -la -ltr | grep \.gz$ |awk '{print $5;}' > gzip_files_s2.txt
#ls -la -ltr | grep \.mfc$ |awk '{print $5;}' > mfc_files_s2.txt

ls shuffled.* -la -ltr | awk 'BEGIN{ OFS=","; print "File;Size,"}; NR > 1{print $9,$5;}' > Output_s2.csv

}


#Scenario 3 - Order Input File and then Compress

#{ time ./FASTA_ANALY AT 5 ordered_sequences_virus.fasta sequences_virus.fasta ; } 2>>ordering_times.txt
time {
{ time ./FASTA_ANALY -sort=size ordered_sequences_virus.fasta sequences_virus.fasta ; } 2>>ordering_times.txt
{ time ennaf --strict  ordered_sequences_virus.fasta -o ordered_sequences_virus.naf --temp-dir /tmp ; } 2>>naf_times_s3.txt
{ time mbgc -i ordered_sequences_virus.fasta ordered_sequences_virus.mbgc ; } 2>>mbgctimes_s3.txt

{ time ./MFCompressC ordered_sequences_virus.fasta ; } 2>>mf_compresstimes_s3.txt

{ time gzip -k ordered_sequences_virus.fasta ; } 2>>gzip_times_s3.txt

#ls -la -ltr | grep \.naf$ |awk '{print $5;}' > naf_files_s3.txt
#ls -la -ltr | grep \.mbgc$ |awk '{print $5;}' > mbgc_files_s3.txt
#ls -la -ltr | grep \.gz$ |awk '{print $5;}' > gzip_files_s3.txt
#ls -la -ltr | grep \.mfc$ |awk '{print $5;}' > mfc_files_s3.txt
ls sequences_virus* -la -ltr | awk 'BEGIN{ OFS=","; print "File;Size,"}; NR > 1{print $9,$5;}' > Output_s3.csv
} 

#Scenario 4 - Shuffle then Order then Compress

#{ time ./SHUFFLE_FASTA AT 5 shuffled.fasta sequences_virus.fasta ; } 2>>shuffle_times_s4.txt
#{ time ./FASTA_ANALY AT 5 ordered_shuffled.fasta shuffled.fasta ; } 2>>ordering_times_s4.txt
{ ./FASTA_ANALY -s AT 5 shuffled.fasta sequences_virus.fasta ; } 2>>shuffle_times_s4.txt
{ time ./FASTA_ANALY -sort=size ordered_sequences_virus.fasta sequences_virus.fasta ; } 2>>ordering_times_s4.txt
{ time ennaf --strict  ordered_shuffled.fasta -o ordered_shuffled.naf --temp-dir /tmp ; } 2>>naf_times_s4.txt
{ time mbgc -i ordered_shuffled.fasta ordered_shuffled.mbgc ; } 2>>mbgctimes_s4.txt

{ time ./MFCompressC ordered_shuffled.fasta ; } 2>>mf_compresstimes_s4.txt

{ time gzip -k ordered_shuffled.fasta ; } 2>>gzip_times_s4.txt

ls sequences_virus* -la -ltr | awk 'BEGIN{ OFS=","; print "File;Size,"}; NR > 1{print $9,$5;}' > Output_s4.csv


ls -la -ltr | grep \.naf$ |awk '{print $5;}' > naf_files_s4.txt
ls -la -ltr | grep \.mbgc$ |awk '{print $5;}' > mbgc_files_s4.txt
ls -la -ltr | grep \.gz$ |awk '{print $5;}' > gzip_files_s4.txt
ls -la -ltr | grep \.mfc$ |awk '{print $5;}' > mfc_files_s4.txt


