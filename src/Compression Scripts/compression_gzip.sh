
function GZIP_COMPRESSION(){
  IN_FILE="$1";
  LEVEL="$2";

  IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fasta//g')
  echo $IN_FILE_SHORT_NAME
rm $IN_FILE.gz
rm sort_$IN_FILE.gz
rm sort_fanalysis_$IN_FILE.gz
{ /bin/time -f "TIME\t%e\tMEM\t%M"  gzip -k -$LEVEL $IN_FILE; } 2>$IN_FILE_SHORT_NAME-gzip_l$LEVEL.txt  
{ /bin/time -f "TIME\t%e\tMEM\t%M"  gzip -k -$LEVEL sort_$IN_FILE; } 2>$IN_FILE_SHORT_NAME-sort_gzip_l$LEVEL.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M"  gzip -k -$LEVEL sort_fanalysis_$IN_FILE ; } 2>$IN_FILE_SHORT_NAME-sort_fa_gzip_l$LEVEL.txt

{ ls $IN_FILE* -la -ltr | grep \.gz$ |awk '{print $5;}' ; } > $IN_FILE_SHORT_NAME-gzip_size_l$LEVEL.txt  
{ ls sort_$IN_FILE* -la -ltr | grep \.gz$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_gzip_size_l$LEVEL.txt  
{ ls sort_fanalysis_$IN_FILE* -la -ltr | grep \.gz$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_fa_gzip_size_l$LEVEL.txt  

{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c $IN_FILE.gz >$IN_FILE_SHORT_NAME-gunzip.fasta ; } 2>$IN_FILE_SHORT_NAME-gunzip_l$LEVEL.txt  
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c sort_$IN_FILE.gz >sort_$IN_FILE_SHORT_NAME-gunzip.fasta ; } 2>$IN_FILE_SHORT_NAME-sort_gunzip_l$LEVEL.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c sort_fanalysis_$IN_FILE.gz >sort_fanalysis_$IN_FILE_SHORT_NAME-gunzip.fasta ; } 2>$IN_FILE_SHORT_NAME-sort_fa_gunzip_l$LEVEL.txt 

{ ls $IN_FILE_SHORT_NAME* -la -ltr | grep \unzip.fasta$ |awk '{print $5;}' ; } > $IN_FILE_SHORT_NAME-gunzip_size_l$LEVEL.txt 
{ ls sort_$IN_FILE_SHORT_NAME* -la -ltr | grep \unzip.fasta$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_gunzip_size_l$LEVEL.txt 
{ ls sort_fanalysis_$IN_FILE_SHORT_NAME* -la -ltr | grep \unzip.fasta$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_fa_gunzip_size_l$LEVEL.txt 

rm *unzip.fasta

}


function CSV_BUILDER_GZIP(){

IN_FILE="$1";
LEVEL="$2";
SORTING_ALGORITHM="$3";
SORTING_TYPE="$4";
  # $IN_FILE_SHORT_NAME-naf_l$LEVEL.txt
  # $IN_FILE_SHORT_NAME-naf_size_l$LEVEL.txt

  IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fasta//g')
  echo $IN_FILE_SHORT_NAME

if [[ $SORTING_ALGORITHM == "fasta_analysis" ]]; then  

program="gzip_$IN_FILE_SHORT_NAME-fasta_analysis"
level=$LEVEL
#bytes=$(ls sort_fanalysis_$IN_FILE_SHORT_NAME* -la -ltr | grep \.fasta$ |awk '{print $5;}')
bytes=$(ls -la sort_fanalysis_$IN_FILE_SHORT_NAME.fasta |awk '{print $5;}')
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
run=0

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
run=0

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
run=0

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


 function PLOT_GZIP(){
  #GZIP_CSV="data_gzip"
   GZIP_CSV=$1
   SORTING_TYPE=$2
  # IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fasta//g')
  # echo $IN_FILE_SHORT_NAME
#echo "$(sort -t$',' -k 8 $GZIP_CSV.csv)" > "$GZIP_CSV.csv"

for ((i=0; i<${#GZIP_CSV[@]}; i++)); do
#Build CSV for each sorting algorithm
cat ${GZIP_CSV[i]}-$SORTING_TYPE.csv | grep -e "fasta_analysis" > ${GZIP_CSV[i]}-$SORTING_TYPE-fasta_analysis.csv
echo "$(sort -t$',' -n -k 8 ${GZIP_CSV[i]}-$SORTING_TYPE-fasta_analysis.csv)" > "${GZIP_CSV[i]}-$SORTING_TYPE-fasta_analysis.csv"
cat ${GZIP_CSV[i]}-$SORTING_TYPE.csv| grep -e "sortmf" > ${GZIP_CSV[i]}-$SORTING_TYPE-sortmf.csv
echo "$(sort -t$',' -n -k 8 ${GZIP_CSV[i]}-$SORTING_TYPE-sortmf.csv)" > "${GZIP_CSV[i]}-$SORTING_TYPE-sortmf.csv"
cat ${GZIP_CSV[i]}-$SORTING_TYPE.csv | grep -v -e "fasta_analysis" | grep -v -e "sortmf" > ${GZIP_CSV[i]}-$SORTING_TYPE-not_sorted.csv
echo "$(sort -t$',' -n -k 8 ${GZIP_CSV[i]}-$SORTING_TYPE-not_sorted.csv)" > "${GZIP_CSV[i]}-$SORTING_TYPE-not_sorted.csv"
done

 #for j in "${!partitions_array[@]}"; do

  #for l in "${!sorting_method[@]}"; do
 # partition=${partitions_array[j]}
  plot_file="data-plot_gzip-$SORTING_TYPE.pdf"
  #echo $plot_file
  title="Compression Gains using GZIP using sorting by $SORTING_TYPE"
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
        set yrange [0:10]
        set xrange [0:800]
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
        plot "${GZIP_CSV[0]}-$SORTING_TYPE-fasta_analysis.csv" u 8:7 title "Synthetic Data"  with linespoints linestyle count
        count=count + 1
        plot "${GZIP_CSV[1]}-$SORTING_TYPE-fasta_analysis.csv" u 8:7 title "Real Data" with linespoints linestyle count
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

sorting_types=( "${@:2:$1}" ); shift "$(( $1 + 1 ))"
INPUT_FILE=( "${@:2:$1}" ); shift "$(( $1 + 1 ))"

declare -p sorting_types INPUT_FILE

#sorting_types=$1
#INPUT_FILE=$2
n=$3

#for ((n=0; n<${#sorting_types[@]}; n++)); do
#for ((m=0; m<${#INPUT_FILE[@]}; m++)); do
m=0
while (($m < ${#INPUT_FILE[@]} )); do
#General Use Compressors
levels_array=("1" "4" "7" "9")
#levels_array=("1")
#gzip
#rm "data_gzip.csv"
rm data_gzip-${INPUT_FILE[m]}-${sorting_types[n]}.csv
rm *.gz
#execution mode
for((i=0; i<${#levels_array[@]}; i++)); do

  GZIP_COMPRESSION ${INPUT_FILE[m]} ${levels_array[i]};
done

  #CSV_BUILDER_GZIP
   #CSV_BUILDER_GZIP
   for ((i=${#levels_array[@]}-1; i>=0; i--))
   do
   for ((j=${#program[@]}-1; j>=0; j--))
     do
      CSV_BUILDER_GZIP ${INPUT_FILE[m]} ${levels_array[i]} ${program[j]} ${sorting_types[n]}
   done
  done


BUILD_CSV_HEADER_1 "gzip" ${INPUT_FILE[m]} ${sorting_types[n]}
# PLOT_GZIP "data_gzip-$INPUT_FILE_SHORT_NAME"

#rm *unzip.fasta
  m=$((m+1))
 done
#done 

