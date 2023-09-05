
#!/bin/bash

function NAF_COMPRESSION() {
  IN_FILE="$1";
  LEVEL="$2";
  sorting_type="$3";

  IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fasta//g')
  echo $IN_FILE_SHORT_NAME

  echo "NAF Level" $LEVEL "compression"
if [[ $LEVEL -gt 17 ]]; then
{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna -$LEVEL --level $LEVEL $IN_FILE ; } 2>$IN_FILE_SHORT_NAME-naf_l$LEVEL.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna -$LEVEL --level $LEVEL sort_$IN_FILE ; } 2>$IN_FILE_SHORT_NAME-sort_naf_l$LEVEL-$sorting_type.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna -$LEVEL --level $LEVEL sort_fanalysis_$sorting_type-$IN_FILE ; } 2>$IN_FILE_SHORT_NAME-sort_fa_naf_l$LEVEL-$sorting_type.txt
else
{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level $LEVEL $IN_FILE ; } 2>$IN_FILE_SHORT_NAME-naf_l$LEVEL.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level $LEVEL sort_$IN_FILE ; } 2>$IN_FILE_SHORT_NAME-sort_naf_l$LEVEL-$sorting_type.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level $LEVEL sort_fanalysis_$sorting_type-$IN_FILE ; } 2>$IN_FILE_SHORT_NAME-sort_fa_naf_l$LEVEL-$sorting_type.txt
fi

{ ls $IN_FILE* -la -ltr | grep \.naf$ |awk '{print $5;}' ; } > $IN_FILE_SHORT_NAME-naf_size_l$LEVEL.txt
{ ls sort_$IN_FILE* -la -ltr | grep \.naf$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_naf_size_l$LEVEL-$sorting_type.txt
{ ls sort_fanalysis_$sorting_type-$IN_FILE* -la -ltr | grep \.naf$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_fa_naf_size_l$LEVEL-$sorting_type.txt

echo "NAF Level" $LEVEL "decompression" 

{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf  $IN_FILE.naf -o $IN_FILE_SHORT_NAME-naf.fasta ; } 2>$IN_FILE_SHORT_NAME-unnaf_l$LEVEL.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf  sort_$IN_FILE.naf -o sort_$IN_FILE_SHORT_NAME-naf.fasta ; } 2>$IN_FILE_SHORT_NAME-sort_unnaf_l$LEVEL-$sorting_type.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf  sort_fanalysis_$sorting_type-$IN_FILE.naf -o sort_fanalysis_$sorting_type-$IN_FILE_SHORT_NAME-naf.fasta ; } 2>$IN_FILE_SHORT_NAME-sort_fa_unnaf_l$LEVEL-$sorting_type.txt

