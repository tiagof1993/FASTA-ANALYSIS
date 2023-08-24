
function BZIP2_COMPRESSION(){
  IN_FILE="$1";
  LEVEL="$2";
  sorting_type="$3"

  IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fasta//g')
  echo $IN_FILE_SHORT_NAME

{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -$LEVEL -f -k $IN_FILE ; } 2> $IN_FILE_SHORT_NAME-bzip2_l$LEVEL.txt  
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -$LEVEL -f -k sort_$IN_FILE ; } 2> $IN_FILE_SHORT_NAME-sort_bzip2_l$LEVEL.txt  
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -$LEVEL -f -k sort_fanalysis_$sorting_type-$IN_FILE ; } 2> $IN_FILE_SHORT_NAME-sort_fa_bzip2_l$LEVEL.txt  

mv $IN_FILE.bz2 $IN_FILE_SHORT_NAME-c_b.fasta.bz2
mv sort_$IN_FILE.bz2 sort_$IN_FILE_SHORT_NAME-c_b.fasta.bz2
mv sort_fanalysis_$sorting_type-$IN_FILE.bz2 sort_fanalysis_$sorting_type-$IN_FILE_SHORT_NAME-c_b.fasta.bz2

{ ls $IN_FILE_SHORT_NAME-c_b* -la -ltr | grep \.bz2$ |awk '{print $5;}' ; } > $IN_FILE_SHORT_NAME-bzip2_size_l$LEVEL.txt  
{ ls sort_$IN_FILE_SHORT_NAME-c_b* -la -ltr | grep \.bz2$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_bzip2_size_l$LEVEL.txt  
{ ls sort_fanalysis_$sorting_type-$IN_FILE_SHORT_NAME-c_b* -la -ltr | grep \.bz2$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_fa_bzip2_size_l$LEVEL.txt 

{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d $IN_FILE_SHORT_NAME-c_b.fasta.bz2 ; } 2>$IN_FILE_SHORT_NAME-bzip2_d_l$LEVEL.txt   
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d sort_$IN_FILE_SHORT_NAME-c_b.fasta.bz2 ; } 2>$IN_FILE_SHORT_NAME-sort_bzip2_d_l$LEVEL.txt   
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d sort_fanalysis_$sorting_type-$IN_FILE_SHORT_NAME-c_b.fasta.bz2 ; } 2>$IN_FILE_SHORT_NAME-sort_fa_bzip2_d_l$LEVEL.txt  

{ ls $IN_FILE_SHORT_NAME-c_b* -la -ltr | grep \.fasta$ |awk '{print $5;}' ; } >  $IN_FILE_SHORT_NAME-bzip2_d_size_l$LEVEL.txt 
{ ls sort_$IN_FILE_SHORT_NAME-c_b* -la -ltr | grep \.fasta$ |awk '{print $5;}'; } >  $IN_FILE_SHORT_NAME-sort_bzip2_d_size_l$LEVEL.txt 
{ ls sort_fanalysis_$sorting_type-$IN_FILE_SHORT_NAME-c_b* -la -ltr | grep \.fasta$ |awk '{print $5;}'; } >  $IN_FILE_SHORT_NAME-sort_fa_bzip2_d_size_l$LEVEL.txt 

rm *-c_b.fasta

}


function CSV_BUILDER_BZIP2(){

IN_FILE="$1";
LEVEL="$2";
SORTING_ALGORITHM="$3";
SORTING_TYPE="$4";
test="$5";

  IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fasta//g')
  echo $IN_FILE_SHORT_NAME
  # $IN_FILE_SHORT_NAME-naf_l$LEVEL.txt
  # $IN_FILE_SHORT_NAME-naf_size_l$LEVEL.txt


if [[ $SORTING_ALGORITHM == "fasta_analysis" ]]; then  

program="bzip2_$IN_FILE_SHORT_NAME-fasta_analysis"
level=$LEVEL
bytes=$(ls sort_fanalysis_$SORTING_TYPE-$IN_FILE* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-sort_fa_bzip2_size_l$LEVEL.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-bzip2_size_l$LEVEL.txt)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' $IN_FILE_SHORT_NAME-sort_fa_bzip2_l$LEVEL.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_fa_bzip2_l$LEVEL.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-sort_fa_bzip2_d_size_l$LEVEL.txt)
d_time=$(awk 'FNR ==1 {print $2}'  $IN_FILE_SHORT_NAME-sort_fa_bzip2_d_l$LEVEL.txt)
d_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_fa_bzip2_d_l$LEVEL.txt)
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
 

