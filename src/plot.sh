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
  partitions_array=("10MB" "100MB" "1GB" )
  program=("JARVIS3_ns" "JARVIS3_sortmf" "JARVIS3_fasta_analysis")
  sorting_method=("" "sortmf" "fasta-analysis")



  
  #  #Data filtered by partition used
     cat data.csv | grep -w "10MB" >> data_10mb.csv
     cat data.csv | grep -w "100MB" >> data_100mb.csv
  #   cat data.csv | grep -w "1GB" >> data_1gb.csv

  # #Data filtered by JARVIS3 execution level
  # # awk '{ if ($1 >> 10) { print $1 } }' numbers.txt
  # #cat data.csv |sed 's/,/\t/g' |  awk '{ print $3  }'
  #   cat data.csv | grep -w "1" | awk -F, '$2==1'  > data_level_1.csv
  #   cat data.csv | grep -w "5" | awk -F, '$2==5'  > data_level_5.csv
  #   cat data.csv | grep -w "10" | awk -F, '$2==10'  > data_level_10.csv
  #   cat data.csv | grep -w "15" | awk -F, '$2==15'  > data_level_15.csv
  #   cat data.csv | grep -w "20" | awk -F, '$2==20'  > data_level_20.csv

  #   #Data filtered by sorting method
  #   cat data.csv | grep -w "JARVIS3" > data_not_sorted.csv
  #   cat data.csv | grep -w "JARVIS3_sortmf"  > data_sortmf.csv
  #   cat data.csv | grep -w "JARVIS3_fasta_analysis"  > data_fasta_analysis.csv

  # #Data filtered both by JARVIS3 execution level and partition used
  #   cat data.csv | grep -w "1" | grep -w "10MB"| awk -F, '$2==1'  > data_level_1_10mb.csv
  #   cat data.csv | grep -w "5" | grep -w "10MB" | awk -F, '$2==5'  > data_level_5_10mb.csv
  #   cat data.csv | grep -w "10" | grep -w "10MB" | awk -F, '$2==10'  > data_level_10_10mb.csv
  #   cat data.csv | grep -w "15" | grep -w "10MB" | awk -F, '$2==15'  > data_level_15_10mb.csv
  #   cat data.csv | grep -w "20" | grep -w "10MB" | awk -F, '$2==20'  > data_level_20_10mb.csv
  #   cat data.csv | grep -w "1" | grep -w "100MB"| awk -F, '$2==1'  > data_level_1_100mb.csv
  #   cat data.csv | grep -w "5" | grep -w "100MB" | awk -F, '$2==5'  > data_level_5_100mb.csv
  #   cat data.csv | grep -w "10" | grep -w "100MB" | awk -F, '$2==10'  > data_level_10_100mb.csv
  #   cat data.csv | grep -w "15" | grep -w "100MB" | awk -F, '$2==15'  > data_level_15_100mb.csv
  #   cat data.csv | grep -w "20" | grep -w "100MB" | awk -F, '$2==20'  > data_level_20_100mb.csv
  #   cat data.csv | grep -w "1" | grep -w "1GB"| awk -F, '$2==1'  > data_level_1_1gb.csv
  #   cat data.csv | grep -w "5" | grep -w "1GB" | awk -F, '$2==5'  > data_level_5_1gb.csv
  #   cat data.csv | grep -w "10" | grep -w "1GB" | awk -F, '$2==10'  > data_level_10_1gb.csv
  #   cat data.csv | grep -w "15" | grep -w "1GB" | awk -F, '$2==15'  > data_level_15_1gb.csv
  #   cat data.csv | grep -w "20" | grep -w "1GB" | awk -F, '$2==20'  > data_level_20_1gb.csv

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

