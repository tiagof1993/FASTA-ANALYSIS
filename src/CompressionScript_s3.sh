
time {

rm naf_times_s3.txt
rm mbgctimes_s3.txt
rm gzip_times_s3.txt
rm mf_compresstimes_s3.txt
rm unnaf_times_s3.txt
rm mbgcdtimes_s3.txt
rm gunzip_times_s3.txt
rm mf_decompresstimes_s3.txt
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

{ time ./FASTA_ANALY -sort=S CVDB.fasta ordered_CVDB_size.fasta 5 ; } 2>>ordering_times.txt
sed -i '$ s/.$//' ordered_CVDB.fasta
{ time ./FASTA_ANALY -sort=AT CVDB.fasta ordered_CVDB_AT.fasta 5 ; } 2>>ordering_times.txt
sed -i '$ s/.$//' ordered_CVDB.fasta
{ time ./FASTA_ANALY -sort=CG CVDB.fasta ordered_CVDB_CG.fasta 5 ; } 2>>ordering_times.txt
sed -i '$ s/.$//' ordered_CVDB.fasta
{ time ennaf --strict  ordered_CVDB_size.fasta -o ordered_CVDB_size.naf --temp-dir /tmp ; } 2>>naf_times_s3.txt
{ time ennaf --strict  ordered_CVDB_AT.fasta -o ordered_CVDB_AT.naf --temp-dir /tmp ; } 2>>naf_times_s3.txt
{ time ennaf --strict  ordered_CVDB_CG.fasta -o ordered_CVDB_CG.naf --temp-dir /tmp ; } 2>>naf_times_s3.txt
{ time mbgc -i ordered_CVDB_size.fasta ordered_CVDB_size.mbgc ; } 2>>mbgctimes_s3.txt
{ time mbgc -i ordered_CVDB_AT.fasta ordered_CVDB_AT.mbgc ; } 2>>mbgctimes_s3.txt
{ time mbgc -i ordered_CVDB_CG.fasta ordered_CVDB_CG.mbgc ; } 2>>mbgctimes_s3.txt

{ time ./MFCompressC -1 -t 2 ordered_CVDB_size.fasta ; } 2>>mf_compresstimes_s3.txt
{ time ./MFCompressC -1 -t 2 ordered_CVDB_AT.fasta ; } 2>>mf_compresstimes_s3.txt
{ time ./MFCompressC -1 -t 2 ordered_CVDB_CG.fasta ; } 2>>mf_compresstimes_s3.txt

{ time gzip -k -9 ordered_CVDB_size.fasta y ; } 2>>gzip_times_s3.txt
{ time gzip -k -9 ordered_CVDB_AT.fasta y ; } 2>>gzip_times_s3.txt
{ time gzip -k -9 ordered_CVDB_CG.fasta y ; } 2>>gzip_times_s3.txt

#Decompress
{ time unnaf  ordered_CVDB_size.naf -o ordered_CVDB_size_naf.fasta ; } 2>>unnaf_times_s3.txt
{ time unnaf  ordered_CVDB_AT.naf -o ordered_CVDB_AT_naf.fasta ; } 2>>unnaf_times_s3.txt
{ time unnaf  ordered_CVDB_CG.naf -o ordered_CVDB_CG_naf.fasta ; } 2>>unnaf_times_s3.txt

{ time mbgc -d ordered_CVDB_size.mbgc ordered_CVDB_size_mbgc.fasta ; } 2>>mbgcdtimes_s3.txt
{ time mbgc -d ordered_CVDB_AT.mbgc ordered_CVDB_AT_mbgc.fasta ; } 2>>mbgcdtimes_s3.txt
{ time mbgc -d ordered_CVDB_CG.mbgc ordered_CVDB_CG_mbgc.fasta ; } 2>>mbgcdtimes_s3.txt

{ time ./MFCompressD -t 2 ordered_CVDB_size.fasta.mfc ; } 2>>mf_decompresstimes_s3.txt
{ time ./MFCompressD -t 2 ordered_CVDB_AT.fasta.mfc ; } 2>>mf_decompresstimes_s3.txt
{ time ./MFCompressD -t 2 ordered_CVDB_CG.fasta.mfc ; } 2>>mf_decompresstimes_s3.txt

{ time gunzip -c ordered_CVDB_size.fasta.gz >ordered_CVDB_size_gz.fasta  ; } 2>>gunzip_times_s3.txt
{ time gunzip -c ordered_CVDB_AT.fasta.gz >ordered_CVDB_AT_gz.fasta   ; } 2>>gunzip_times_s3.txt
{ time gunzip -c ordered_CVDB_CG.fasta.gz >ordered_CVDB_CG_gz.fasta  ; } 2>>gunzip_times_s3.txt

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
