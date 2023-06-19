#!/bin/bash
#
#resultsPath="../results"
num_gens=0;
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
function SPLIT_BENCH_RESULTS_BY_DS() {
  # read the input file
  #input_file="$resultsPath/bench-results.txt"
  input_file="data.csv"
  #file_prefix="$resultsPath/bench-results-"
  file_prefix="data-"
  
  current_dataset="Dataset-$i"
  output_file=""

  # remove datasets before recreating them
  rm -fr Dataset*.csv

  while IFS= read -r line
  do
    # check if the line contains a dataset name
    if [[ $line == Dataset* ]]; then
      # create a new output file for the dataset
      dataset_name=$(echo "$line" | cut -d" " -f1)
      output_file="${file_prefix}$dataset_name.csv"
      #echo "$output_file"
      echo "$line" > "$output_file"
      current_dataset=$dataset_name
    else
      # append the line to the current dataset's file
      echo "$line" >> "$output_file"
    fi
  done < "$input_file"

  num_gens=$(($(echo "$dataset_name" | sed 's/ds//gi')))
}
#
function SPLIT_AND_PLOT_EACH_DS() {
  gen_i=1;
  while (( gen_i <= num_gens )); do

    # recreate ds folder
    rm -fr split_ds$gen_i;
    mkdir -p split_ds$gen_i;

    CHECK_INPUT "data-Dataset$gen_i.csv";
    # create names.txt inside each ds folder; it contains all compressor names
    cat data-Dataset$gen_i.csv | awk '{ print $1} ' | sort -V | uniq > $resultsPath/split_ds$gen_i/names_ds$gen_i.txt;
    CHECK_INPUT "split_ds$gen_i/names_ds$gen_i.txt";

    # splits ds into subdatasets by compressor and store them in folder
    c_i=1;
    plotnames="";
    mapfile -t INT_DATA < split_ds$gen_i/names_ds$gen_i.txt;
    for dint in "${INT_DATA[@]}"; do
      if [[ $dint != PROGRAM && $dint != DS* ]]; then
        grep $dint data-Dataset$gen_i.csv > split_ds$gen_i/data-Dataset$gen_i-c$c_i.csv
        tmp="'split_ds$gen_i/data-Dataset$gen_i-c$c_i.csv' u 4:5 w points ls $c_i title '$dint', ";
        plotnames="$plotnames $tmp";
        ((++c_i));
      fi
    done

    echo -e "${plotnames//, /\\n}";

    # plots ds results and stores it in folder
    gnuplot << EOF
      reset
      set terminal pdfcairo enhanced color font 'Verdade,12'
      set output "split_ds$gen_i/data-plot-ds$gen_i.pdf"
      set style line 101 lc rgb '#000000' lt 1 lw 2 
      set border 3 front ls 101
      set tics nomirror out scale 0.01
      set key fixed right top vertical Right noreverse noenhanced autotitle nobox
      set style histogram clustered gap 1 title textcolor lt -1
      set xtics border in scale 0,0 nomirror #rotate by -60  autojustify
      set yrange [auto:auto]
      set xrange [auto:auto]
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
      set ylabel "Real time (seconds)"
      set xlabel "Average number of bits per symbol"
      plot $plotnames
EOF
    (( gen_i++ ))
  done
}
#
# === MAIN ===========================================================================
#
SPLIT_BENCH_RESULTS_BY_DS;
SPLIT_AND_PLOT_EACH_DS;