for i in "${!levels_array[@]}"; do 

  cat data.csv | grep -w ${levels_array[$i]} | grep -w "10MB" | grep -w "JARVIS3_ns" | awk -F, '$2=='${levels_array[$i]} >> data_level_${levels_array[i]}-10MB-.csv
  cat data.csv | grep -w ${levels_array[$i]} | grep -w "10MB" | grep -w "JARVIS3_sortmf" | awk -F, '$2=='${levels_array[$i]} >> data_level_${levels_array[i]}-10MB-sortmf.csv
  cat data.csv | grep -w ${levels_array[$i]} | grep -w "10MB" | grep -w "JARVIS3_fasta_analysis" | awk -F, '$2=='${levels_array[$i]} >> data_level_${levels_array[i]}-10MB-fasta-analysis.csv
  cat data.csv | grep -w ${levels_array[$i]} | grep -w "100MB" | grep -w "JARVIS3_ns" | awk -F, '$2=='${levels_array[$i]} >> data_level_${levels_array[i]}-100MB-.csv
  cat data.csv | grep -w ${levels_array[$i]} | grep -w "100MB" | grep -w "JARVIS3_sortmf" | awk -F, '$2=='${levels_array[$i]} >> data_level_${levels_array[i]}-100MB-sortmf.csv
  cat data.csv | grep -w ${levels_array[$i]} | grep -w "100MB" | grep -w "JARVIS3_fasta_analysis" | awk -F, '$2=='${levels_array[$i]} >> data_level_${levels_array[i]}-100MB-fasta-analysis.csv
  cat data.csv | grep -w ${levels_array[$i]} | grep -w "1GB" | grep -w "JARVIS3_ns" | awk -F, '$2=='${levels_array[$i]} >> data_level_${levels_array[i]}-1GB-.csv
  cat data.csv | grep -w ${levels_array[$i]} | grep -w "1GB" | grep -w "JARVIS3-sortmf" | awk -F, '$2=='${levels_array[$i]} >> data_level_${levels_array[i]}-1GB-sortmf.csv
  cat data.csv | grep -w ${levels_array[$i]} | grep -w "1GB" | grep -w "JARVIS3_fasta_analysis" | awk -F, '$2=='${levels_array[$i]} >> data_level_${levels_array[i]}-1GB-fasta-analysis.csv
done

for i in "${!levels_array[@]}"; do 
  input_file_not_sorted+=("data_level_${levels_array[i]}-10MB-.csv")
  input_file_sortmf+=("data_level_${levels_array[i]}-10MB-sortmf.csv")
  input_file_fasta_analysis+=("data_level_${levels_array[i]}-10MB-fasta-analysis.csv")
  #echo "$input_file_not_sorted[$i]\n"
done

for j in "${!input_file_not_sorted[@]}"; do
  cat ${input_file_not_sorted[$j]}  
done

  plot_file="$resultsPath/data-plot_10MB.pdf"
  title="Compression Gains using JARVIS3.sh with blocks of 10MB"

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
      set yrange [20:40]
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
      count = 1
        do for [ file_sortmf in "${input_file_sortmf[@]}"]{ 
            plot file_sortmf u 7:8 w points ls count notitle
            count=count+1
            
   }
  do for [ file_fasta_analysis in "${input_file_fasta_analysis[@]}"]{ 
    plot file_fasta_analysis u 7:8 w points ls count notitle
    count=count+1
   }

EOF
#  
#  
#     }

# 
# 
#  }
   plot_file="data-plot_l_${levels_array[i]}_${partitions_array[j]}_${sorting_method[k]}.pdf"
   input_file="data_level_${levels_array[i]}-${partitions_array[j]}-${sorting_method[k]}.csv"
   if [[ ${sorting_method[$k]} == "" ]]; then
   title="Compression Gains using level ${levels_array[i]} with blocks of ${partitions_array[j]} using JARVIS3"
   else
   title="Compression Gains using level ${levels_array[i]} with blocks of ${partitions_array[j]} \n using JARVIS3 on a file sorted by ${sorting_method[k]}"
   fi

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
      set yrange [20:40]
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
      set multiplot layout 1,1
      plot '$input_file' u 7:8 w points ls 70 notitle
EOF


    # cat data.csv | grep -w "5" | grep -w "10MB" | awk -F, '$2==5'  > data_level_5_10mb.csv
    # cat data.csv | grep -w "10" | grep -w "10MB" | awk -F, '$2==10'  > data_level_10_10mb.csv
    # cat data.csv | grep -w "15" | grep -w "10MB" | awk -F, '$2==15'  > data_level_15_10mb.csv
    # cat data.csv | grep -w "20" | grep -w "10MB" | awk -F, '$2==20'  > data_level_20_10mb.csv
    # cat data.csv | grep -w "1" | grep -w "100MB"| awk -F, '$2==1'  > data_level_1_100mb.csv
    # cat data.csv | grep -w "5" | grep -w "100MB" | awk -F, '$2==5'  > data_level_5_100mb.csv
    # cat data.csv | grep -w "10" | grep -w "100MB" | awk -F, '$2==10'  > data_level_10_100mb.csv
    # cat data.csv | grep -w "15" | grep -w "100MB" | awk -F, '$2==15'  > data_level_15_100mb.csv
    # cat data.csv | grep -w "20" | grep -w "100MB" | awk -F, '$2==20'  > data_level_20_100mb.csv
    # cat data.csv | grep -w "1" | grep -w "1GB"| awk -F, '$2==1'  > data_level_1_1gb.csv
    # cat data.csv | grep -w "5" | grep -w "1GB" | awk -F, '$2==5'  > data_level_5_1gb.csv
    # cat data.csv | grep -w "10" | grep -w "1GB" | awk -F, '$2==10'  > data_level_10_1gb.csv
    # cat data.csv | grep -w "15" | grep -w "1GB" | awk -F, '$2==15'  > data_level_15_1gb.csv
    # cat data.csv | grep -w "20" | grep -w "1GB" | awk -F, '$2==20'  > data_level_20_1gb.csv

  
 # 


    # echo -e "${plotnames//, /\\n}";

    # plots ds results and stores it in folder


