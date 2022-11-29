#bin/bash
#!/usr/bin/bash
# Scenario 1 - Compress original file (sequences_virus.fasta)

#time {
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

{ time ennaf --strict CVDB.fasta -o CVDB.naf --temp-dir tmp/ ; } 2>>naf_times.txt

{ time mbgc -i CVDB.fasta CVDB.mbgc ; } 2>>mbgctimes.txt

{ time ./MFCompressC -1 -t 2 CVDB.fasta ; } 2>>mf_compresstimes.txt

{ time gzip -k -9 CVDB.fasta ; } 2>>gzip_times.txt



{ time unnaf CVDB.naf -o CVDB_naf.fasta ; } 2>>unnaf_times.txt

{ time mbgc -d CVDB.mbgc CVDB_mbgc.fasta ; } 2>>mbgcdtimes.txt

{ time ./MFCompressD -t 2 -o CVDB.fasta.mfc ; } 2>>mf_decompresstimes.txt

{ time gunzip -c CVDB.fasta.gz >CVDB_gz.fasta  ; } 2>>gunzip_times.txt


#Scenario 2 - Shuffle Input File and then Compress

#time {

rm naf_times_s2.txt
rm mbgctimes_s2.txt
rm gzip_times_s2.txt
rm mf_compresstimes_s2.txt
rm mbgcdtimes_s2.txt
rm mf_decompresstimes_s2.txt
run gunzip_times_s2.txt
rm stage2_time.txt
rm shuffled.fasta.gz
rm shuffled.fasta.mfc
rm shuffled.mbgc
rm shuffled.naf
rm shuffled_naf.fasta
rm shuffled_mbgc.fasta

#{ ./SHUFFLE_FASTA AT 5 shuffled.fasta sequences_virus.fasta ; } 2>>shuffle_times.txt
{ ./FASTA_ANALY -s CVDB.fasta shuffled.fasta 5 ; } 2>>shuffle_times.txt
sed -i '$ s/.$//' shuffled.fasta
{ time ennaf shuffled.fasta -o shuffled.naf --temp-dir /tmp ; } 2>>naf_times_s2.txt

{ time mbgc -i shuffled.fasta shuffled.mbgc ; } 2>>mbgctimes_s2.txt

{ time ./MFCompressC -1 -t 2 shuffled.fasta ; } 2>>mf_compresstimes_s2.txt

{ time gzip -k -9 shuffled.fasta ; } 2>>gzip_times_s2.txt

#Decompress

{ time unnaf shuffled.naf -o shuffled_naf.fasta ; } 2>>unnaf_times_s2.txt

{ time mbgc -d shuffled.mbgc shuffled_mbgc.fasta ; } 2>>mbgcdtimes_s2.txt

{ time ./MFCompressD -t 2 shuffled.fasta.mfc ; } 2>>mf_decompresstimes_s2.txt

{ time gunzip -c shuffled.fasta.gz >shuffled_gz.fasta ; } 2>>gunzip_times_s2.txt


#Scenario 3 - Order Input File and then Compress

#{ time ./FASTA_ANALY AT 5 ordered_sequences_virus.fasta sequences_virus.fasta ; } 2>>ordering_times.tx

#time {

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

   
 # done  
#Scenario 4 - Shuffle, Order and Compress
#}

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
#time {
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


#XLS

#Extract data from txt files

rm Output_naf.csv

#Stage 4

