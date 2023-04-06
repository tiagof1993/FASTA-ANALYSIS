#Generate a set of sequences with seed between 1 and 100 and subs and adds varying between 0.1 and 5%
#AlcoR simulation -rs 10000:0:4:0:0:0 > sequence.fasta 
#for x in {1..100}
#do 
# for y in {0..50}
# do
#  for z in {0..50}
#  do
 #   AlcoR simulation -fs 1:10000:0:$x:0.00$y:0.00$z:0:sequence.fasta >> sequence.fasta
 #      done
#     done
#   done






time {
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
rm CVDB.fasta.gz
rm CVDB.fasta.mfc
rm CVDB.mbgc
rm CVDB.naf
rm CVDB_naf.fasta
rm CVDB_mbgc.fasta
  
{ /bin/time -f "TIME\t%e\tMEM\t%M" ennaf --strict --temp-dir tmp/ --dna --level 22 CVDB.fasta  ; } 2>>naf_times.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -i CVDB.fasta CVDB.mbgc ; } 2>>mbgctimes.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 64 -t 8 CVDB.fasta ; } 2>>mf_compresstimes.txt


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

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 64 -t 8  CVDB.fasta.mfc ; } 2>>mf_decompresstimes.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c CVDB.fasta.gz >CVDB_gz.fasta  ; } 2>>gunzip_times.txt

#LZMA
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  CVDB.fasta.lzma ; } 2>>lzma_decompress_times.txt

#Bzip2
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d CVDB.fasta.bz2 ;} 2>>bzip2_decompress_times.txt


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


#declare -p times_arr
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
