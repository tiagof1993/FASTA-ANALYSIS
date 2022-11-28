time{

rm naf_times_s4.txt
rm mbgctimes_s4.txt
rm gzip_times_s4.txt
rm mf_compresstimes_s4.txt
rm unnaf_times_s4.txt
rm mbgcdtimes_s4.txt
rm gunzip_times_s4.txt
rm mf_decompresstimes_s4.txt
rm ordering_times_s4.txt
rm stage4_time.txt

#Scenario 4 - Shuffle then Order then Compress
#{ time ./SHUFFLE_FASTA AT 5 shuffled.fasta sequences_virus.fasta ; } 2>>shuffle_times_s4.txt
#{ time ./FASTA_ANALY AT 5 ordered_shuffled.fasta shuffled.fasta ; } 2>>ordering_times_s4.txt
{ ./FASTA_ANALY -s CVDB.fasta shuffled_v2.fasta 5 ; } 2>>shuffle_times_s4.txt
sed -i '$ s/.$//' shuffled_v2.fasta
{ time ./FASTA_ANALY -sort=S shuffled_v2.fasta ordered_shuffled_v2_size.fasta 5 ; } 2>>ordering_times_s4.txt
sed -i '$ s/.$//' ordered_shuffled_v2.fasta
{ time ./FASTA_ANALY -sort=S shuffled_v2.fasta ordered_shuffled_v2_AT.fasta 5 ; } 2>>ordering_times_s4.txt
sed -i '$ s/.$//' ordered_shuffled_v2.fasta
{ time ./FASTA_ANALY -sort=S shuffled_v2.fasta ordered_shuffled_v2_CG.fasta 5 ; } 2>>ordering_times_s4.txt
sed -i '$ s/.$//' ordered_shuffled_v2.fasta
{ time ennaf --strict  ordered_shuffled_v2_size.fasta -o ordered_shuffled_v2_size.naf --temp-dir /tmp ; } 2>>naf_times_s4.txt
{ time ennaf --strict  ordered_shuffled_v2_AT.fasta -o ordered_shuffled_v2_AT.naf --temp-dir /tmp ; } 2>>naf_times_s4.txt
{ time ennaf --strict  ordered_shuffled_v2_CG.fasta -o ordered_shuffled_v2_CG.naf --temp-dir /tmp ; } 2>>naf_times_s4.txt
{ time mbgc -i ordered_shuffled_v2_size.fasta ordered_shuffled_v2_size.mbgc ; } 2>>mbgctimes_s4.txt
{ time mbgc -i ordered_shuffled_v2_AT.fasta ordered_shuffled_v2_AT.mbgc ; } 2>>mbgctimes_s4.txt
{ time mbgc -i ordered_shuffled_v2_CG.fasta ordered_shuffled_v2_CG.mbgc ; } 2>>mbgctimes_s4.txt

{ time ./MFCompressC ordered_shuffled_v2_size.fasta ; } 2>>mf_compresstimes_s4.txt
{ time ./MFCompressC ordered_shuffled_v2_AT.fasta ; } 2>>mf_compresstimes_s4.txt
{ time ./MFCompressC ordered_shuffled_v2_CG.fasta ; } 2>>mf_compresstimes_s4.txt


{ time gzip -k -9 ordered_shuffled_v2_size.fasta y ; } 2>>gzip_times_s4.txt
{ time gzip -k -9 ordered_shuffled_v2_AT.fasta y ; } 2>>gzip_times_s4.txt
{ time gzip -k -9 ordered_shuffled_v2_CG.fasta y ; } 2>>gzip_times_s4.txt

{ time unnaf ordered_shuffled_v2_size.naf -o ordered_shuffled_v2_naf_size.fasta ; } 2>>unnaf_times_s4.txt
{ time unnaf ordered_shuffled_v2_AT.naf -o ordered_shuffled_v2_naf_AT.fasta ; } 2>>unnaf_times_s4.txt
{ time unnaf ordered_shuffled_v2_CG.naf -o ordered_shuffled_v2_naf_CG.fasta ; } 2>>unnaf_times_s4.txt

{ time mbgc -d ordered_shuffled_v2_size.mbgc ordered_shuffled_v2_mbgc_size.fasta ; } 2>>mbgcdtimes_s4_.txt
{ time mbgc -d ordered_shuffled_v2_AT.mbgc ordered_shuffled_v2_mbgc_AT.fasta ; } 2>>mbgcdtimes_s4_.txt
{ time mbgc -d ordered_shuffled_v2_CG.mbgc ordered_shuffled_v2_mbgc_CG.fasta ; } 2>>mbgcdtimes_s4_.txt

{ time ./MFCompressD ordered_shuffled_v2.fasta_size.mfc ; } 2>>mf_decompresstimes_s4.txt
{ time ./MFCompressD ordered_shuffled_v2.fasta_AT.mfc ; } 2>>mf_decompresstimes_s4.txt
{ time ./MFCompressD ordered_shuffled_v2.fasta_CG.mfc ; } 2>>mf_decompresstimes_s4.txt

{ time gunzip -c ordered_shuffled_v2_size.fasta.gz >ordered_shuffled_v2_size_gz.fasta  ; } 2>>gunzip_times_s4.txt
{ time gunzip -c ordered_shuffled_v2_AT.fasta.gz >ordered_shuffled_v2_AT_gz.fasta ; } 2>>gunzip_times_s4.txt
{ time gunzip -c ordered_shuffled_v2_CG.fasta.gz >ordered_shuffled_v2_CG_gz.fasta ; } 2>>gunzip_times_s4.txt

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
ls ordered_shuffled* -la -ltr | awk 'BEGIN{ OFS=","; print "File;Size;Time,"}; NR > 1{print $9,$5;}' > Output_s4.csv
#for i in ${!times_arr[@]}; do
    
echo $(awk '{print $1}' naf_time_total_s4.txt)

}