#Decompression CG
file_name=$(ls ordered_shuffled_CG* -la -ltr | grep \_gz.fasta$ |awk '{print $9;}')
size=$(ls ordered_shuffled_CG* -la -ltr | grep \._gz.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==10 {print $2}' gunzip_times_s4.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls ordered_shuffled_CG* -la -ltr | grep \.mfc.d$ |awk '{print $9;}')
size=$(ls ordered_shuffled_CG* -la -ltr | grep \.mfc.d$ |awk '{print $5;}')
time=$(awk 'FNR ==10 {print $2}' mf_decompresstimes_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls ordered_shuffled_CG* -la -ltr | grep \._naf.fasta$ |awk '{print $9;}')
size=$(ls ordered_shuffled_CG* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==10 {print $2}' unnaf_times_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

#Decompression AT
file_name=$(ls ordered_shuffled_AT* -la -ltr | grep \_gz.fasta$ |awk '{print $9;}')
size=$(ls ordered_shuffled_AT* -la -ltr | grep \._gz.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==6 {print $2}' gunzip_times_s4.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls ordered_shuffled_AT* -la -ltr | grep \.mfc.d$ |awk '{print $9;}')
size=$(ls ordered_shuffled_AT* -la -ltr | grep \.mfc.d$ |awk '{print $5;}')
time=$(awk 'FNR ==6 {print $2}' mf_decompresstimes_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls ordered_shuffled_AT* -la -ltr | grep \._naf.fasta$ |awk '{print $9;}')
size=$(ls ordered_shuffled_AT* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==6 {print $2}' unnaf_times_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

#Decompression
file_name=$(ls ordered_shuffled_size* -la -ltr | grep \_gz.fasta$ |awk '{print $9;}')
size=$(ls ordered_shuffled_size* -la -ltr | grep \._gz.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' gunzip_times_s4.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls ordered_shuffled_size* -la -ltr | grep \.mfc.d$ |awk '{print $9;}')
size=$(ls ordered_shuffled_size* -la -ltr | grep \.mfc.d$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' mf_decompresstimes_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls ordered_shuffled_size* -la -ltr | grep \._naf.fasta$ |awk '{print $9;}')
size=$(ls ordered_shuffled_size* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' unnaf_times_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"File Name","Size","Time"
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
file_name=$(ls ordered_shuffled_CG* -la -ltr | grep \.fasta.gz$ |awk '{print $9;}')
size=$(ls ordered_shuffled_CG* -la -ltr | grep \.fasta.gz$ |awk '{print $5;}')
time=$(awk 'FNR ==10 {print $2}' gzip_times_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls ordered_shuffled_CG* -la -ltr | grep \.mfc$ |awk '{print $9;}')
size=$(ls ordered_shuffled_CG* -la -ltr | grep \.mfc$ |awk '{print $5;}')
time=$(awk 'FNR ==10 {print $2}' mf_compresstimes_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls ordered_shuffled_CG* -la -ltr | grep \.naf$ |awk '{print $9;}')
size=$(ls ordered_shuffled_CG* -la -ltr | grep \.naf$ |awk '{print $5;}')
time=$(awk 'FNR ==10 {print $2}' naf_times_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

#Compression AT
file_name=$(ls ordered_shuffled_AT* -la -ltr | grep \.fasta.gz$ |awk '{print $9;}')
size=$(ls ordered_shuffled_AT* -la -ltr | grep \.fasta.gz$ |awk '{print $5;}')
time=$(awk 'FNR ==6 {print $2}' gzip_times_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls ordered_shuffled_AT* -la -ltr | grep \.mfc$ |awk '{print $9;}')
size=$(ls ordered_shuffled_AT* -la -ltr | grep \.mfc$ |awk '{print $5;}')
time=$(awk 'FNR ==6 {print $2}' mf_compresstimes_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls ordered_shuffled_AT* -la -ltr | grep \.naf$ |awk '{print $9;}')
size=$(ls ordered_shuffled_AT* -la -ltr | grep \.naf$ |awk '{print $5;}')
time=$(awk 'FNR ==6 {print $2}' naf_times_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

#Compression
file_name=$(ls ordered_shuffled_size* -la -ltr | grep \.fasta.gz$ |awk '{print $9;}')
size=$(ls ordered_shuffled_size* -la -ltr | grep \.fasta.gz$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' gzip_times_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls ordered_shuffled_size* -la -ltr | grep \.mfc$ |awk '{print $9;}')
size=$(ls ordered_shuffled_size* -la -ltr | grep \.mfc$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' mf_compresstimes_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls ordered_shuffled_size* -la -ltr | grep \.naf$ |awk '{print $9;}')
size=$(ls ordered_shuffled_size* -la -ltr | grep \.naf$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' naf_times_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}



file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"File Name","Size","Time"
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
file_name=$(ls ordered_CVDB_CG* -la -ltr | grep \_gz.fasta$ |awk '{print $9;}')
size=$(ls sordered_CVDB_CG* -la -ltr | grep \._gz.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==10 {print $2}' gunzip_times_s3.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls ordered_CVDB_CG* -la -ltr | grep \.mfc.d$ |awk '{print $9;}')
size=$(ls ordered_CVDB_CG* -la -ltr | grep \.mfc.d$ |awk '{print $5;}')
time=$(awk 'FNR ==10 {print $2}' mf_decompresstimes_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls ordered_CVDB_CG* -la -ltr | grep \._naf.fasta$ |awk '{print $9;}')
size=$(ls ordered_CVDB_CG* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==10 {print $2}' unnaf_times_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

#Decompression AT
file_name=$(ls ordered_CVDB_AT* -la -ltr | grep \_gz.fasta$ |awk '{print $9;}')
size=$(ls sordered_CVDB_AT* -la -ltr | grep \._gz.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==6 {print $2}' gunzip_times_s3.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls ordered_CVDB_AT* -la -ltr | grep \.mfc.d$ |awk '{print $9;}')
size=$(ls ordered_CVDB_AT* -la -ltr | grep \.mfc.d$ |awk '{print $5;}')
time=$(awk 'FNR ==6 {print $2}' mf_decompresstimes_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls ordered_CVDB_AT* -la -ltr | grep \._naf.fasta$ |awk '{print $9;}')
size=$(ls ordered_CVDB_AT* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==6 {print $2}' unnaf_times_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

#Decompression
file_name=$(ls ordered_CVDB_size* -la -ltr | grep \_gz.fasta$ |awk '{print $9;}')
size=$(ls sordered_CVDB_size* -la -ltr | grep \._gz.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' gunzip_times_s3.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls ordered_CVDB_size* -la -ltr | grep \.mfc.d$ |awk '{print $9;}')
size=$(ls ordered_CVDB_size* -la -ltr | grep \.mfc.d$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' mf_decompresstimes_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls ordered_CVDB_size* -la -ltr | grep \._naf.fasta$ |awk '{print $9;}')
size=$(ls ordered_CVDB_size* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' unnaf_times_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"File Name","Size","Time"
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
file_name=$(ls ordered_CVDB_CG* -la -ltr | grep \.fasta.gz$ |awk '{print $9;}')
size=$(ls ordered_CVDB_CG* -la -ltr | grep \.fasta.gz$ |awk '{print $5;}')
time=$(awk 'FNR ==10 {print $2}' gzip_times_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls ordered_CVDB_CG* -la -ltr | grep \.mfc$ |awk '{print $9;}')
size=$(ls ordered_CVDB_CG* -la -ltr | grep \.mfc$ |awk '{print $5;}')
time=$(awk 'FNR ==10 {print $2}' mf_compresstimes_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls ordered_CVDB_CG* -la -ltr | grep \.naf$ |awk '{print $9;}')
size=$(ls ordered_CVDB_CG* -la -ltr | grep \.naf$ |awk '{print $5;}')
time=$(awk 'FNR ==10 {print $2}' naf_times_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

#Compression AT
file_name=$(ls ordered_CVDB_AT* -la -ltr | grep \.fasta.gz$ |awk '{print $9;}')
size=$(ls ordered_CVDB_AT* -la -ltr | grep \.fasta.gz$ |awk '{print $5;}')
time=$(awk 'FNR ==6 {print $2}' gzip_times_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls ordered_CVDB_AT* -la -ltr | grep \.mfc$ |awk '{print $9;}')
size=$(ls ordered_CVDB_AT* -la -ltr | grep \.mfc$ |awk '{print $5;}')
time=$(awk 'FNR ==6 {print $2}' mf_compresstimes_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls ordered_CVDB_AT* -la -ltr | grep \.naf$ |awk '{print $9;}')
size=$(ls ordered_CVDB_AT* -la -ltr | grep \.naf$ |awk '{print $5;}')
time=$(awk 'FNR ==6 {print $2}' naf_times_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

#Compression size
file_name=$(ls ordered_CVDB_size* -la -ltr | grep \.fasta.gz$ |awk '{print $9;}')
size=$(ls ordered_CVDB_size* -la -ltr | grep \.fasta.gz$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' gzip_times_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls ordered_CVDB_size* -la -ltr | grep \.mfc$ |awk '{print $9;}')
size=$(ls ordered_CVDB_size* -la -ltr | grep \.mfc$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' mf_compresstimes_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls ordered_CVDB_size* -la -ltr | grep \.naf$ |awk '{print $9;}')
size=$(ls ordered_CVDB_size* -la -ltr | grep \.naf$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' naf_times_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}



file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"File Name","Size","Time"
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
file_name=$(ls shuffled* -la -ltr | grep \_gz.fasta$ |awk '{print $9;}')
size=$(ls shuffled* -la -ltr | grep \._gz.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' gunzip_times_s2.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls shuffled* -la -ltr | grep \.mfc.d$ |awk '{print $9;}')
size=$(ls shuffled* -la -ltr | grep \.mfc.d$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' mf_decompresstimes_s2.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls shuffled* -la -ltr | grep \._naf.fasta$ |awk '{print $9;}')
size=$(ls shuffled* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' unnaf_times_s2.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"File Name","Size","Time"
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
file_name=$(ls shuffled* -la -ltr | grep \.fasta.gz$ |awk '{print $9;}')
size=$(ls shuffled* -la -ltr | grep \.fasta.gz$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' gzip_times_s2.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls shuffled* -la -ltr | grep \.mfc$ |awk '{print $9;}')
size=$(ls shuffled* -la -ltr | grep \.mfc$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' mf_compresstimes_s2.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls shuffled* -la -ltr | grep \.naf$ |awk '{print $9;}')
size=$(ls shuffled* -la -ltr | grep \.naf$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' naf_times_s2.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}



file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"File Name","Size","Time"
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
original_file_size = $(ls CVDB.fasta -la -ltr |awk '{print $5;}')

#Decompression
file_name=$(ls CVDB* -la -ltr | grep \_gz.fasta$ |awk '{print $9;}')
size=$(ls CVDB* -la -ltr | grep \._gz.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' gunzip_times.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls CVDB* -la -ltr | grep \.mfc.d$ |awk '{print $9;}')
size=$(ls CVDB* -la -ltr | grep \.mfc.d$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' mf_decompresstimes.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls CVDB* -la -ltr | grep \._naf.fasta$ |awk '{print $9;}')
size=$(ls CVDB* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' unnaf_times.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
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
"File Name","Size","Time"
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
file_name=$(ls CVDB* -la -ltr | grep \.fasta.gz$ |awk '{print $9;}')
size=$(ls CVDB* -la -ltr | grep \.fasta.gz$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' gzip_times.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls CVDB* -la -ltr | grep \.mfc$ |awk '{print $9;}')
size=$(ls CVDB* -la -ltr | grep \.mfc$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' mf_compresstimes.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
.
wq
EOF
}

file_name=$(ls CVDB* -la -ltr | grep \.naf$ |awk '{print $9;}')
size=$(ls CVDB* -la -ltr | grep \.naf$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' naf_times.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time
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
"File Name","Size","Time"
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




#paste -d, size > Ouput_naf.csv


#echo $time

#awk 'BEGIN{ OFS=","; print "File Name;Size;Time,"};' > Output_naf.csv
#echo $size > Output_naf.csv

#echo $(awk '{print $1}' naf_time_total_s4.txt) 

#}