file="data_bzip2-$IN_FILE_SHORT_NAME-$SORTING_TYPE.csv"

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

program="bzip2_$IN_FILE_SHORT_NAME-sortmf"
level=$LEVEL
bytes=$(ls sort_$IN_FILE* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-sort_bzip2_size_l$LEVEL.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-bzip2_size_l$LEVEL.txt)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' $IN_FILE_SHORT_NAME-sort_bzip2_l$LEVEL.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_bzip2_l$LEVEL.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-sort_bzip2_d_size_l$LEVEL.txt)
d_time=$(awk 'FNR ==1 {print $2}'  $IN_FILE_SHORT_NAME-sort_bzip2_d_l$LEVEL.txt)
d_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_bzip2_d_l$LEVEL.txt)
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
 

file="data_bzip2-$IN_FILE_SHORT_NAME-$SORTING_TYPE.csv"

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

program="bzip2_$IN_FILE_SHORT_NAME"
level=$LEVEL
bytes=$(ls $IN_FILE* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-bzip2_size_l$LEVEL.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-bzip2_size_l$LEVEL.txt)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' $IN_FILE_SHORT_NAME-bzip2_l$LEVEL.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-bzip2_l$LEVEL.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-bzip2_d_size_l$LEVEL.txt)
d_time=$(awk 'FNR ==1 {print $2}'  $IN_FILE_SHORT_NAME-bzip2_d_l$LEVEL.txt)
d_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-bzip2_d_l$LEVEL.txt)
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
 