{ ls $IN_FILE_SHORT_NAME* -la -ltr | grep \naf.fasta$ |awk '{print $5;}' ; } > $IN_FILE_SHORT_NAME-unnaf_size_l$LEVEL.txt
{ ls sort_$IN_FILE_SHORT_NAME* -la -ltr | grep \naf.fasta$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_unnaf_size_l$LEVEL-$sorting_type.txt
{ ls sort_fanalysis_$sorting_type-$IN_FILE_SHORT_NAME* -la -ltr | grep \naf.fasta$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_fa_unnaf_size_l$LEVEL-$sorting_type.txt

rm *naf.fasta

}


function CSV_BUILDER_NAF(){

IN_FILE="$1";
LEVEL="$2";
SORTING_ALGORITHM="$3";
SORTING_TYPE="$4";
test="$5"
  # $IN_FILE_SHORT_NAME-naf_l$LEVEL.txt
  # $IN_FILE_SHORT_NAME-naf_size_l$LEVEL.txt
  #rm data_naf.csv

  IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fasta//g')
  echo $IN_FILE_SHORT_NAME
  echo $SORTING_TYPE

if [[ $SORTING_ALGORITHM == "fasta_analysis" ]]; then  

program="NAF_$IN_FILE_SHORT_NAME-fasta_analysis"
level=$LEVEL
bytes=$(ls sort_fanalysis_$SORTING_TYPE-$IN_FILE* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-sort_fa_naf_size_l$LEVEL-$SORTING_TYPE.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-naf_size_l$LEVEL-$SORTING_TYPE.txt)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' $IN_FILE_SHORT_NAME-sort_fa_naf_l$LEVEL-$SORTING_TYPE.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_fa_naf_l$LEVEL-$SORTING_TYPE.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-sort_fa_unnaf_size_l$LEVEL-$SORTING_TYPE.txt)
d_time=$(awk 'FNR ==1 {print $2}'  $IN_FILE_SHORT_NAME-sort_fa_unnaf_l$LEVEL-$SORTING_TYPE.txt)
d_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_fa_unnaf_l$LEVEL-$SORTING_TYPE.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=$( echo $test)
#run=0

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
 

file="data_naf-$IN_FILE_SHORT_NAME-$SORTING_TYPE.csv"

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

program="NAF_$IN_FILE_SHORT_NAME-sortmf"
level=$LEVEL
bytes=$(ls sort_$IN_FILE* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-sort_naf_size_l$LEVEL-$SORTING_TYPE.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-naf_size_l$LEVEL-$SORTING_TYPE.txt)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' $IN_FILE_SHORT_NAME-sort_naf_l$LEVEL-$SORTING_TYPE.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_naf_l$LEVEL-$SORTING_TYPE.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-sort_unnaf_size_l$LEVEL-$SORTING_TYPE.txt)
d_time=$(awk 'FNR ==1 {print $2}'  $IN_FILE_SHORT_NAME-sort_unnaf_l$LEVEL-$SORTING_TYPE.txt)
d_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_unnaf_l$LEVEL-$SORTING_TYPE.txt)
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
 

file="data_naf-$IN_FILE_SHORT_NAME-$SORTING_TYPE.csv"

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

program="NAF_$IN_FILE_SHORT_NAME"
level=$LEVEL
bytes=$(ls $IN_FILE* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-naf_size_l$LEVEL.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-naf_size_l$LEVEL.txt)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' $IN_FILE_SHORT_NAME-naf_l$LEVEL.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-naf_l$LEVEL.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-unnaf_size_l$LEVEL.txt)
d_time=$(awk 'FNR ==1 {print $2}'  $IN_FILE_SHORT_NAME-unnaf_l$LEVEL.txt)
d_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-unnaf_l$LEVEL.txt)
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
 

file="data_naf-$IN_FILE_SHORT_NAME-$SORTING_TYPE.csv"

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

#!/usr/bin/env bash

#sorting_types=( "${@:2:$1}" ); shift "$(( $1 + 1 ))"
#INPUT_FILE=( "${@:2:$1}" ); shift "$(( $1 + 1 ))"
sorting_type=$1
input_file=$2

#declare -p sorting_types INPUT_FILE
#sorting_types=$1
#INPUT_FILE=$2
#n=$3
test=$3
full=$4

#for ((n=0; n<${#sorting_types[@]}; n++)); do
#NAF
 levels_array=("1" "8" "15" "22")
 program=()
if [[ $full -eq 1 ]]; then
 program=("")
else
  program=("fasta_analysis")
fi  
#levels_array=("8")
rm *.naf
m=0
#while (($m < ${#INPUT_FILE[@]} )); do
 for ((i=0; i<${#levels_array[@]}; i++)); do
    INPUT_FILE_SHORT_NAME=$(ls -1 $input_file | sed 's/.fasta//g')
    NAF_COMPRESSION $input_file ${levels_array[i]} $sorting_type ;
#INPUT_FILE_SHORT_NAME$(ls -1 synthetic.fasta | sed 's/.fasta//g')
#NAF_COMPRESSION "synthetic.fasta" ${levels_array[i]} ;
    echo "level" ${levels_array[i]} "completed"

done

#CSV_BUILDER NAF
for ((i=${#levels_array[@]}-1; i>=0; i--))
 do
   for ((j=${#program[@]}-1; j>=0; j--))
   do
      #CSV_BUILDER_NAF ${INPUT_FILE[m]} ${levels_array[i]} ${program[j]} ${sorting_types[n]} $test
      CSV_BUILDER_NAF $input_file ${levels_array[i]} ${program[j]} $sorting_type $test
     # CSV_BUILDER_NAF "synthetic.fasta" ${levels_array[i]} ${program[j]}
   done
  done

  BUILD_CSV_HEADER_1 "naf" $input_file $sorting_type
 # BUILD_CSV_HEADER_1 "naf" "synthetic.fasta" 
 #PLOT_NAF "data_naf-$INPUT_FILE_SHORT_NAME-sorted_by-${sorting_types[n]}"

 rm *naf.fasta;
 # m=$((m+1))
 # done
#done