# gnuplot << EOF
#       reset
#       set terminal pdfcairo enhanced color font 'Verdade,12'
#       set datafile separator "," 
#       set title "Compression Gains using partitions of 100MB"
#       set output "data-plot-ds_100MB.pdf"
#       set style line 101 lc rgb '#000000' lt 1 lw 2 
#       set border 3 front ls 101  
#       set tics nomirror out scale 0.01
#       set key fixed right top vertical Right noreverse noenhanced autotitle nobox
#       set style histogram clustered gap 1 title textcolor lt -1
#       set xtics border in scale 0,0 nomirror #rotate by -60  autojustify
#       set yrange [0:100]
#       set xrange [0:0.1]
#       set xtics auto
#       set ytics auto # set ytics auto
#       set key top right
#       set style line 1 lc rgb '#990099'  pt 1 ps 0.6  # circle
#       set style line 2 lc rgb '#004C99'  pt 2 ps 0.6  # circle
#       set style line 3 lc rgb '#CCCC00'  pt 3 ps 0.6  # circle
#       #set style line 4 lc rgb '#CC0000' lt 2 dashtype '---' lw 4 pt 5 ps 0.4 # --- red
#       set style line 4 lc rgb 'red'  pt 7 ps 0.6  # circle 
#       set style line 5 lc rgb '#009900'  pt 5 ps 0.6  # circle
#       set style line 6 lc rgb '#990000'  pt 6 ps 0.6  # circle
#       set style line 7 lc rgb '#009999'  pt 4 ps 0.6  # circle
#       set style line 8 lc rgb '#99004C'  pt 8 ps 0.6  # circle
#       set style line 9 lc rgb '#CC6600'  pt 9 ps 0.6  # circle
#       set style line 10 lc rgb '#322152' pt 10 ps 0.6  # circle    
#       set style line 11 lc rgb '#425152' pt 11 ps 0.6  # circle    
#       set grid
#       set ylabel "Gain"
#       set xlabel "Average number of bits per symbol"
#       set multiplot layout 1,1
#       plot 'data_100mb.csv' u 7:8 w points ls 14 notitle
# EOF

# gnuplot << EOF
#       reset
#       set terminal pdfcairo enhanced color font 'Verdade,12'
#       set datafile separator "," 
#       set title "Compression Gains using partitions of 1GB"
#       set output "data-plot-ds_1GB.pdf"
#       set style line 101 lc rgb '#000000' lt 1 lw 2 
#       set border 3 front ls 101
#       set tics nomirror out scale 0.01
#       set key fixed right top vertical Right noreverse noenhanced autotitle nobox
#       set style histogram clustered gap 1 title textcolor lt -1
#       set xtics border in scale 0,0 nomirror #rotate by -60  autojustify
#       set yrange [0:100]
#       set xrange [0:0.1]
#       set xtics auto
#       set ytics auto # set ytics auto
#       set key top right
#       set style line 1 lc rgb '#990099'  pt 1 ps 0.6  # circle
#       set style line 2 lc rgb '#004C99'  pt 2 ps 0.6  # circle
#       set style line 3 lc rgb '#CCCC00'  pt 3 ps 0.6  # circle
#      #set style line 4 lc rgb '#CC0000' lt 2 dashtype '---' lw 4 pt 5 ps 0.4 # --- red
#       set style line 4 lc rgb 'red'  pt 7 ps 0.6  # circle 
#       set style line 5 lc rgb '#009900'  pt 5 ps 0.6  # circle
#       set style line 6 lc rgb '#990000'  pt 6 ps 0.6  # circle
#       set style line 7 lc rgb '#009999'  pt 4 ps 0.6  # circle
#       set style line 8 lc rgb '#99004C'  pt 8 ps 0.6  # circle
#       set style line 9 lc rgb '#CC6600'  pt 9 ps 0.6  # circle
#       set style line 10 lc rgb '#322152' pt 10 ps 0.6  # circle    
#       set style line 11 lc rgb '#425152' pt 11 ps 0.6  # circle    
#       set grid
#       set ylabel "Gain"
#       set xlabel "Average number of bits per symbol"
#       set multiplot layout 1,1
#       plot 'data_1gb.csv' u 7:8 w points ls 14 notitle
# EOF
 
}
#
# === MAIN ===========================================================================
# 
# SPLIT_BENCH_RESULTS_BY_DS;
SPLIT_AND_PLOT_EACH_DS;


