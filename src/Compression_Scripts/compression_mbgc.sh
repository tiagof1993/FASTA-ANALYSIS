
function MBGC_COMPRESSION() {
  IN_FILE="$1";
  LEVEL="$2";
  sorting_type="$3";

  IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fasta//g')
  echo $IN_FILE_SHORT_NAME

rm $IN_FILE_SHORT_NAME.mbgc
rm sort_$IN_FILE_SHORT_NAME.mbgc
rm sort_fanalysis_$sorting_type-$IN_FILE_SHORT_NAME.mbgc

{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -c=$LEVEL -i $IN_FILE $IN_FILE_SHORT_NAME.mbgc ; } 2>$IN_FILE_SHORT_NAME-mbgc_l$LEVEL.txt 
#{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -c=$LEVEL -i sort_$IN_FILE sort_$IN_FILE_SHORT_NAME.mbgc ; } 2>$IN_FILE_SHORT_NAME-sort_mbgc_l$LEVEL.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -c=$LEVEL -i sort_fanalysis_$sorting_type-$IN_FILE sort_fanalysis_$sorting_type-$IN_FILE_SHORT_NAME.mbgc ; } 2>$IN_FILE_SHORT_NAME-sort_fa_mbgc_l$LEVEL.txt

{ ls $IN_FILE_SHORT_NAME* -la -ltr | grep \.mbgc$ |awk '{print $5;}' ; } > $IN_FILE_SHORT_NAME-mbgc_size_l$LEVEL.txt
#{ ls sort_$IN_FILE_SHORT_NAME* -la -ltr | grep \.mbgc$ |awk '{print $5;}'; } >  $IN_FILE_SHORT_NAME-sort_mbgc_size_l$LEVEL.txt
{ ls sort_fanalysis_$sorting_type-$IN_FILE_SHORT_NAME* -la -ltr | grep \.mbgc$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_fa_mbgc_size_l$LEVEL.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -d $IN_FILE_SHORT_NAME.mbgc mbgc_decompress_l$LEVEL ; } 2>$IN_FILE_SHORT_NAME-mbgc_d_l$LEVEL.txt 
#{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -d sort_$IN_FILE_SHORT_NAME.mbgc sort_mbgc_decompress_l$LEVEL ; } 2>$IN_FILE_SHORT_NAME-sort_mbgc_d_l$LEVEL.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -d sort_fanalysis_$sorting_type-$IN_FILE_SHORT_NAME.mbgc sort_fanalysis_mbgc_decompress_l$LEVEL ; } 2>$IN_FILE_SHORT_NAME-sort_fa_mbgc_d_l$LEVEL.txt 

#  mbgc -d $IN_FILE_SHORT_NAME.mbgc mbgc_decompress
#  mv mbgc_decompress/$IN_FILE_SHORT_NAME.fasta $IN_FILE_SHORT_NAME-mbgc.fasta 
#  mv sort_mbgc_decompress/sort_$IN_FILE_SHORT_NAME.fasta sort_$IN_FILE_SHORT_NAME-mbgc.fasta 
#  mv sort_fanalysis_mbgc_decompress/sort_fanalysis_$IN_FILE_SHORT_NAME.fasta sort_fanalysis_$IN_FILE_SHORT_NAME-mbgc.fasta 

cd mbgc_decompress_l$LEVEL
{ ls $IN_FILE_SHORT_NAME* -la -ltr | grep \.fasta$ |awk '{print $5;}' ; } >  $IN_FILE_SHORT_NAME-mbgc_d_size_l$LEVEL.txt
cd ..
mv mbgc_decompress_l$LEVEL/$IN_FILE_SHORT_NAME-mbgc_d_size_l$LEVEL.txt $IN_FILE_SHORT_NAME-mbgc_d_size_l$LEVEL.txt
#cd sort_mbgc_decompress_l$LEVEL
#{ ls sort_$IN_FILE_SHORT_NAME* -la -ltr | grep \fasta$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_mbgc_d_size_l$LEVEL.txt
#cd ..
#mv sort_mbgc_decompress_l$LEVEL/$IN_FILE_SHORT_NAME-sort_mbgc_d_size_l$LEVEL.txt $IN_FILE_SHORT_NAME-sort_mbgc_d_size_l$LEVEL.txt
cd sort_fanalysis_mbgc_decompress_l$LEVEL
{ ls sort_fanalysis_$IN_FILE_SHORT_NAME* -la -ltr | grep \fasta$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_fa_mbgc_d_size_l$LEVEL.txt
cd ..
mv sort_fanalysis_mbgc_decompress_l$LEVEL/$IN_FILE_SHORT_NAME-sort_fa_mbgc_d_size_l$LEVEL.txt $IN_FILE_SHORT_NAME-sort_fa_mbgc_d_size_l$LEVEL.txt

rm -d mbgc_decompress_*
rm -d sort_mbgc_decompress_*
rm -d sort_fanalysis_mbgc_decompress_*



  
}


function CSV_BUILDER_MBGC(){

IN_FILE="$1";
LEVEL="$2";
SORTING_ALGORITHM="$3";
SORTING_TYPE="$4";
test="$5";
  # $IN_FILE_SHORT_NAME-naf_l$LEVEL.txt
  # $IN_FILE_SHORT_NAME-naf_size_l$LEVEL.txt

  IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fasta//g')
  echo $IN_FILE_SHORT_NAME

if [[ $SORTING_ALGORITHM == "fasta_analysis" ]]; then  

program="MBGC_$IN_FILE_SHORT_NAME-fasta_analysis"
level=$LEVEL
bytes=$(ls sort_fanalysis_$SORTING_TYPE-$IN_FILE* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-sort_fa_mbgc_size_l$LEVEL.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-mbgc_size_l$LEVEL.txt)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' $IN_FILE_SHORT_NAME-sort_fa_mbgc_l$LEVEL.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_fa_mbgc_l$LEVEL.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-sort_fa_mbgc_d_size_l$LEVEL.txt)
d_time=$(awk 'FNR ==1 {print $2}'  $IN_FILE_SHORT_NAME-sort_fa_mbgc_d_l$LEVEL.txt)
d_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_fa_mbgc_d_l$LEVEL.txt)
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
 

file="data_mbgc-$IN_FILE_SHORT_NAME-$SORTING_TYPE.csv"

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

program="MBGC_$IN_FILE_SHORT_NAME-sortmf"
level=$LEVEL
bytes=$(ls sort_$IN_FILE* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-sort_mbgc_size_l$LEVEL.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-mbgc_size_l$LEVEL.txt)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' $IN_FILE_SHORT_NAME-sort_mbgc_l$LEVEL.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_mbgc_l$LEVEL.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-sort_mbgc_d_size_l$LEVEL.txt)
d_time=$(awk 'FNR ==1 {print $2}'  $IN_FILE_SHORT_NAME-sort_mbgc_d_l$LEVEL.txt)
d_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_mbgc_d_l$LEVEL.txt)
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
 

