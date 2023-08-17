

function JARVIS3_COMPRESSION(){
  IN_FILE="$1";
  LEVEL="$2";
  PARTITION="$3";
  PARTITION_MB="$4"
  # SORTING_TYPE="$5"

  IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fasta//g')
  echo $IN_FILE_SHORT_NAME
  # PARTITION_MB=$(cat $PARTITION | sed 's/MB//g')
  # if [[ $PARTITION == "1GB" ]] then
  #   PARTITION_MB="1000"
  # fi

  { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l $LEVEL --block $PARTITION --fasta -i $IN_FILE ; } 2>$IN_FILE_SHORT_NAME-$PARTITION_MB-l$LEVEL.txt
  { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l $LEVEL --block $PARTITION --fasta -i sort_$IN_FILE ; } 2>$IN_FILE_SHORT_NAME-sort_$PARTITION_MB-l$LEVEL.txt
  { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l $LEVEL --block $PARTITION --fasta -i sort_fanalysis_$IN_FILE ; } 2>$IN_FILE_SHORT_NAME-sort_fa_$PARTITION_MB-l$LEVEL.txt

  { ls $IN_FILE* -la -ltr | grep \.tar$ | awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-size_$PARTITION_MB-l$LEVEL.txt
  { ls sort_$IN_FILE* -la -ltr | grep \.tar$ | awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_size_$PARTITION_MB-l$LEVEL.txt
  { ls sort_fanalysis_$IN_FILE* -la -ltr | grep \.tar$ | awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_fa_size_$PARTITION_MB-l$LEVEL.txt

  { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l $LEVEL --fasta -i $IN_FILE.tar ;  } 2>$IN_FILE_SHORT_NAME-d_$PARTITION_MB-l$LEVEL.txt
  { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l $LEVEL --fasta -i sort_$IN_FILE.tar ;  } 2>$IN_FILE_SHORT_NAME-sort_d_$PARTITION_MB-l$LEVEL.txt
  { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l $LEVEL --fasta -i sort_fanalysis_$IN_FILE.tar ;  } 2>$IN_FILE_SHORT_NAME-sort_fa_d_$PARTITION_MB-l$LEVEL.txt

  { ls $IN_FILE* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-size_d_$PARTITION_MB-l$LEVEL.txt
  { ls sort_$IN_FILE* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_size_d_$PARTITION_MB-l$LEVEL.txt
  { ls sort_fanalysis_$IN_FILE* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_fa_size_d_$PARTITION_MB-l$LEVEL.txt

  rm *tar.out


}



function CSV_BUILDER_JARVIS3(){

  IN_FILE="$1";
  LEVEL="$2";
  PARTITION="$3";
  PARTITION_MB="$4";
  SORTING_ALGORITHM="$5";

  IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fasta//g')
  echo $IN_FILE_SHORT_NAME

if [[ $SORTING_ALGORITHM == "fasta_analysis" ]]; then  

program="JARVIS3_$INPUT_FILE_SHORT_NAME-fasta_analysis"
level=$LEVEL
partition="$PARTITION"
bytes=$(ls sort_fanalysis_$IN_FILE* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-sort_fa_size_$PARTITION_MB-l$LEVEL.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-size_$PARTITION_MB-l$LEVEL.txt)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' $IN_FILE_SHORT_NAME-sort_fa_$PARTITION_MB-l$LEVEL.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_fa_$PARTITION_MB-l$LEVEL.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-sort_fa_size_d_$PARTITION_MB-l$LEVEL.txt)
d_time=$(awk 'FNR ==1 {print $2}'  $IN_FILE_SHORT_NAME-sort_fa_d_$PARTITION_MB-l$LEVEL.txt)
d_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_fa_d_$PARTITION_MB-l$LEVEL.txt)
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
c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-sort_size_$PARTITION_MB-l$LEVEL.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-size_$PARTITION_MB-l$LEVEL.txt)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' $IN_FILE_SHORT_NAME-sort_$PARTITION_MB-l$LEVEL.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_$PARTITION_MB-l$LEVEL.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-size_d_$PARTITION_MB-l$LEVEL.txt)
d_time=$(awk 'FNR ==1 {print $2}'  $IN_FILE_SHORT_NAME-sort_d_$PARTITION_MB-l$LEVEL.txt)
d_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_d_$PARTITION_MB-l$LEVEL.txt)
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
run=0

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


function PLOT_JARVIS3(){
#rm *.csv
partitions_array=("10mb" "100mb" "1gb")
JARVIS_CSV="$1";
SORTING_TYPE="$2";


  # IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fasta//g')
  # echo $IN_FILE_SHORT_NAME
#echo "$(sort -t$',' -n -k9 $JARVIS_CSV.csv)" > "$JARVIS_CSV.csv"

#Build CSV for each partition
for ((i=0; i<${#JARVIS_CSV[@]}; i++)); do
 cat data_jarvis3-${JARVIS_CSV[i]}-$SORTING_TYPE.csv | grep -w "10MB" > ${JARVIS_CSV[i]}-$SORTING_TYPE-10mb.csv
 cat data_jarvis3-${JARVIS_CSV[i]}-$SORTING_TYPE.csv | grep -w "100MB" > ${JARVIS_CSV[i]}-$SORTING_TYPE-100mb.csv
 cat $data_jarvis3-${JARVIS_CSV[i]}-$SORTING_TYPE.csv | grep -w "1GB" > ${JARVIS_CSV[i]}-$SORTING_TYPE-1gb.csv

#Build CSV for each sorting algorithm
cat data_jarvis3-${JARVIS_CSV[i]}-$SORTING_TYPE.csv | grep -e "fasta_analysis" > ${JARVIS_CSV[i]}-$SORTING_TYPE-fasta_analysis.csv
cat data_jarvis3-${JARVIS_CSV[i]}-$SORTING_TYPE.csv | grep -e "sortmf" > ${JARVIS_CSV[i]}-$SORTING_TYPE-sortmf.csv
cat data_jarvis3-${JARVIS_CSV[i]}-$SORTING_TYPE.csv | grep -v -e "fasta_analysis" | grep -v -e "sortmf" | grep -e "JARVIS3" > ${JARVIS_CSV[i]}-$SORTING_TYPE-not_sorted.csv


#Build CSV combining partition with sorting algorithm
#JARVIS_CSV="data_jarvis3"
 cat ${JARVIS_CSV[i]}-$SORTING_TYPE-10mb.csv | grep -e "sortmf" > ${JARVIS_CSV[i]}-$SORTING_TYPE-10mb_sortmf.csv
  echo "$(sort -t$',' -n -k9 ${JARVIS_CSV[i]}-$SORTING_TYPE-10mb_sortmf.csv)" > "${JARVIS_CSV[i]}-$SORTING_TYPE-10mb_sortmf.csv"
 cat ${JARVIS_CSV[i]}-$SORTING_TYPE-100mb.csv | grep -e "sortmf" > ${JARVIS_CSV[i]}-$SORTING_TYPE-100mb_sortmf.csv
  echo "$(sort -t$',' -n -k9 ${JARVIS_CSV[i]}-$SORTING_TYPE-100mb_sortmf.csv)" > "${JARVIS_CSV[i]}-$SORTING_TYPE-100mb_sortmf.csv"
 cat ${JARVIS_CSV[i]}-$SORTING_TYPE-1gb.csv | grep -e "sortmf" > ${JARVIS_CSV[i]}-$SORTING_TYPE-1gb_sortmf.csv
  echo "$(sort -t$',' -n -k9 ${JARVIS_CSV[i]}-$SORTING_TYPE-1gb_sortmf.csv)" > "${JARVIS_CSV[i]}-$SORTING_TYPE-1gb_sortmf.csv"
 cat ${JARVIS_CSV[i]}-$SORTING_TYPE-10mb.csv | grep -e "fasta_analysis" > ${JARVIS_CSV[i]}-$SORTING_TYPE-10mb_fasta_analysis.csv
  echo "$(sort -t$',' -n -k9 ${JARVIS_CSV[i]}-$SORTING_TYPE-10mb_fasta_analysis.csv)" > "${JARVIS_CSV[i]}-$SORTING_TYPE-10mb_fasta_analysis.csv"
 cat ${JARVIS_CSV[i]}-$SORTING_TYPE-100mb.csv | grep -e "fasta_analysis" > ${JARVIS_CSV[i]}-$SORTING_TYPE-100mb_fasta_analysis.csv
   echo "$(sort -t$',' -n -k9 ${JARVIS_CSV[i]}-$SORTING_TYPE-100mb_fasta_analysis.csv)" > "${JARVIS_CSV[i]}-$SORTING_TYPE-100mb_fasta_analysis.csv"
 cat ${JARVIS_CSV[i]}-$SORTING_TYPE-1gb.csv | grep -e "fasta_analysis" > ${JARVIS_CSV[i]}-$SORTING_TYPE-1gb_fasta_analysis.csv
  echo "$(sort -t$',' -n -k9 ${JARVIS_CSV[i]}-$SORTING_TYPE-1gb_fasta_analysis.csv)" > "${JARVIS_CSV[i]}-$SORTING_TYPE-1gb_fasta_analysis.csv"

done



 for j in "${!partitions_array[@]}"; do

  #for l in "${!sorting_method[@]}"; do
  partition=${partitions_array[j]}
  plot_file="jarvis3-plot_${partitions_array[j]}-$SORTING_TYPE.pdf"
  #echo $plot_file
  title="Compression Gains using JARVIS3.sh with partition ${partitions_array[j]} sorted by $SORTING_TYPE"
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
        set yrange [-50:70]
        set xrange [80:4000]
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
        set multiplot layout 1,2
        count=12
      #  plot sorting_points u 7:8 w points ls count notitle
        plot "${JARVIS_CSV[0]}-${partitions_array[j]}-$SORTING_TYPE-fasta_analysis.csv u 9:8 title "Synthetic Data" with linespoints linestyle count
        count=count + 1
        plot "${JARVIS_CSV[1]}-${partitions_array[j]}-$SORTING_TYPE-fasta_analysis.csv" u 9:8 title "Real Data" with linespoints linestyle count
        count=count + 1
         
EOF
   #point=$((point+1))
   #echo $point
 #done
done

#done

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

sorting_types=$1
INPUT_FILE=$2
n=$3

#for ((n=0; n<${#sorting_types[@]}; n++)); do
#for ((m=0; m<${#INPUT_FILE[@]}; m++)); do
m=0
while (($m < ${#INPUT_FILE[@]} )); do
#JARVIS3

levels_array=("1" "2" "5" "8" )
#levels_array=("15" "20" "25" "30")
partitions_array=("10MB" "100MB" "1GB")
partitions_in_mb=("10" "100" "1000")
#partitions_array=("10MB")
#partitions_in_mb=("10")

rm *.tar
j=0

for ((i=0; i<${#levels_array[@]}; i++)); do
j=0
 while (($j < ${#partitions_array[@]} )); do
    JARVIS3_COMPRESSION ${INPUT_FILE[m]} ${levels_array[i]} ${partitions_array[j]} ${partitions_in_mb[j]} ;

  j=$((j+1))
 done
done

rm data_jarvis3-${INPUT_FILE[m]}-${sorting_types[n]}.csv
#CSV_BUILDER JARVIS3
for ((i=${#levels_array[@]}-1; i>=0; i--))
 do
  for ((j=${#partitions_array[@]}-1; j>=0; j--))
   do
    for ((k=${#program[@]}-1; k>=0; k--))
     do
      CSV_BUILDER_JARVIS3 ${INPUT_FILE[m]} ${levels_array[i]} ${partitions_array[j]} ${partitions_in_mb[j]} ${program[k]} ${sorting_types[n]}

     done
    done
   done

      
     BUILD_CSV_HEADER_2 "jarvis3" ${INPUT_FILE[m]} ${sorting_types[n]}
   #  PLOT_JARVIS3 "data_jarvis3-$INPUT_FILE_SHORT_NAME" $partitions_array
   m=$((m+1))
  done
#done  