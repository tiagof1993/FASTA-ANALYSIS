#!/bin/bash

function JARVIS3_COMPRESSION(){
  IN_FILE="$1";
  LEVEL="$2";
  PARTITION="$3";
  PARTITION_MB="$4"
  sorting_type="$5"
  # SORTING_TYPE="$5"

  IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fasta//g')
  echo $IN_FILE_SHORT_NAME
  # PARTITION_MB=$(cat $PARTITION | sed 's/MB//g')
  # if [[ $PARTITION == "1GB" ]] then
  #   PARTITION_MB="1000"
  # fi

  { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l $LEVEL --block $PARTITION --fasta -i $IN_FILE ; } 2>$IN_FILE_SHORT_NAME-$PARTITION_MB-l$LEVEL.txt
  { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l $LEVEL --block $PARTITION --fasta -i sort_$IN_FILE ; } 2>$IN_FILE_SHORT_NAME-sort_$PARTITION_MB-l$LEVEL-$sorting_type.txt
  { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l $LEVEL --block $PARTITION --fasta -i sort_fanalysis_$sorting_type-$IN_FILE ; } 2>$IN_FILE_SHORT_NAME-sort_fa_$PARTITION_MB-l$LEVEL-$sorting_type.txt

  { ls $IN_FILE* -la -ltr | grep \.tar$ | awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-size_$PARTITION_MB-l$LEVEL.txt
  { ls sort_$IN_FILE* -la -ltr | grep \.tar$ | awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_size_$PARTITION_MB-l$LEVEL-$sorting_type.txt
  { ls sort_fanalysis_$sorting_type-$IN_FILE* -la -ltr | grep \.tar$ | awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_fa_size_$PARTITION_MB-l$LEVEL-$sorting_type.txt

  { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l $LEVEL --fasta -i $IN_FILE.tar ;  } 2>$IN_FILE_SHORT_NAME-d_$PARTITION_MB-l$LEVEL.txt
  { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l $LEVEL --fasta -i sort_$IN_FILE.tar ;  } 2>$IN_FILE_SHORT_NAME-sort_d_$PARTITION_MB-l$LEVEL-$sorting_type.txt
  { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l $LEVEL --fasta -i sort_fanalysis_$sorting_type-$IN_FILE.tar ;  } 2>$IN_FILE_SHORT_NAME-sort_fa_d_$PARTITION_MB-l$LEVEL-$sorting_type.txt

  { ls $IN_FILE* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-size_d_$PARTITION_MB-l$LEVEL.txt
  { ls sort_$IN_FILE* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_size_d_$PARTITION_MB-l$LEVEL-$sorting_type.txt
  { ls sort_fanalysis_$sorting_type-$IN_FILE* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_fa_size_d_$PARTITION_MB-l$LEVEL-$sorting_type.txt

  rm *tar.out


}



function CSV_BUILDER_JARVIS3(){

  IN_FILE="$1";
  LEVEL="$2";
  PARTITION="$3";
  PARTITION_MB="$4";
  SORTING_ALGORITHM="$5";
  SORTING_TYPE="$6";
  test="$7"

  IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fasta//g')
  echo $IN_FILE_SHORT_NAME

if [[ $SORTING_ALGORITHM == "fasta_analysis" ]]; then  

program="JARVIS3_$INPUT_FILE_SHORT_NAME-fasta_analysis"
level=$LEVEL
partition="$PARTITION"
bytes=$(ls sort_fanalysis_$SORTING_TYPE-$IN_FILE* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-sort_fa_size_$PARTITION_MB-l$LEVEL-$SORTING_TYPE.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-size_$PARTITION_MB-l$LEVEL-$SORTING_TYPE.txt)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' $IN_FILE_SHORT_NAME-sort_fa_$PARTITION_MB-l$LEVEL-$SORTING_TYPE.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_fa_$PARTITION_MB-l$LEVEL-$SORTING_TYPE.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-sort_fa_size_d_$PARTITION_MB-l$LEVEL-$SORTING_TYPE.txt)
d_time=$(awk 'FNR ==1 {print $2}'  $IN_FILE_SHORT_NAME-sort_fa_d_$PARTITION_MB-l$LEVEL-$SORTING_TYPE.txt)
d_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_fa_d_$PARTITION_MB-l$LEVEL-$SORTING_TYPE.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=$(echo $test)

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
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
 

file="data_jarvis3-$IN_FILE_SHORT_NAME-$SORTING_TYPE.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}

elif [[ $SORTING_ALGORITHM == "sortmf" ]]; then

program="JARVIS3_$IN_FILE_SHORT_NAME-sortmf"
level=$LEVEL
partition="$PARTITION"
bytes=$(ls sort_$IN_FILE* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-sort_size_$PARTITION_MB-l$LEVEL-$SORTING_TYPE.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-size_$PARTITION_MB-l$LEVEL-$SORTING_TYPE.txt)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' $IN_FILE_SHORT_NAME-sort_$PARTITION_MB-l$LEVEL-$SORTING_TYPE.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_$PARTITION_MB-l$LEVEL-$SORTING_TYPE.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-size_d_$PARTITION_MB-l$LEVEL-$SORTING_TYPE.txt)
d_time=$(awk 'FNR ==1 {print $2}'  $IN_FILE_SHORT_NAME-sort_d_$PARTITION_MB-l$LEVEL-$SORTING_TYPE.txt)
d_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_d_$PARTITION_MB-l$LEVEL-$SORTING_TYPE.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=$(echo $test)

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
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
 

file="data_jarvis3-$IN_FILE_SHORT_NAME-$SORTING_TYPE.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}

else

program="JARVIS3_$IN_FILE_SHORT_NAME"
level=$LEVEL
partition="$PARTITION"
bytes=$(ls $IN_FILE* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-size_$PARTITION_MB-l$LEVEL.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-size_$PARTITION_MB-l$LEVEL.txt)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' $IN_FILE_SHORT_NAME-$PARTITION_MB-l$LEVEL.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-$PARTITION_MB-l$LEVEL.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-size_d_$PARTITION_MB-l$LEVEL.txt)
d_time=$(awk 'FNR ==1 {print $2}'  $IN_FILE_SHORT_NAME-d_$PARTITION_MB-l$LEVEL.txt)
d_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-d_$PARTITION_MB-l$LEVEL.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=$(echo $test)

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
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
 

file="data_jarvis3-$IN_FILE_SHORT_NAME-$SORTING_TYPE.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}

fi

}
function BUILD_CSV_HEADER_2(){

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
"PROGRAM","LEVEL","PARTITION","BYTES","C_BYTES","BPS_original","BPS_final","GAIN","C_TIME(s)","C_RAM(GB)","D_TIME(s)","D_MEM(GB)","DIFF","RUN"
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
sorting_type=$1
INPUT_FILE=$2
#n=$3
test=$3
full=$4

#for ((n=0; n<${#sorting_types[@]}; n++)); do
#for ((m=0; m<${#INPUT_FILE[@]}; m++)); do
# m=0
# while (($m < ${#INPUT_FILE[@]} )); do
#JARVIS3

levels_array=("1" "2" "5")
#levels_array=("15" "20" "25" "30")
# partitions_array=("10MB" "100MB" "1GB")
# partitions_in_mb=("10" "100" "1000")
partitions_array=("100MB")
partitions_in_mb=("100")
program=()
if [[ $full -eq 1 ]]; then
 program=("")
else
  program=("fasta_analysis")
fi  
#program=("" "fasta_analysis")
#partitions_array=("10MB")
#partitions_in_mb=("10")

rm *.tar
j=0

for ((i=0; i<${#levels_array[@]}; i++)); do
j=0
 while (($j < ${#partitions_array[@]} )); do
    JARVIS3_COMPRESSION $INPUT_FILE ${levels_array[i]} ${partitions_array[j]} ${partitions_in_mb[j]} $sorting_type;

  j=$((j+1))
 done
done

#CSV_BUILDER JARVIS3
for ((i=${#levels_array[@]}-1; i>=0; i--))
 do
  for ((j=${#partitions_array[@]}-1; j>=0; j--))
   do
    for ((k=${#program[@]}-1; k>=0; k--))
     do
      CSV_BUILDER_JARVIS3 $INPUT_FILE ${levels_array[i]} ${partitions_array[j]} ${partitions_in_mb[j]} ${program[k]} $sorting_type $test

     done
    done
   done

      
     BUILD_CSV_HEADER_2 "jarvis3" $INPUT_FILE $sorting_type
   #  PLOT_JARVIS3 "data_jarvis3-$INPUT_FILE_SHORT_NAME" $partitions_array
# #    m=$((m+1))
# #   done
# # #done  