file="data_mbgc-$IN_FILE_SHORT_NAME-$SORTING_TYPE.csv"

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

program="MBGC_$IN_FILE_SHORT_NAME"
level=$LEVEL
bytes=$(ls $IN_FILE* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-mbgc_size_l$LEVEL.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-mbgc_size_l$LEVEL.txt)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' $IN_FILE_SHORT_NAME-mbgc_l$LEVEL.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-mbgc_l$LEVEL.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-mbgc_d_size-l$LEVEL.txt)
d_time=$(awk 'FNR ==1 {print $2}'  $IN_FILE_SHORT_NAME-mbgc_d_l$LEVEL.txt)
d_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-mbgc_d_l$LEVEL.txt)
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
 

file="data_mbgc-$IN_FILE_SHORT_NAME-$SORTING_TYPE.csv"

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

   # #MBGC
levels_array=("0" "1" "2" "3")
program=("" "fasta_analysis")
#program=("fasta_analysis")
#levels_array=("0")

# rm data_mbgc.csv
 rm *.mbgc

 for ((i=0; i<${#levels_array[@]}; i++)); do
  MBGC_COMPRESSION $INPUT_FILE ${levels_array[i]} $sorting_types;
 done

#CSV_BUILDER_MBGC
   for ((i=${#levels_array[@]}-1; i>=0; i--))
   do
    for ((j=${#program[@]}-1; j>=0; j--))
      do
       CSV_BUILDER_MBGC $INPUT_FILE ${levels_array[i]} ${program[j]} $sorting_types $test
    done
   done


# BUILD_CSV_HEADER_1 "mbgc" $INPUT_FILE $sorting_types
 PLOT_MBGC "data_mbgc-$INPUT_FILE_SHORT_NAME"

rm -d mbgc_decompress_*
rm -d sort_mbgc_decompress_*
rm -d sort_fa_mbgc_decompress_*
# m=$((m+1))
# done
#done

