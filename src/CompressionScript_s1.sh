
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

#How to print it example:
#awk 'FNR ==1 {print $2}' mf_compresstimes.txt -> Tempo
#awk 'FNR ==1 {print $4}' mf_compresstimes.txt -> Memória Gasta

#Compress
#/bin/time -f "TIME\t%e\tMEM\t%M" ennaf --strict CVDB.fasta --temp-dir tmp/ |& grep "TIME"  |& tr '.' ',' |& awk '{ printf $2/60"\t"$4/1024/1024"\n" }' > naf_times.txt;
#  BYTES=`ls -la CVDB.naf | awk '{ print $5 }'`;
  

{ /bin/time -f "TIME\t%e\tMEM\t%M" ennaf --strict CVDB.fasta --temp-dir tmp/ ; } 2>>naf_times.txt

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
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -1 -t 2 CVDB.fasta ; } 2>>mf_compresstimes.txt


#/bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 CVDB.fasta \
#  |& grep "TIME" \
#  |& tr '.' ',' \
#  |& awk '{ printf $2/60"\t"$4/1024/1024"\n" }' > gzip_times.txt;
#  BYTES=`ls -la CVDB.fasta.gz | awk '{ print $5 }'`;
{ /bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 CVDB.fasta ; } 2>>gzip_times.txt


#/bin/time -f "TIME\t%e\tMEM\t%M" unnaf CVDB.naf -o  CVDB.naf.fasta \
#  |& grep "TIME" \
#  |& tr '.' ',' \
#  |& awk '{ printf $2/60"\t"$4/1024/1024"\n" }' > unnaf_times.txt;
#  BYTES=`ls -la CVDB.naf.fasta | awk '{ print $5 }'`;
{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf CVDB.fasta.naf -o CVDB_naf.fasta ; } 2>>unnaf_times.txt

#{ time mbgc -d CVDB.mbgc CVDB_mbgc.fasta ; } 2>>mbgcdtimes.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -t 2 -o CVDB.fasta.mfc ; } 2>>mf_decompresstimes.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c CVDB.fasta.gz >CVDB_gz.fasta  ; } 2>>gunzip_times.txt

#awk 'NR==1, NR==2 {print NR,$2}' naf_times.txt 

#Decompress


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

#time=awk 'FNR == 2 {print $2}' naf_times.txt;
#

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

#time_naf=$(awk '{print $1}' mbgc_time_total.txt)
#time_naf=$(awk '{print $1}' mbgc_time_total.txt)
#awk '{print $(time_naf)}'
#awk -F "," 'BEGIN {OFS=","} {$time_naf; print}' Output.csv >> Output.csv


#echo $((time_naf))
ls CVDB* -la -ltr | awk 'BEGIN{ OFS=","; print "File;Size;Time,"}; NR > 1{print $9,$5;}' > Output.csv
#for i in ${!times_arr[@]}; do
    
echo $(awk '{print $1}' naf_time_total.txt) 
#| awk '{print $1;}' OFS="," > Output_n.csv
   
 # done  
}
