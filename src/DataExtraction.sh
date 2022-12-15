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