file="data_bzip2-$IN_FILE_SHORT_NAME-$SORTING_TYPE.csv"

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


 function PLOT_BZIP2(){
  #BZIP2_CSV="data_bzip2"
  BZIP2_CSV=$1
  SORTING_TYPE=$2
  # IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fasta//g')
  # echo $IN_FILE_SHORT_NAME
# echo "$(sort -t$',' -k 8 $BZIP2_CSV.csv)" > "$BZIP2_CSV.csv"

for ((i=0; i<${#BZIP2_CSV[@]}; i++)); do
#Build CSV for each sorting algorithm
cat ${BZIP2_CSV[i]}-$SORTING_TYPE.csv | grep -e "fasta_analysis" > ${BZIP2_CSV[i]}-$SORTING_TYPE-fasta_analysis.csv
echo "$(sort -t$',' -n -k 8 ${BZIP2_CSV[i]}-$SORTING_TYPE-fasta_analysis.csv)" > "${BZIP2_CSV[i]}-$SORTING_TYPE-fasta_analysis.csv"
cat ${BZIP2_CSV[i]}-$SORTING_TYPE.csv| grep -e "sortmf" > ${BZIP2_CSV[i]}-$SORTING_TYPE-sortmf.csv
echo "$(sort -t$',' -n -k 8 ${BZIP2_CSV[i]}-$SORTING_TYPE-sortmf.csv)" > "${BZIP2_CSV[i]}-$SORTING_TYPE-sortmf.csv"
cat ${BZIP2_CSV[i]}-$SORTING_TYPE.csv | grep -v -e "fasta_analysis" | grep -v -e "sortmf" > ${BZIP2_CSV[i]}-$SORTING_TYPE-not_sorted.csv
echo "$(sort -t$',' -n -k 8 ${BZIP2_CSV[i]}-$SORTING_TYPE-not_sorted.csv)" > "${BZIP2_CSV[i]}-$SORTING_TYPE-not_sorted.csv"

done

 #for j in "${!partitions_array[@]}"; do

  #for l in "${!sorting_method[@]}"; do
 # partition=${partitions_array[j]}
  plot_file="data-plot_bzip2-$SORTING_TYPE.pdf"
  #echo $plot_file
  title="Compression Gains using BZIP2 sorting by $SORTING_TYPE"
  #gain_x=$(awk -F "\"*,\"*" '{print $8}' data_level_${levels_array[j]}.csv) 
  #cat ${level_input_file[j]}
  #point=0
   #while (($point < ${#sorting_method_points_l1[@]})); do
   #C:/gnuplot/bin/gnuplot.exe << EOF
  gnuplot << EOF
        reset
        set terminal pdfcairo enhanced color font 'Verdade,12'
        set datafile separator "," 
        set title "$title"
        set output "$plot_file"
        set style line 101 lc rgb '#000000' lt 1 lw 2 
        set border 3 front ls 101
        set tics nomirror out scale 0.01
        set key fixed right top vertical Right noreverse noenhanced autotitle nobox
        set style histogram clustered gap 1 title textcolor lt -1
        set xtics border in scale 0,0 nomirror #rotate by -60  autojustify
        set yrange [10:80]
        set xrange [80:150]
        set xtics auto
        set ytics auto # set ytics auto
        set key top right
        set style line 1 lc rgb '#990099'  pt 1 ps 0.6  # circle
        set style line 2 lc rgb '#004C99'  pt 2 ps 0.6  # circle
        set style line 3 lc rgb '#CCCC00'  pt 3 ps 0.6  # circle
        #set style line 4 lc rgb '#CC0000' lt 2 dashtype '---' lw 4 pt 5 ps 0.4 # --- red
        set style line 4 lc rgb 'red'  pt 7 ps 0.6  # circle 
        set style line 5 lc rgb '#009900'  pt 5 ps 0.6  # circle
        set style line 6 lc rgb '#990000'  pt 6 ps 0.6  # circle
        set style line 7 lc rgb '#009999'  pt 4 ps 0.6  # circle
        set style line 8 lc rgb '#99004C'  pt 8 ps 0.6  # circle
        set style line 9 lc rgb '#CC6600'  pt 9 ps 0.6  # circle
        set style line 10 lc rgb '#322152' pt 10 ps 0.6  # circle    
        set style line 11 lc rgb '#425152' pt 11 ps 0.6  # circle    
        set grid
        set ylabel "Gain"
        set xlabel "Compression Time(s)"
        set multiplot
        count=12
      #  plot sorting_points u 7:8 w points ls count notitle
        plot "${BZIP2_CSV[0]}-$SORTING_TYPE-fasta_analysis.csv" u 8:7 title "Synthetic Data" with linespoints linestyle count
        count=count + 1
        plot "${BZIP2_CSV[1]}-$SORTING_TYPE-fasta_analysis.csv" u 8:7 title "Real Data" with linespoints linestyle count
        count=count + 1
         
EOF
   #point=$((point+1))
   #echo $point
 #done
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
# bzip2
levels_array=("1" "4" "7" "9")
program=("" "fasta_analysis")
# rm "data_bzip2.csv"
rm *.bz2
 #levels_array=("1")
#execution mode
for((i=0; i<${#levels_array[@]}; i++)); do

  BZIP2_COMPRESSION $INPUT_FILE ${levels_array[i]} $sorting_types;
done

#CSV_BUILDER_BZIP2
  for ((i=${#levels_array[@]}-1; i>=0; i--))
   do
   for ((j=${#program[@]}-1; j>=0; j--))
     do
      CSV_BUILDER_BZIP2 $INPUT_FILE ${levels_array[i]} ${program[j]} $sorting_types $test
   done
  done

   BUILD_CSV_HEADER_1 "bzip2" $INPUT_FILE $sorting_types
 # PLOT_BZIP2 "data_bzip2-$INPUT_FILE_SHORT_NAME"
# m=$((m+1))
# done
#done

