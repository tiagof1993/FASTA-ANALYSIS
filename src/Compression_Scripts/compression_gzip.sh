
function GZIP_COMPRESSION(){
  IN_FILE="$1";
  LEVEL="$2";
  sorting_type="$3";

  IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fasta//g')
  echo $IN_FILE_SHORT_NAME
rm $IN_FILE.gz
rm sort_$IN_FILE.gz
rm sort_fanalysis_$sorting_type-$IN_FILE.gz
{ /bin/time -f "TIME\t%e\tMEM\t%M"  gzip -k -$LEVEL $IN_FILE; } 2>$IN_FILE_SHORT_NAME-gzip_l$LEVEL.txt  
{ /bin/time -f "TIME\t%e\tMEM\t%M"  gzip -k -$LEVEL sort_$IN_FILE; } 2>$IN_FILE_SHORT_NAME-sort_gzip_l$LEVEL.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M"  gzip -k -$LEVEL sort_fanalysis_$sorting_type-$IN_FILE ; } 2>$IN_FILE_SHORT_NAME-sort_fa_gzip_l$LEVEL.txt

{ ls $IN_FILE* -la -ltr | grep \.gz$ |awk '{print $5;}' ; } > $IN_FILE_SHORT_NAME-gzip_size_l$LEVEL.txt  
{ ls sort_$IN_FILE* -la -ltr | grep \.gz$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_gzip_size_l$LEVEL.txt  
{ ls sort_fanalysis_$sorting_type-$IN_FILE* -la -ltr | grep \.gz$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_fa_gzip_size_l$LEVEL.txt  

{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c $IN_FILE.gz >$IN_FILE_SHORT_NAME-gunzip.fasta ; } 2>$IN_FILE_SHORT_NAME-gunzip_l$LEVEL.txt  
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c sort_$IN_FILE.gz >sort_$IN_FILE_SHORT_NAME-gunzip.fasta ; } 2>$IN_FILE_SHORT_NAME-sort_gunzip_l$LEVEL.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c sort_fanalysis_$sorting_type-$IN_FILE.gz >sort_fanalysis_$IN_FILE_SHORT_NAME-$sorting_type-gunzip.fasta ; } 2>$IN_FILE_SHORT_NAME-sort_fa_gunzip_l$LEVEL.txt 

{ ls $IN_FILE_SHORT_NAME* -la -ltr | grep \unzip.fasta$ |awk '{print $5;}' ; } > $IN_FILE_SHORT_NAME-gunzip_size_l$LEVEL.txt 
{ ls sort_$IN_FILE_SHORT_NAME* -la -ltr | grep \unzip.fasta$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_gunzip_size_l$LEVEL.txt 
{ ls sort_fanalysis_$IN_FILE_SHORT_NAME-$sorting_type* -la -ltr | grep \unzip.fasta$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_fa_gunzip_size_l$LEVEL.txt 

rm *unzip.fasta

}


function CSV_BUILDER_GZIP(){

IN_FILE="$1";
LEVEL="$2";
SORTING_ALGORITHM="$3";
SORTING_TYPE="$4";
test="$5"
  # $IN_FILE_SHORT_NAME-naf_l$LEVEL.txt
  # $IN_FILE_SHORT_NAME-naf_size_l$LEVEL.txt

  IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fasta//g')
  echo $IN_FILE_SHORT_NAME

if [[ $SORTING_ALGORITHM == "fasta_analysis" ]]; then  

program="gzip_$IN_FILE_SHORT_NAME-fasta_analysis"
level=$LEVEL
#bytes=$(ls sort_fanalysis_$IN_FILE_SHORT_NAME* -la -ltr | grep \.fasta$ |awk '{print $5;}')
bytes=$(ls -la sort_fanalysis_$SORTING_TYPE-$IN_FILE_SHORT_NAME.fasta |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-sort_fa_gzip_size_l$LEVEL.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-gzip_size_l$LEVEL.txt)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' $IN_FILE_SHORT_NAME-sort_fa_gzip_l$LEVEL.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_fa_gzip_l$LEVEL.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-sort_fa_gunzip_size_l$LEVEL.txt)
d_time=$(awk 'FNR ==1 {print $2}'  $IN_FILE_SHORT_NAME-sort_fa_gunzip_l$LEVEL.txt)
d_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_fa_gunzip_l$LEVEL.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=$test

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data_gzip-$IN_FILE_SHORT_NAME-$SORTING_TYPE.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


elif [[ $SORTING_ALGORITHM == "sortmf" ]]; then  

program="gzip_$IN_FILE_SHORT_NAME-sortmf"
level=$LEVEL
#bytes=$(ls sort_$IN_FILE_SHORT_NAME* -la -ltr | grep \.fasta$ |awk '{print $5;}')
bytes=$(ls -la sort_$IN_FILE_SHORT_NAME.fasta |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-sort_gzip_size_l$LEVEL.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-gzip_size_l$LEVEL.txt)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' $IN_FILE_SHORT_NAME-sort_gzip_l$LEVEL.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_gzip_l$LEVEL.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-sort_gunzip_size_l$LEVEL.txt)
d_time=$(awk 'FNR ==1 {print $2}'  $IN_FILE_SHORT_NAME-sort_gunzip_l$LEVEL.txt)
d_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_gunzip_l$LEVEL.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=$test

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 IN_FILE

file="data_gzip-$IN_FILE_SHORT_NAME-$SORTING_TYPE.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}

else

program="gzip_$IN_FILE_SHORT_NAME"
level=$LEVEL
#bytes=$(ls $IN_FILE_SHORT_NAME* -la -ltr | grep \.fasta$ |awk '{print $5;}')
bytes=$(ls -la $IN_FILE_SHORT_NAME.fasta |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-gzip_size_l$LEVEL.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-gzip_size_l$LEVEL.txt)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' $IN_FILE_SHORT_NAME-gzip_l$LEVEL.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-gzip_l$LEVEL.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-gunzip_size_l$LEVEL.txt)
d_time=$(awk 'FNR ==1 {print $2}'  $IN_FILE_SHORT_NAME-gunzip_l$LEVEL.txt)
d_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-gunzip_l$LEVEL.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=$test

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data_gzip-$IN_FILE_SHORT_NAME-$SORTING_TYPE.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}

fi

}

function BUILD_CSV_HEADER_1(){
  COMPRESSOR="$1";
  IN_FILE="$2";
  SORTING_TYPE="$3";

    IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fasta//g')
  echo $IN_FILE_SHORT_NAME

file="data_$COMPRESSOR-$IN_FILE_SHORT_NAME-$SORTING_TYPE.csv"

{
ed -s "$file" <<EOF
1
i
"PROGRAM","LEVEL","BYTES","C_BYTES","BPS_original","BPS_final","GAIN","C_TIME(s)","C_RAM(GB)","D_TIME(s)","D_MEM(GB)","DIFF","RUN"
.
wq
EOF
}


file="data_$COMPRESSOR-$IN_FILE_SHORT_NAME-$SORTING_TYPE.csv"

{
ed -s "$file" <<EOF
1
i
"$COMPRESSOR DATA",
.
wq
EOF
}

}

# sorting_types=( "${@:2:$1}" ); shift "$(( $1 + 1 ))"
# INPUT_FILE=( "${@:2:$1}" ); shift "$(( $1 + 1 ))"

# declare -p sorting_types INPUT_FILE

sorting_types=$1
INPUT_FILE=$2
#n=$3
test=$3

#for ((n=0; n<${#sorting_types[@]}; n++)); do
#for ((m=0; m<${#INPUT_FILE[@]}; m++)); do
# m=0
# while (($m < ${#INPUT_FILE[@]} )); do
#General Use Compressors
levels_array=("1" "4" "7" "9")
program=("" "fasta_analysis")
#levels_array=("1")
#gzip
# #rm "data_gzip.csv"
# rm data_gzip-${INPUT_FILE[m]}-${sorting_types[n]}.csv
rm *.gz
#execution mode
for((i=0; i<${#levels_array[@]}; i++)); do

  GZIP_COMPRESSION $INPUT_FILE ${levels_array[i]} $sorting_types;
done

  #CSV_BUILDER_GZIP
   #CSV_BUILDER_GZIP
   for ((i=${#levels_array[@]}-1; i>=0; i--))
   do
   for ((j=${#program[@]}-1; j>=0; j--))
     do
      CSV_BUILDER_GZIP $INPUT_FILE ${levels_array[i]} ${program[j]} $sorting_types $test
   done
  done


BUILD_CSV_HEADER_1 "gzip" $INPUT_FILE $sorting_types
# PLOT_GZIP "data_gzip-$INPUT_FILE_SHORT_NAME"

#rm *unzip.fasta
#   m=$((m+1))
#  done
#done 

