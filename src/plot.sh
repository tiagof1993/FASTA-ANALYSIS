#!/bin/bash
#
#resultsPath="../results"
num_gens=0;
rmdir results
resultsPath="results";
mkdir results
instancesPath="results/all_instances"
mkdir $resultsPath/all_instances 
rm data.txt
cp data.csv data.txt
rm data_*
#
function CHECK_INPUT () {
  FILE=$1
  if [ -f "$FILE" ];
    then
    echo "Input filename: $FILE"
    else
    echo -e "\e[31mERROR: input file not found ($FILE)!\e[0m";
    exit;
    fi
  }
#
#function SPLIT_BENCH_RESULTS_BY_DS() {
#   # read the input file
#  # input_file="$resultsPath/bench-results.txt"
#   input_file="data.txt"
#   #file_prefix="$resultsPath/bench-results-"
#   file_prefix="data-"
#   #dataset_1=Dataset_CVDB
#   #dataset_2=Dataset_ALCOR
#   current_dataset="DS$i"
#   output_file=""

#   # remove datasets before recreating them
#   rm -fr data-*.csv
#    #rm -fr $Dataset_CVD.csv
#    #rm -fr $Dataset_ALCOR.csv
  
#   while IFS= read -r line
#   do
#     # check if the line contains a dataset name
#     if [[ $line == DS* ]]; then
#       # echo "$line"
#       # create a new output file for the dataset
#       dataset_name=$(echo "$line" | cut -d" " -f1)
#       dataset_name=$(echo "$dataset_name" | sed 's\,\\g' )
#       echo "Dataset: $dataset_name"
#       #dataset_name=Dataset_CVDB
#       output_file="${file_prefix}$dataset_name.csv"
#       echo $output_file
#       echo "$line" > "$output_file"
#       current_dataset=$dataset_name
#     else
#       #echo "$line" >> "data-DS1.csv"
#       echo "$line" >> "$output_file"
#     fi
#   done < "$input_file"

#   num_gens=$(($(echo "$dataset_name" | sed 's/ds//gi')))
#   echo $numgens
#}
#

