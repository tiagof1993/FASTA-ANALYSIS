#Extract data from txt files

rm Output_naf.csv

#Stage 4

#Decompression CG
file_name=$(ls ordered_shuffled_CG* -la -ltr | grep \_bz2.fasta$ |awk '{print $9;}')
size=$(ls ordered_shuffled_CG* -la -ltr | grep \._bz2.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' bzip2_decompress_times_s4.txt)
memory=$(awk 'FNR ==3 {print $4}' bzip2_decompress_times_s4.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_CG* -la -ltr | grep \_lzma.fasta$ |awk '{print $9;}')
size=$(ls ordered_shuffled_CG* -la -ltr | grep \._lzma.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' lzma_decompress_times_s4.txt)
memory=$(awk 'FNR ==3 {print $4}' lzma_decompress_times_s4.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_CG* -la -ltr | grep \_gz.fasta$ |awk '{print $9;}')
size=$(ls ordered_shuffled_CG* -la -ltr | grep \._gz.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' gunzip_times_s4.txt)
memory=$(awk 'FNR ==3 {print $4}' gunzip_times_s4.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_CG* -la -ltr | grep \.mfc.d$ |awk '{print $9;}')
size=$(ls ordered_shuffled_CG* -la -ltr | grep \.mfc.d$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' mf_decompresstimes_s4.txt)
memory=$(awk 'FNR ==3 {print $4}' mf_decompresstimes_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_CG* -la -ltr | grep \._naf.fasta$ |awk '{print $9;}')
size=$(ls ordered_shuffled_CG* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' unnaf_times_s4.txt) 
memory=$(awk 'FNR ==3 {print $4}' unnaf_times_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

#Decompression AT
file_name=$(ls ordered_shuffled_AT* -la -ltr | grep \_bz2.fasta$ |awk '{print $9;}')
size=$(ls ordered_shuffled_AT* -la -ltr | grep \._bz2.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' bzip_decompress_times_s4.txt)
memory=$(awk 'FNR ==2 {print $4}' bzip_decompress_times_s4.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_AT* -la -ltr | grep \_lzma.fasta$ |awk '{print $9;}')
size=$(ls ordered_shuffled_AT* -la -ltr | grep \._lzma.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' lzma_decompress_times_s4.txt)
memory=$(awk 'FNR ==2 {print $4}' lzma_decompress_times_s4.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_AT* -la -ltr | grep \_gz.fasta$ |awk '{print $9;}')
size=$(ls ordered_shuffled_AT* -la -ltr | grep \._gz.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' gunzip_times_s4.txt)
memory=$(awk 'FNR ==2 {print $4}' gunzip_times_s4.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_AT* -la -ltr | grep \.mfc.d$ |awk '{print $9;}')
size=$(ls ordered_shuffled_AT* -la -ltr | grep \.mfc.d$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' mf_decompresstimes_s4.txt)
memory=$(awk 'FNR ==2 {print $4}' mf_decompresstimes_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_AT* -la -ltr | grep \._naf.fasta$ |awk '{print $9;}')
size=$(ls ordered_shuffled_AT* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' unnaf_times_s4.txt) 
memory=$(awk 'FNR ==2 {print $4}' unnaf_times_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

#Decompression
file_name=$(ls ordered_shuffled_size* -la -ltr | grep \_bz2.fasta$ |awk '{print $9;}')
size=$(ls ordered_shuffled_size* -la -ltr | grep \._bz2.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' bzip_decompress_times_s4.txt)
memory=$(awk 'FNR ==1 {print $4}' bzip_decompress_times_s4.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_size* -la -ltr | grep \_lzma.fasta$ |awk '{print $9;}')
size=$(ls ordered_shuffled_size* -la -ltr | grep \._lzma.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' lzma_decompress_times_s4.txt)
memory=$(awk 'FNR ==1 {print $4}' lzma_decompress_times_s4.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_size* -la -ltr | grep \_gz.fasta$ |awk '{print $9;}')
size=$(ls ordered_shuffled_size* -la -ltr | grep \._gz.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' gunzip_times_s4.txt)
memory=$(awk 'FNR ==1 {print $4}' gunzip_times_s4.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_size* -la -ltr | grep \.mfc.d$ |awk '{print $9;}')
size=$(ls ordered_shuffled_size* -la -ltr | grep \.mfc.d$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' mf_decompresstimes_s4.txt) 
memory=$(awk 'FNR ==1 {print $4}' mf_decompresstimes_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_size* -la -ltr | grep \._naf.fasta$ |awk '{print $9;}')
size=$(ls ordered_shuffled_size* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' unnaf_times_s4.txt) 
memory=$(awk 'FNR ==1 {print $4}' unnaf_times_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"File Name","Size","Time","Memory"
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
file_name=$(ls ordered_shuffled_CG* -la -ltr | grep \.fasta.bz2$ |awk '{print $9;}')
size=$(ls ordered_shuffled_CG* -la -ltr | grep \.fasta.bz2$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' bzip2_times_s4.txt)
memory=$(awk 'FNR ==3 {print $4}' bzip2_times_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_CG* -la -ltr | grep \.fasta.lzma$ |awk '{print $9;}')
size=$(ls ordered_shuffled_CG* -la -ltr | grep \.fasta.lzma$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' lzma_times_s4.txt) 
memory=$(awk 'FNR ==3 {print $4}' lzma_times_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_CG* -la -ltr | grep \.fasta.gz$ |awk '{print $9;}')
size=$(ls ordered_shuffled_CG* -la -ltr | grep \.fasta.gz$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' gzip_times_s4.txt)
memory=$(awk 'FNR ==3 {print $4}' gzip_times_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_CG* -la -ltr | grep \.mfc$ |awk '{print $9;}')
size=$(ls ordered_shuffled_CG* -la -ltr | grep \.mfc$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' mf_compresstimes_s4.txt) 
memory=$(awk 'FNR ==3 {print $4}' mf_compresstimes_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_CG* -la -ltr | grep \.naf$ |awk '{print $9;}')
size=$(ls ordered_shuffled_CG* -la -ltr | grep \.naf$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' naf_times_s4.txt) 
memory=$(awk 'FNR ==3 {print $4}' naf_times_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

#Compression AT
file_name=$(ls ordered_shuffled_AT* -la -ltr | grep \.fasta.bz2$ |awk '{print $9;}')
size=$(ls ordered_shuffled_AT* -la -ltr | grep \.fasta.bz2$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' bzip2_times_s4.txt) 
memory=$(awk 'FNR ==2 {print $4}' bzip2_times_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time.$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_AT* -la -ltr | grep \.fasta.lzma$ |awk '{print $9;}')
size=$(ls ordered_shuffled_AT* -la -ltr | grep \.fasta.lzma$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' lzma_times_s4.txt)
memory=$(awk 'FNR ==2 {print $4}' lzma_times_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_AT* -la -ltr | grep \.fasta.gz$ |awk '{print $9;}')
size=$(ls ordered_shuffled_AT* -la -ltr | grep \.fasta.gz$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' gzip_times_s4.txt) 
memory=$(awk 'FNR ==2 {print $4}' gzip_times_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_AT* -la -ltr | grep \.mfc$ |awk '{print $9;}')
size=$(ls ordered_shuffled_AT* -la -ltr | grep \.mfc$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' mf_compresstimes_s4.txt) 
memory=$(awk 'FNR ==2 {print $4}' mf_compresstimes_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_AT* -la -ltr | grep \.naf$ |awk '{print $9;}')
size=$(ls ordered_shuffled_AT* -la -ltr | grep \.naf$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' naf_times_s4.txt) 
memory=$(awk 'FNR ==2 {print $4}' naf_times_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

#Compression
file_name=$(ls ordered_shuffled_size* -la -ltr | grep \.fasta.bz2$ |awk '{print $9;}')
size=$(ls ordered_shuffled_size* -la -ltr | grep \.fasta.bz2$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' bzip2_times_s4.txt) 
memory=$(awk 'FNR ==1 {print $4}' bzip2_times_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_size* -la -ltr | grep \.fasta.lzma$ |awk '{print $9;}')
size=$(ls ordered_shuffled_size* -la -ltr | grep \.fasta.lzma$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' lzma_times_s4.txt) 
memory=$(awk 'FNR ==1 {print $4}' lzma_times_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_size* -la -ltr | grep \.fasta.gz$ |awk '{print $9;}')
size=$(ls ordered_shuffled_size* -la -ltr | grep \.fasta.gz$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' gzip_times_s4.txt) 
memory=$(awk 'FNR ==1 {print $4}' gzip_times_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_size* -la -ltr | grep \.mfc$ |awk '{print $9;}')
size=$(ls ordered_shuffled_size* -la -ltr | grep \.mfc$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' mf_compresstimes_s4.txt)
time=$(awk 'FNR ==1 {print $4}' mf_compresstimes_s4.txt)  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_shuffled_size* -la -ltr | grep \.naf$ |awk '{print $9;}')
size=$(ls ordered_shuffled_size* -la -ltr | grep \.naf$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' naf_times_s4.txt)
memory=$(awk 'FNR ==1 {print $4}' naf_times_s4.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}



file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"File Name","Size","Time","Memory"
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
file_name=$(ls ordered_CVDB_CG* -la -ltr | grep \_bz2.fasta$ |awk '{print $9;}')
size=$(ls sordered_CVDB_CG* -la -ltr | grep \._bz2.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' bzip2_decompress_times_s3.txt)
memory=$(awk 'FNR ==3 {print $4}' bzip2_decompress_times_s3.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_CVDB_CG* -la -ltr | grep \_lzma.fasta$ |awk '{print $9;}')
size=$(ls sordered_CVDB_CG* -la -ltr | grep \._lzma.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' lzma_decompress_times_s3.txt)
memory=$(awk 'FNR ==3 {print $4}' lzma_decompress_times_s3.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_CVDB_CG* -la -ltr | grep \_gz.fasta$ |awk '{print $9;}')
size=$(ls sordered_CVDB_CG* -la -ltr | grep \._gz.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' gunzip_times_s3.txt)
memory=$(awk 'FNR ==3 {print $4}' gunzip_times_s3.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_CVDB_CG* -la -ltr | grep \.mfc.d$ |awk '{print $9;}')
size=$(ls ordered_CVDB_CG* -la -ltr | grep \.mfc.d$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' mf_decompresstimes_s3.txt)
memory=$(awk 'FNR ==3 {print $4}' mf_decompresstimes_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_CVDB_CG* -la -ltr | grep \._naf.fasta$ |awk '{print $9;}')
size=$(ls ordered_CVDB_CG* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' unnaf_times_s3.txt)
memory=$(awk 'FNR ==3 {print $4}' unnaf_times_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

#Decompression AT
file_name=$(ls ordered_CVDB_AT* -la -ltr | grep \_bz2.fasta$ |awk '{print $9;}')
size=$(ls sordered_CVDB_AT* -la -ltr | grep \._bz2.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' bzip2_decompress_times_s3.txt)
memory=$(awk 'FNR ==2 {print $4}' bzip2_decompress_times_s3.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_CVDB_AT* -la -ltr | grep \_lzma.fasta$ |awk '{print $9;}')
size=$(ls sordered_CVDB_AT* -la -ltr | grep \._lzma.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' lzma_decompress_times_s3.txt)
memory=$(awk 'FNR ==2 {print $4}' lzma_decompress_times_s3.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}


file_name=$(ls ordered_CVDB_AT* -la -ltr | grep \_gz.fasta$ |awk '{print $9;}')
size=$(ls sordered_CVDB_AT* -la -ltr | grep \._gz.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' gunzip_times_s3.txt)
memory=$(awk 'FNR ==2 {print $4}' gunzip_times_s3.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_CVDB_AT* -la -ltr | grep \.mfc.d$ |awk '{print $9;}')
size=$(ls ordered_CVDB_AT* -la -ltr | grep \.mfc.d$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' mf_decompresstimes_s3.txt) 
memory=$(awk 'FNR ==2 {print $4}' mf_decompresstimes_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_CVDB_AT* -la -ltr | grep \._naf.fasta$ |awk '{print $9;}')
size=$(ls ordered_CVDB_AT* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' unnaf_times_s3.txt) 
memory=$(awk 'FNR ==2 {print $4}' unnaf_times_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

#Decompression

file_name=$(ls ordered_CVDB_size* -la -ltr | grep \_bz2.fasta$ |awk '{print $9;}')
size=$(ls sordered_CVDB_size* -la -ltr | grep \._bz2.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' bzip2_decompress_times_s3.txt)
memory=$(awk 'FNR ==1 {print $4}' bzip2_decompress_times_s3.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_CVDB_size* -la -ltr | grep \_lzma.fasta$ |awk '{print $9;}')
size=$(ls sordered_CVDB_size* -la -ltr | grep \._lzma.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' lzma_decompress_times_s3.txt)
memory=$(awk 'FNR ==1 {print $4}' lzma_decompress_times_s3.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}


file_name=$(ls ordered_CVDB_size* -la -ltr | grep \_gz.fasta$ |awk '{print $9;}')
size=$(ls sordered_CVDB_size* -la -ltr | grep \._gz.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' gunzip_times_s3.txt)
memory=$(awk 'FNR ==1 {print $4}' gunzip_times_s3.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_CVDB_size* -la -ltr | grep \.mfc.d$ |awk '{print $9;}')
size=$(ls ordered_CVDB_size* -la -ltr | grep \.mfc.d$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' mf_decompresstimes_s3.txt)
memory=$(awk 'FNR ==1 {print $4}' mf_decompresstimes_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_CVDB_size* -la -ltr | grep \._naf.fasta$ |awk '{print $9;}')
size=$(ls ordered_CVDB_size* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' unnaf_times_s3.txt) 
memory=$(awk 'FNR ==1 {print $4}' unnaf_times_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"File Name","Size","Time","Memory"
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
file_name=$(ls ordered_CVDB_CG* -la -ltr | grep \.fasta.bz2$ |awk '{print $9;}')
size=$(ls ordered_CVDB_CG* -la -ltr | grep \.fasta.bz2$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' bzip2_times_s3.txt) 
memory=$(awk 'FNR ==3 {print $4}' bzip2_times_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_CVDB_CG* -la -ltr | grep \.fasta.lzma$ |awk '{print $9;}')
size=$(ls ordered_CVDB_CG* -la -ltr | grep \.fasta.lzma$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' lzma_times_s3.txt)
memory=$(awk 'FNR ==3 {print $4}' lzma_times_s3.txt)  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}


file_name=$(ls ordered_CVDB_CG* -la -ltr | grep \.fasta.gz$ |awk '{print $9;}')
size=$(ls ordered_CVDB_CG* -la -ltr | grep \.fasta.gz$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' gzip_times_s3.txt) 
memory=$(awk 'FNR ==3 {print $4}' gzip_times_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_CVDB_CG* -la -ltr | grep \.mfc$ |awk '{print $9;}')
size=$(ls ordered_CVDB_CG* -la -ltr | grep \.mfc$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' mf_compresstimes_s3.txt) 
memory=$(awk 'FNR ==3 {print $4}' mf_compresstimes_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_CVDB_CG* -la -ltr | grep \.naf$ |awk '{print $9;}')
size=$(ls ordered_CVDB_CG* -la -ltr | grep \.naf$ |awk '{print $5;}')
time=$(awk 'FNR ==3 {print $2}' naf_times_s3.txt) 
memory=$(awk 'FNR ==3 {print $4}' naf_times_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

#Compression AT
file_name=$(ls ordered_CVDB_AT* -la -ltr | grep \.fasta.bz2$ |awk '{print $9;}')
size=$(ls ordered_CVDB_AT* -la -ltr | grep \.fasta.bz2$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' bzip2_times_s3.txt) 
memory=$(awk 'FNR ==2 {print $4}' bzip2_times_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_CVDB_AT* -la -ltr | grep \.fasta.lzma$ |awk '{print $9;}')
size=$(ls ordered_CVDB_AT* -la -ltr | grep \.fasta.lzma$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' lzma_times_s3.txt)
memory=$(awk 'FNR ==2 {print $4}' lzma_times_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}


file_name=$(ls ordered_CVDB_AT* -la -ltr | grep \.fasta.gz$ |awk '{print $9;}')
size=$(ls ordered_CVDB_AT* -la -ltr | grep \.fasta.gz$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' gzip_times_s3.txt) 
memory=$(awk 'FNR ==2 {print $4}' gzip_times_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_CVDB_AT* -la -ltr | grep \.mfc$ |awk '{print $9;}')
size=$(ls ordered_CVDB_AT* -la -ltr | grep \.mfc$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' mf_compresstimes_s3.txt) 
memory=$(awk 'FNR ==2 {print $4}' mf_compresstimes_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_CVDB_AT* -la -ltr | grep \.naf$ |awk '{print $9;}')
size=$(ls ordered_CVDB_AT* -la -ltr | grep \.naf$ |awk '{print $5;}')
time=$(awk 'FNR ==2 {print $2}' naf_times_s3.txt) 
memory=$(awk 'FNR ==2 {print $4}' naf_times_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

#Compression size
file_name=$(ls ordered_CVDB_size* -la -ltr | grep \.fasta.bz2$ |awk '{print $9;}')
size=$(ls ordered_CVDB_size* -la -ltr | grep \.fasta.bz2$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' bzip2_times_s3.txt) 
memory=$(awk 'FNR ==1 {print $4}' bzip2_times_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_CVDB_size* -la -ltr | grep \.fasta.lzma$ |awk '{print $9;}')
size=$(ls ordered_CVDB_size* -la -ltr | grep \.fasta.lzma$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' lzma_times_s3.txt) 
memory=$(awk 'FNR ==1 {print $4}' lzma_times_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_CVDB_size* -la -ltr | grep \.fasta.gz$ |awk '{print $9;}')
size=$(ls ordered_CVDB_size* -la -ltr | grep \.fasta.gz$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' gzip_times_s3.txt) 
memory=$(awk 'FNR ==1 {print $4}' gzip_times_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_CVDB_size* -la -ltr | grep \.mfc$ |awk '{print $9;}')
size=$(ls ordered_CVDB_size* -la -ltr | grep \.mfc$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' mf_compresstimes_s3.txt) 
memory=$(awk 'FNR ==1 {print $4}' mf_compresstimes_s3.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls ordered_CVDB_size* -la -ltr | grep \.naf$ |awk '{print $9;}')
size=$(ls ordered_CVDB_size* -la -ltr | grep \.naf$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' naf_times_s3.txt)
memory=$(awk 'FNR ==1 {print $4}' naf_times_s3.txt)  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}



file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"File Name","Size","Time","Memory"
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
file_name=$(ls shuffled* -la -ltr | grep \_bz2.fasta$ |awk '{print $9;}')
size=$(ls shuffled* -la -ltr | grep \._bz2.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' bzip2_decompress_times_s2.txt)
memory=$(awk 'FNR ==1 {print $4}' bzip2_decompress_times_s2.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls shuffled* -la -ltr | grep \_lzma.fasta$ |awk '{print $9;}')
size=$(ls shuffled* -la -ltr | grep \._lzma.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' lzma_decompress_times_s2.txt)
memory=$(awk 'FNR ==1 {print $4}' lzma_decompress_times_s2.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls shuffled* -la -ltr | grep \_gz.fasta$ |awk '{print $9;}')
size=$(ls shuffled* -la -ltr | grep \._gz.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' gunzip_times_s2.txt)
memory=$(awk 'FNR ==1 {print $4}' gunzip_times_s2.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | memory_x

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls shuffled* -la -ltr | grep \.mfc.d$ |awk '{print $9;}')
size=$(ls shuffled* -la -ltr | grep \.mfc.d$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' mf_decompresstimes_s2.txt) 
memory=$(awk 'FNR ==1 {print $4}' mf_decompresstimes_s2.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls shuffled* -la -ltr | grep \._naf.fasta$ |awk '{print $9;}')
size=$(ls shuffled* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' unnaf_times_s2.txt) 
memory=$(awk 'FNR ==1 {print $4}' unnaf_times_s2.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"File Name","Size","Time","Memory"
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
file_name=$(ls shuffled* -la -ltr | grep \.fasta.bz2$ |awk '{print $9;}')
size=$(ls shuffled* -la -ltr | grep \.fasta.bz2$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' bzip2_times_s2.txt)
memory=$(awk 'FNR ==1 {print $4}' bzip2_times_s2.txt)  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls shuffled* -la -ltr | grep \.fasta.lzma$ |awk '{print $9;}')
size=$(ls shuffled* -la -ltr | grep \.fasta.lzma$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' lzma_times_s2.txt)
memory=$(awk 'FNR ==1 {print $4}' lzma_times_s2.txt)  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls shuffled* -la -ltr | grep \.fasta.gz$ |awk '{print $9;}')
size=$(ls shuffled* -la -ltr | grep \.fasta.gz$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' gzip_times_s2.txt)
memory=$(awk 'FNR ==1 {print $4}' gzip_times_s2.txt)  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls shuffled* -la -ltr | grep \.mfc$ |awk '{print $9;}')
size=$(ls shuffled* -la -ltr | grep \.mfc$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' mf_compresstimes_s2.txt) 
memory=$(awk 'FNR ==1 {print $4}' mf_compresstimes_s2.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls shuffled* -la -ltr | grep \.naf$ |awk '{print $9;}')
size=$(ls shuffled* -la -ltr | grep \.naf$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' naf_times_s2.txt) 
memory=$(awk 'FNR ==1 {print $4}' naf_times_s2.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}



file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
"File Name","Size","Time","Memory"
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

file_name=$(ls CVDB* -la -ltr | grep \_bz2.fasta$ |awk '{print $9;}')
size=$(ls CVDB* -la -ltr | grep \._bz2.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' bzip2_decompress_times.txt)
memory=$(awk 'FNR ==1 {print $4}' bzip2_decompress_times.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x



file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls CVDB* -la -ltr | grep \_lzma.fasta$ |awk '{print $9;}')
size=$(ls CVDB* -la -ltr | grep \._lzma.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' lzma_decompress_times.txt)
memory=$(awk 'FNR ==1 {print $4}' lzma_decompress_times.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

#Decompression
file_name=$(ls CVDB* -la -ltr | grep \_gz.fasta$ |awk '{print $9;}')
size=$(ls CVDB* -la -ltr | grep \._gz.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' gunzip_times.txt)
memory=$(awk 'FNR ==1 {print $4}' gunzip_times.txt)
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls CVDB* -la -ltr | grep \.mfc.d$ |awk '{print $9;}')
size=$(ls CVDB* -la -ltr | grep \.mfc.d$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' mf_decompresstimes.txt) 
memory=$(awk 'FNR ==1 {print $4}' mf_decompresstimes.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x



file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls CVDB* -la -ltr | grep \._naf.fasta$ |awk '{print $9;}')
size=$(ls CVDB* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' unnaf_times.txt)
memory=$(awk 'FNR ==1 {print $4}' unnaf_times.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
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
"File Name","Size","Time","Memory"
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
file_name=$(ls CVDB* -la -ltr | grep \.fasta.bz2$ |awk '{print $9;}')
size=$(ls CVDB* -la -ltr | grep \.fasta.bz2$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' bzip2_times.txt) 
memory=$(awk 'FNR ==1 {print $4}' bzip2_times.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls CVDB* -la -ltr | grep \.fasta.lzma$ |awk '{print $9;}')
size=$(ls CVDB* -la -ltr | grep \.fasta.lzma$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' lzma_times.txt) 
memory=$(awk 'FNR ==1 {print $4}' lzma_times.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_X

file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

#original_file_size=$(ls CVDB.fasta -la -ltr |awk '{print $5;}')
file_name=$(ls CVDB* -la -ltr | grep \.fasta.gz$ |awk '{print $9;}')
size=$(ls CVDB* -la -ltr | grep \.fasta.gz$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' gzip_times.txt) 
memory=$(awk 'FNR ==1 {print $4}' gzip_times.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#compression_percentage=$($size/$original_file_size | dc) 
#echo $compression_percentage


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls CVDB* -la -ltr | grep \.mfc$ |awk '{print $9;}')
size=$(ls CVDB* -la -ltr | grep \.mfc$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' mf_compresstimes.txt)
memory=$(awk 'FNR ==1 {print $4}' mf_compresstimes.txt)  
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x


file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
.
wq
EOF
}

file_name=$(ls CVDB* -la -ltr | grep \.naf$ |awk '{print $9;}')
size=$(ls CVDB* -la -ltr | grep \.naf$ |awk '{print $5;}')
time=$(awk 'FNR ==1 {print $2}' naf_times.txt)
memory=$(awk 'FNR ==1 {print $4}' naf_times.txt) 
printf $file_name | tee file_name_x
printf $size | tee size_x
printf $time | tee time_x
printf $memory | tee memory_x
#printf
#paste file_name_x size_x time_x > Output_naf.csv
file="Output_naf.csv"

{
ed -s "$file" <<EOF
1
i
$file_name,$size,$time,$memory
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
"File Name","Size","Time","Memory"
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