function SPLIT_AND_PLOT_EACH_DS() {
  # gen_i=1;
  # while (( gen_i <= num_gens )); do

  #   # recreate ds folder
  #   rm -fr  split_ds$gen_i;
  #   mkdir -p split_ds$gen_i;

  #   CHECK_INPUT "data-DS$gen_i.csv";
  #   # create names.txt inside each ds folder; it contains all compressor names
  #   cat data-DS$gen_i.csv | awk '{ print $1} ' | sort -V | uniq > split_ds$gen_i/names_ds$gen_i.txt;
  #   CHECK_INPUT "split_ds$gen_i/names_ds$gen_i.txt";

  #   # splits ds into subdatasets by compressor and store them in folder
  #   c_i=1;
  #   plotnames="";
  #   mapfile -t INT_DATA < split_ds$gen_i/names_ds$gen_i.txt;
  #   echo ${INT_DATA[@]}
  #   for dint in "${INT_DATA[@]}"; do
  #     if [[ $dint != PROGRAM && $dint != DS* ]]; then
  #       #echo $dint
  #       grep $dint data-DS$gen_i.csv > split_ds$gen_i/data-DS$gen_i-c$c_i.csv
  #       echo "PROGRAM"
  #       tmp="'split_ds$gen_i/data-DS$gen_i-c$c_i.csv' u 6:9 w points ls $c_i notitle ";
  #       echo $tmp
  #       plotnames="$plotnames $tmp";
  #       ((++c_i));
  #     fi
  #   done


  #   (( gen_i++ ))
  # done

  levels_array=(1 5 10 15)
  partitions_array=("10mb" "100mb" "1gb" )
  program=("JARVIS3_ns" "JARVIS3_sortmf" "JARVIS3_fasta_analysis")
  sorting_method=("" "sortmf" "fasta_analysis")



  
  #  #Data filtered by partition used
     cat data.csv | grep -w "10MB" > data_10mb.csv
     cat data.csv | grep -w "100MB" > data_100mb.csv
     cat data.csv | grep -w "1GB" > data_1gb.csv

  # #Data filtered by JARVIS3 execution level
  # # awk '{ if ($1 >> 10) { print $1 } }' numbers.txt
  # #cat data.csv |sed 's/,/\t/g' |  awk '{ print $3  }'
     cat data.csv | grep -w "1" | awk -F, '$2==1'  > data_level_1.csv
     cat data.csv | grep -w "5" | awk -F, '$2==5'  > data_level_5.csv
     cat data.csv | grep -w "10" | awk -F, '$2==10'  > data_level_10.csv
     cat data.csv | grep -w "15" | awk -F, '$2==15'  > data_level_15.csv
     cat data.csv | grep -w "20" | awk -F, '$2==20'  > data_level_20.csv

     #data filtered by soting method and execution level

      #  cat data_level_1.csv  | grep -wv -e "ALCOR" > data_level_1_cvdb.csv
      #  cat data_level_5.csv  | grep -wv -e "ALCOR" > data_level_5_cvdb.csv
      #  cat data_level_10.csv | grep -wv -e "ALCOR" > data_level_10_cvdb.csv
      #  cat data_level_15.csv | grep -wv -e "ALCOR" > data_level_15_cvdb.csv
      #  cat data_level_1.csv  | grep -e "JARVIS3_ALCOR" > data_level_1_alcor.csv
      #  cat data_level_5.csv  | grep -e "JARVIS3_ALCOR" > data_level_5_alcor.csv
      #  cat data_level_10.csv | grep -e "JARVIS3_ALCOR" > data_level_10_alcor.csv
      #  cat data_level_15.csv | grep -e "JARVIS3_ALCOR" > data_level_15_alcor.csv
 
 #Level and method

    cat data_level_1.csv | grep -e "sortmf" > data_level_1_sortmf.csv
    cat data_level_5.csv | grep -e "sortmf" > data_level_5_sortmf.csv
    cat data_level_10.csv | grep -e "sortmf" > data_level_10_sortmf.csv
    cat data_level_15.csv | grep -e "sortmf" > data_level_15_sortmf.csv
    cat data_level_1.csv | grep -e "fasta_analysis" > data_level_1_fasta_analysis.csv
    cat data_level_5.csv | grep -e "fasta_analysis" > data_level_5_fasta_analysis.csv
    cat data_level_10.csv | grep -e "fasta_analysis" > data_level_10_fasta_analysis.csv
    cat data_level_15.csv | grep -e "fasta_analysis" > data_level_15_fasta_analysis.csv

 #partition and method
    cat data_10mb.csv | grep -e "sortmf" > data_10mb_sortmf.csv
    cat data_100mb.csv | grep -e "sortmf" > data_100mb_sortmf.csv
    cat data_1gb.csv | grep -e "sortmf" > data_1gb_sortmf.csv
    cat data_10mb.csv | grep -e "fasta_analysis" > data_10mb_fasta_analysis.csv
    cat data_100mb.csv | grep -e "fasta_analysis" > data_100mb_fasta_analysis.csv
    cat data_1gb.csv | grep -e "fasta_analysis" > data_1gb_fasta_analysis.csv


   #   cat data_level_1.csv | grep -w "JARVIS3_ns" | grep -w "JARVIS3_ALCOR" > data_level_1_not_sorted.csv
   #   cat data_level_5.csv | grep -w "JARVIS3_ns" | grep -w "JARVIS3_ALCOR" > data_level_5_not_sorted.csv
   #   cat data_level_10.csv | grep -w "JARVIS3_ns" | grep -w "JARVIS3_ALCOR" > data_level_10_not_sorted.csv
   #   cat data_level_15.csv | grep -w "JARVIS3_ns" | grep -w "JARVIS3_ALCOR" > data_level_15_not_sorted.csv
 
  #   #Data filtered by sorting method
     #cat data.csv | grep -e "JARVIS3" > data_not_sorted.csv
     cat data.csv | grep -e "sortmf" > data_sortmf.csv
     cat data.csv | grep -e "fasta_analysis"  > data_fasta_analysis.csv

  # #Data filtered both by JARVIS3 execution level and partition used
     cat data.csv | grep -w "1" | grep -w "10MB"| awk -F, '$2==1'  > data_level_1_10mb.csv
     cat data.csv | grep -w "5" | grep -w "10MB" | awk -F, '$2==5'  > data_level_5_10mb.csv
     cat data.csv | grep -w "10" | grep -w "10MB" | awk -F, '$2==10'  > data_level_10_10mb.csv
     cat data.csv | grep -w "15" | grep -w "10MB" | awk -F, '$2==15'  > data_level_15_10mb.csv
     cat data.csv | grep -w "1" | grep -w "100MB"| awk -F, '$2==1'  > data_level_1_100mb.csv
     cat data.csv | grep -w "5" | grep -w "100MB" | awk -F, '$2==5'  > data_level_5_100mb.csv
     cat data.csv | grep -w "10" | grep -w "100MB" | awk -F, '$2==10'  > data_level_10_100mb.csv
     cat data.csv | grep -w "15" | grep -w "100MB" | awk -F, '$2==15'  > data_level_15_100mb.csv
     cat data.csv | grep -w "1" | grep -w "1GB"| awk -F, '$2==1'  > data_level_1_1gb.csv
     cat data.csv | grep -w "5" | grep -w "1GB" | awk -F, '$2==5'  > data_level_5_1gb.csv
     cat data.csv | grep -w "10" | grep -w "1GB" | awk -F, '$2==10'  > data_level_10_1gb.csv
     cat data.csv | grep -w "15" | grep -w "1GB" | awk -F, '$2==15'  > data_level_15_1gb.csv

# title=""
# input_file_not_sorted=()
# input_file_sortmf=()
# input_file_fasta_analysis=()

# for i in "${levels_array[@]}"; do 
#     for j in "${partitions_array[@]}"; do
#       for k in "${program[@]}"; do  
# level=${levels_array[$i]}
# partition=${partitions_array[$j]}
# program=${program[$k]}
# #echo $program
# sorting=${sorting_method[$k]}
# #sorting=$(sed 's/JARVIS3//g'<<<$program)
# #echo $sorting
# #echo $(grep -w "$partition")
#     #Data filtered both by JARVIS3 execution level, partition used and sorting method
#      #      cat data.csv | grep -w ${levels_array[$i]} | grep -w ${partitions_array[$j]} | grep -w ${sorting_method[$k]} | awk -F, '$2=='$level > data_level_${levels_array[$i]}_${partitions_array[$j]}_${sorting_method[$k]}.csv
#  echo $program
#  cat data.csv | grep -w "$level" | grep -w "$partition" | grep -w "$program" | awk -F, '$2=='$level  > data_level_$level-$partition-$sorting.csv
#  # input_file_not_sorted+="data_level_${levels_array[i]}-10MB-.csv"
#   #input_file_sortmf+="data_level_${levels_array[i]}-10MB-sortmf.csv"
#   #input_file_fasta_analysis+="data_level_${levels_array[i]}-10MB-fasta-analysis.csv"
#   done
#  done
# done

# for i in "${!levels_array[@]}"; do 

#   cat data.csv | grep -w ${levels_array[$i]} | grep -w "10MB" | grep -w "JARVIS3_ns" | awk -F, '$2=='${levels_array[$i]} >> data_level_${levels_array[i]}-10MB-.csv
#   cat data.csv | grep -w ${levels_array[$i]} | grep -w "10MB" | grep -w "JARVIS3_sortmf" | awk -F, '$2=='${levels_array[$i]} >> data_level_${levels_array[i]}-10MB-sortmf.csv
#   cat data.csv | grep -w ${levels_array[$i]} | grep -w "10MB" | grep -w "JARVIS3_fasta_analysis" | awk -F, '$2=='${levels_array[$i]} >> data_level_${levels_array[i]}-10MB-fasta-analysis.csv
#   cat data.csv | grep -w ${levels_array[$i]} | grep -w "100MB" | grep -w "JARVIS3_ns" | awk -F, '$2=='${levels_array[$i]} >> data_level_${levels_array[i]}-100MB-.csv
#   cat data.csv | grep -w ${levels_array[$i]} | grep -w "100MB" | grep -w "JARVIS3_sortmf" | awk -F, '$2=='${levels_array[$i]} >> data_level_${levels_array[i]}-100MB-sortmf.csv
#   cat data.csv | grep -w ${levels_array[$i]} | grep -w "100MB" | grep -w "JARVIS3_fasta_analysis" | awk -F, '$2=='${levels_array[$i]} >> data_level_${levels_array[i]}-100MB-fasta-analysis.csv
#   cat data.csv | grep -w ${levels_array[$i]} | grep -w "1GB" | grep -w "JARVIS3_ns" | awk -F, '$2=='${levels_array[$i]} >> data_level_${levels_array[i]}-1GB-.csv
#   cat data.csv | grep -w ${levels_array[$i]} | grep -w "1GB" | grep -w "JARVIS3-sortmf" | awk -F, '$2=='${levels_array[$i]} >> data_level_${levels_array[i]}-1GB-sortmf.csv
#   cat data.csv | grep -w ${levels_array[$i]} | grep -w "1GB" | grep -w "JARVIS3_fasta_analysis" | awk -F, '$2=='${levels_array[$i]} >> data_level_${levels_array[i]}-1GB-fasta-analysis.csv
# done

#plotting results by partitions used on JARVIS3.sh
echo "$(sort -t$',' -k7 data.csv)" > "data.csv"

fasta_analysis_files=()
level_input_file=()



for i in "${!levels_array[@]}"; do 
  level_input_file+=("data_level_${levels_array[i]}.csv")
   for k in "${!sorting_method[@]}"; do
     fasta_analysis_files+=("data_level_${levels_array[i]}_fasta_analysis.csv")
done
   #echo ${level_input_file[i]}
   #cat ${level_input_file[i]}
done
#count=12
for j in "${!levels_array[@]}"; do
  for l in "${!sorting_method[@]}"; do

  plot_file="$resultsPath/data-plot_${levels_array[j]}_${sorting_method[l]}.pdf"
  #echo $plot_file
  title="Compression Gains using JARVIS3.sh with level ${levels_array[j]} and sorting method ${sorting_method[l]}"
  #input_file=${level_input_file[j]}
  
  cat ${level_input_file[j]}
  gnuplot << EOF
  #C:/gnuplot/bin/gnuplot.exe << EOF
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
        set yrange [0:40]
        set xrange [0:0.1]
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
        set xlabel "Average number of bits per symbol"
        set multiplot 
        count = 12 + $l 
        plot "data_level_${levels_array[j]}_${sorting_method[l]}.csv" u 7:8 title "data_level_${levels_array[i]}_${sorting_method[l]}.csv" with linespoints linestyle count
           
EOF
 done
done



# for i in "${!levels_array[@]}"; do 
#   level_input_file+=("data_level_${levels_array[i]}.csv")
#    for k in "${!sorting_method[@]}"; do
#      fasta_analysis_files+=("data_level_${levels_array[i]}_fasta_analysis.csv")
# done
   #echo ${level_input_file[i]}
   #cat ${level_input_file[i]}
#done
#count=12
# sorting_method_points_l1=()
# sorting_method_points_l5=()
# sorting_method_points_l10=()
# sorting_method_points_l15=()


# #echo "cat data_level_1.csv |  awk $1 "
# #sed -n -E 's/JARVIS3_ALCOR_//p'
# #Get 
# #for p in "${!levels_array[@]}"; do
#  file_lines=$(wc -l data_level_1.csv | sed 's/data_level_1.csv//g')
#  echo "$file_lines"
#  count=1
#  #s_awk=$(awk -F "\"*,\"*" '{print $1}' data_level_1.csv | awk 'FNR==2')
#  #echo $s_awk

#  while (( $count <= $file_lines )); do
#   #sorting_method_points_l1+=($(awk -F "\"*,\"*" '{print $1}' data_level_1.csv | awk 'FNR=='$count))
#   s_awk=($(awk -F "\"*,\"*" '{print $1}' data_level_1.csv | awk 'FNR=='$count))
#   #s_bps=($(awk -F "\"*,\"*" '{print $7}' data_level_1.csv | awk 'FNR=='$count))
#   sorting_method_points_l1+=( $s_awk )
#   #echo ${sorting_method_points_l1[1]}
#   count=$((count+1))
#   echo $count
#  done

#  file_lines=$(wc -l data_level_5.csv | sed 's/data_level_5.csv//g')
#  #echo "$file_lines"
#  count=0
#  while (( $count <= $file_lines )); do
#   s_awk=($(awk -F "\"*,\"*" '{print $1}' data_level_5.csv | awk 'FNR=='$count))
#   sorting_method_points_l5+=( $s_awk )
#   count=$((count+1))
#   echo $count
#  done
# #done

# file_lines=$(wc -l data_level_10.csv | sed 's/data_level_10.csv//g')
#  #echo "$file_lines"
#  count=0
#  while (( $count <= $file_lines )); do
#   s_awk=($(awk -F "\"*,\"*" '{print $1}' data_level_10.csv | awk 'FNR=='$count))
#   sorting_method_points_l10+=( $s_awk )
#   count=$((count+1))
#   echo $count
#  done

#  file_lines=$(wc -l data_level_15.csv | sed 's/data_level_15.csv//g')
#  #echo "$file_lines"
#  count=0
#  while (( $count <= $file_lines )); do
#   s_awk=($(awk -F "\"*,\"*" '{print $1}' data_level_15.csv | awk 'FNR=='$count))
#   sorting_method_points_l15+=( $s_awk )
#   count=$((count+1))
#   echo $count
#   #echo awk -F "\"*,\"*" '{print $1}' data_level_15.csv | awk 'NR==$count'
#  done

# for i in "${!sorting_method_points_l15[@]}"; do
#   echo ${sorting_method_points_l15[i]}
# done
# sorting_method_points_l1_fasta_analysis=()
# sorting_method_points_l1_sortmf=()
# sorting_method_points_l5_fasta_analysis=()
# sorting_method_points_l5_sortmf=()
# sorting_method_points_l10_fasta_analysis=()
# sorting_method_points_l10_sortmf=()
# sorting_method_points_l15_fasta_analysis=()
# sorting_method_points_l15_sortmf=()

# for j in "${!sorting_method_points_l1[@]}"; do
#  if [ ${sorting_method_points_l1[j]} == "JARVIS3_fasta_analysis" ]; then #|| [ ${sorting_method_points_l1[j]} -eq "JARVIS3_ALCOR_fasta_analysis" ]; then
#    #sorting_method_points_l1_fasta_analysis+=($(awk -F "\"*,\"*" '{print $7}' data_level_1.csv | awk 'FNR=='$count) )
#    s_awk=$(awk -F "\"*,\"*" '{print $7}' data_level_1.csv | awk 'FNR=='$count) 
#    sorting_method_points_l1_fasta_analysis+=($(echo "scale=3; $s_awk" | bc))
#  elif [ ${sorting_method_points_l1[j]} == "JARVIS3_sortmf" ]; then #|| [ ${sorting_method_points_l1[j]} -eq "JARVIS3_ALCOR_sortmf" ]; then
#    s_awk=$(awk -F "\"*,\"*" '{print $7}' data_level_1.csv | awk 'FNR=='$count) 
#    sorting_method_points_l1_sortmf+=($(echo "scale=3; $s_awk" | bc))
#  else
#   sorting_method_points_l1_fasta_analysis+=(0)
#   sorting_method_points_l1_sortmf+=(0)
#  fi
# done


# for j in "${!sorting_method_points_l5[@]}"; do
#  if [ ${sorting_method_points_l5[j]} == "JARVIS3_fasta_analysis" ]; then #|| [ ${sorting_method_points_l5[j]} -eq "JARVIS3_ALCOR_fasta_analysis" ]; then
#    #sorting_method_points_l5_fasta_analysis+=($(awk -F "\"*,\"*" '{print $7}' data_level_5.csv | awk 'FNR=='$count))
#    s_awk=$(awk -F "\"*,\"*" '{print $7}' data_level_5.csv | awk 'FNR=='$count) 
#    sorting_method_points_l5_fasta_analysis+=($(echo "scale=3; $s_awk" | bc))
#  elif [ ${sorting_method_points_l5[j]} == "JARVIS3_sortmf" ]; then #|| [ ${sorting_method_points_l5[j]} -eq "JARVIS3_ALCOR_sortmf" ]; then
#    #sorting_method_points_l5_sortmf+=($(awk -F "\"*,\"*" '{print $7}' data_level_5.csv | awk 'FNR=='$count))
#    s_awk=$(awk -F "\"*,\"*" '{print $7}' data_level_5.csv | awk 'FNR=='$count) 
#    sorting_method_points_l5_sortmf+=($(echo "scale=3; $s_awk" | bc))
#  else
#   sorting_method_points_l5_fasta_analysis+=(0)
#   sorting_method_points_l5_sortmf+=(0)  
#   #echo ${sorting_method_points_l5_fasta_analysis[2]}
#  fi
# done

# #for k in "${!sorting_method_points_l5_fasta_analysis[@]}"; do
#   #echo "$k : ${sorting_method_points_l5_fasta_analysis[k]}"
#   #echo "scale=3; ${sorting_method_points_l5_fasta_analysis[k]}" | bc
# #done

# for j in "${!sorting_method_points_l10[@]}"; do
#  if [ ${sorting_method_points_l10[j]} == "JARVIS3_fasta_analysis" ]; then #|| [ ${sorting_method_points_l10[j]} -eq "JARVIS3_ALCOR_fasta_analysis" ]; then
#    s_awk=$(awk -F "\"*,\"*" '{print $7}' data_level_10.csv | awk 'FNR=='$count) 
#    sorting_method_points_l10_fasta_analysis+=($(echo "scale=3; $s_awk" | bc))
#    #sorting_method_points_l10_fasta_analysis+=($(awk -F "\"*,\"*" '{print $7}' data_level_10.csv | awk 'FNR=='$count))
#  elif [ ${sorting_method_points_l10[j]} == "JARVIS3_sortmf" ]; then #|| [ ${sorting_method_points_l10[j]} -eq "JARVIS3_ALCOR_sortmf" ]; then
#    s_awk=$(awk -F "\"*,\"*" '{print $7}' data_level_10.csv | awk 'FNR=='$count) 
#    sorting_method_points_l10_sortmf+=($(echo "scale=3; $s_awk" | bc))
#    #sorting_method_points_l10_sortmf+=($(awk -F "\"*,\"*" '{print $7}' data_level_10.csv | awk 'FNR=='$count))
#  else
#   sorting_method_points_l10_fasta_analysis+=(0)
#   sorting_method_points_l10_sortmf+=(0)
#  fi

# done


# for j in "${!sorting_method_points_l15[@]}"; do
#  if [ ${sorting_method_points_l15[j]} == "JARVIS3_fasta_analysis" ]; then #|| [ ${sorting_method_points_l15[j]} -eq "JARVIS3_ALCOR_fasta_analysis" ]; then
#    #sorting_method_points_l15_fasta_analysis+=($(awk -F "\"*,\"*" '{print $7}' data_level_15.csv | awk 'FNR=='$count))
#    s_awk=$(awk -F "\"*,\"*" '{print $7}' data_level_15.csv | awk 'FNR=='$count) 
#    sorting_method_points_l15_fasta_analysis+=($(echo "scale=3; $s_awk" | bc))
#  elif [ ${sorting_method_points_l15[j]} == "JARVIS3_sortmf" ]; then #|| [ ${sorting_method_points_l15[j]} -eq "JARVIS3_ALCOR_sortmf" ]; then
#    #sorting_method_points_l15_sortmf+=($(awk -F "\"*,\"*" '{print $7}' data_level_15.csv | awk 'FNR=='$count))
#    s_awk=$(awk -F "\"*,\"*" '{print $7}' data_level_15.csv | awk 'FNR=='$count) 
#    sorting_method_points_l15_sortmf=($(echo "scale=3; $s_awk" | bc))
#  else
#   sorting_method_points_l15_fasta_analysis+=(0)
#   sorting_method_points_l15_sortmf+=(0)
#  fi
# done

#LEVEL_PLOTS
for j in "${!levels_array[@]}"; do
  #for l in "${!sorting_method[@]}"; do
 level=${levels_array[j]}
  plot_file="$resultsPath/data-plot_${levels_array[j]}.pdf"
  #echo $plot_file
  title="Compression Gains using JARVIS3.sh with level ${levels_array[j]}"
  
  #cat ${level_input_file[j]}
  #point=0
   #while (($point < ${#sorting_method_points_l1[@]})); do
  gnuplot << EOF
  #C:/gnuplot/bin/gnuplot.exe << EOF
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
        set yrange [0:40]
        set xrange [0:0.1]
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
        set xlabel "Average number of bits per symbol"
        set multiplot 
        count=12
        level=$level
        #point_to_plot=${sorting_method_points_l10[point]} 
        #col=1
        #'stats 'data_level_${levels_array[j]}.csv' every col nooutput'
        #value=STATS_min
        #do for [sorting_points in "${fasta_analysis_files[@]}"]{ 
         # if(strcol(1) -eq "JARVIS3_fasta_analysis"){
            #plot sorting_points u 7:8 w points ls count notitle
            plot "data_level_${levels_array[j]}_fasta_analysis.csv" u 7:8 notitle with linespoints linestyle count
            count=count + 1
            plot "data_level_${levels_array[j]}_sortmf.csv" u 7:8 title "sortmf plot" with linespoints linestyle count
            count=count + 1
         # }
          # plot "data_level_${levels_array[j]}.csv" u 7:8 title "data_level_${levels_array[j]}.csv" with linespoints linestyle 12
                        
      #}
EOF
   #point=$((point+1))
   #echo $point
 #done
done

#PARTITION plots
for j in "${!partitions_array[@]}"; do
  #for l in "${!sorting_method[@]}"; do
  partition=${partitions_array[j]}
  plot_file="$resultsPath/data-plot_p_${partitions_array[j]}.pdf"
  #echo $plot_file
  title="Compression Gains using JARVIS3.sh using ${partitions_array[j]} partitions"
  echo $partition
  #cat ${level_input_file[j]}
  #point=0
   #while (($point < ${#sorting_method_points_l1[@]})); do
  gnuplot << EOF
  #C:/gnuplot/bin/gnuplot.exe << EOF
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
        set yrange [0:40]
        set xrange [0:0.1]
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
        set xlabel "Average number of bits per symbol"
        set multiplot 
        count=12
       # level=$level
        #point_to_plot=${sorting_method_points_l10[point]} 
        #col=1
        #'stats 'data_level_${levels_array[j]}.csv' every col nooutput'
        #value=STATS_min
        #do for [sorting_points in "${fasta_analysis_files[@]}"]{ 
         # if(strcol(1) -eq "JARVIS3_fasta_analysis"){
            #plot sorting_points u 7:8 w points ls count notitle
            plot "data_${partitions_array[j]}_fasta_analysis.csv" u 7:8 notitle with linespoints linestyle count
            count=count + 1
            plot "data_${partitions_array[j]}_sortmf.csv" u 7:8 title "sortmf plot" with linespoints linestyle count
            count=count + 1
         # }
          # plot "data_level_${levels_array[j]}.csv" u 7:8 title "data_level_${levels_array[j]}.csv" with linespoints linestyle 12
                        
      #}
EOF
   #point=$((point+1))
   #echo $point
 #done
done



#PARTITION plots
for j in "${!partitions_array[@]}"; do
  #for l in "${!sorting_method[@]}"; do
  partition=${partitions_array[j]}
  plot_file="$resultsPath/data-plot_p_${partitions_array[j]}.pdf"
  #echo $plot_file
  title="Compression Gains using JARVIS3.sh using ${partitions_array[j]} partitions"
  echo $partition
  #cat ${level_input_file[j]}
  #point=0
   #while (($point < ${#sorting_method_points_l1[@]})); do
  gnuplot << EOF
  #C:/gnuplot/bin/gnuplot.exe << EOF
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
        set yrange [0:40]
        set xrange [0:0.1]
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
        set xlabel "Average number of bits per symbol"
        set multiplot 
        count=12
        plot "data_${partitions_array[j]}_fasta_analysis.csv" u 7:8 notitle with linespoints linestyle count
        count=count + 1
        plot "data_${partitions_array[j]}_sortmf.csv" u 7:8 title "sortmf plot" with linespoints linestyle count
        count=count + 1
      
EOF
   #point=$((point+1))
   #echo $point
 #done
done


#sorting method plots
for j in "${!sorting_method[@]}"; do
  #for l in "${!sorting_method[@]}"; do
  sm=${sorting_method[j]}
  plot_file="$resultsPath/data-plot_sm_${sorting_method[j]}.pdf"
  #echo $plot_file
  title="Compression Gains using JARVIS3.sh using ${sorting_method[j]} partitions"
  echo $sorting_method
  #cat ${level_input_file[j]}
  #point=0
   #while (($point < ${#sorting_method_points_l1[@]})); do
  gnuplot << EOF
  #C:/gnuplot/bin/gnuplot.exe << EOF
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
        set yrange [0:40]
        set xrange [0:0.1]
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
        set xlabel "Average number of bits per symbol"
        set multiplot 
        count=12
        plot "data_${partitions_array[j]}_fasta_analysis.csv" u 7:8 notitle with linespoints linestyle count
        count=count + 1
        plot "data_${partitions_array[j]}_sortmf.csv" u 7:8 title "sortmf plot" with linespoints linestyle count
        count=count + 1
      
EOF
   #point=$((point+1))
   #echo $point
 #done
done



}

#  else if(sorting_points=="JARVIS3_sortmf"){
#             plot "data_level_${levels_array[j]}.csv" u 7:8 title "data_level_${levels_array[j]}.csv" with linespoints linestyle 13         
#           }
#           else if(sorting_points=="JARVIS3_fasta_analysis"){
#             plot "data_level_${levels_array[j]}.csv" u 7:8 title "data_level_${levels_array[j]}.csv" with linespoints linestyle 14         
#          }

##do for [ file_fasta_analysis in "${fasta_analysis_files[@]}"]{
#count=count+1
#}     


#
# === MAIN ===========================================================================
# 
# SPLIT_BENCH_RESULTS_BY_DS;
SPLIT_AND_PLOT_EACH_DS;