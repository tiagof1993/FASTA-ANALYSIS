#File Generated by ALCOR 

function GENERATE_ALCOR_FILE(){
  # SEED_RANGE=$1
  # AUX_SEQ=$2
  # LOWEST_SIZE=$3
  # OUT_FILE=$4
#local OUT_FILE=""
read -p "Define the seed range: " SEED_RANGE
read -p "Define the number of auxiliary sequences used: " AUX_SEQ
#read -p "Define the increment factor to be used on sequence sizes " INCREMENT_FACTOR
#echo "The first $SEED_RANGE prime numbers  are: "
read -p "Define the lowest sequence size to be considered: " LOWEST_SIZE
read -p "Output file name: " OUT_FILE

declare -a seed_arr=()

length=0
rm $OUT_FILE


input="prime_numbers.seq"
while IFS= read -r line
do
 seed_arr+=($(echo $line))
 #length=$(($length+1))
 #echo $length
done < "$input"

#echo ${#seed_arr[@]}

 #j=$((${#seed_arr[@]}-1))
 j=$(($SEED_RANGE-1))

#for x in {1..$AUX_SEQ}
for((x=1;x<=$AUX_SEQ;x++ ))
do 
 if [ $j -eq 0 ];then
   #j=$((${#seed_arr[@]}-1))
   j=$(($SEED_RANGE-1))
   #echo "j:"$j
 else
   j=$(($j-1))
fi 
 size=$(($LOWEST_SIZE*$x))
 #size=$(($size+$INCREMENT))
 #INCREMENT=$(($INCREMENT_FACTOR*$LOWEST_SIZE))
 #echo ${seed_arr[x]}
 seed=${seed_arr[$j]}
 #echo $seed
 
 #echo $size
 AlcoR simulation -rs $size:0:$seed:0:0:0 > sequence_$x.fasta
done

#for x in {0...$SEED_RANGE}
#for((x=0;x<${#seed_arr[@]}; x++ ))
#x=$((${#seed_arr[@]}-1))
#x=$(($SEED_RANGE-1))
#j=$(($x-1)) 
#size=$(($size+$INCREMENT))
for((x=0;x<$SEED_RANGE; x++ ))
do
 for y in {0..1}
 do
   #for z in {1..$AUX_SEQ}
   for((z=1;z<=$AUX_SEQ; z++ ))
   do
   #  if [ $x -eq 0 ];then
   #    #x=$((${#seed_arr[@]}-1))
   #    x=$(($SEED_RANGE-1))
   #   else
   #    x=$(($x-1))
   #   fi 
    #size=$(($LOWEST_SIZE*$z))
    size=$(($LOWEST_SIZE*$z))
    #echo $size
    #echo $z
    seed=${seed_arr[x]}
   #if [ $size -eq $LOWEST_SIZE ] 
    #then
    AlcoR simulation -fs 1:$size:0:$seed:0.0$y:0:0:sequence_$z.fasta >> $OUT_FILE
   #else
   # if [ $z -gt $valid_z ]
    # then
    #AlcoR simulation -fs 1:$size:0:${seed_arr[$j]}:0.0$y:0:0:sequence_$z.fasta >> $OUT_FILE
    #fi
   done
  done
 done
####    
sed -i '/^$/d' $OUT_FILE  
echo $OUT_FILE
}



#--------MAIN---------------------------------------------------#

#testes com CVDB.fasta
#sorting CVDB.fasta file
INPUT_FILE=()
#while((${#INPUT_FILE[@]} < 2)); do
#INPUT_FILE+=($(GENERATE_ALCOR_FILE))
INPUT_FILE=("synthetic.fasta")
read -p "File to be read : " File_1
#read -p "File to be read : " File_2
INPUT_FILE+=("$File_1")

#for ((i=0; i<${#INPUT_FILE[@]}; i++)); do
#echo "${INPUT_FILE[0]}"
#done


#done
#INPUT_FILE=("copy2.fasta" "synth.fasta")


#INPUT_FILE_SHORT_NAME=$(ls -1 $INPUT_FILE | sed 's/.fasta//g')
#echo $INPUT_FILE_SHORT_NAME

#sorting files

#Tests performed by
#JARVIS3 
#rm *.txt
program=("" "fasta_analysis")
filename=("" "sort_fa")
sequence_type=("" "Alcor")
sorting_types=("size" "AT" "ATP" "CG" "CGP")

for ((n=0; n<${#sorting_types[@]}; n++)); do

 #for ((m=0; m<${#INPUT_FILE[@]}; m++)); do
  m=0
  while (($m < ${#INPUT_FILE[@]} )); do
   {  /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=${sorting_types[n]} ${INPUT_FILE[m]} sort_fanalysis_${INPUT_FILE[m]} 5 ;  } 2>>ordering_times.txt 
#   #{  /bin/time -f "TIME\t%e\tMEM\t%M" ./sortmf ${INPUT_FILE[m]} sort_${INPUT_FILE[m]} ;  } 2>> sortmf_times.txt
   m=$((m+1))
   done
#NAF
#./compression_naf.sh sorting_types INPUT_FILE $n
./compression_naf.sh \
  "${#sorting_types[@]}" "${sorting_types[@]}" \
  "${#INPUT_FILE[@]}" "${INPUT_FILE[@]}" \ 
    $n


#  levels_array=("1" "8" "15" "22")
# #levels_array=("8")
# rm *.naf
# m=0
# while (($m < ${#INPUT_FILE[@]} )); do
#  for ((i=0; i<${#levels_array[@]}; i++)); do
#     INPUT_FILE_SHORT_NAME=$(ls -1 ${INPUT_FILE[m]} | sed 's/.fasta//g')
#     NAF_COMPRESSION ${INPUT_FILE[m]} ${levels_array[i]} ;
# #INPUT_FILE_SHORT_NAME$(ls -1 synthetic.fasta | sed 's/.fasta//g')
# #NAF_COMPRESSION "synthetic.fasta" ${levels_array[i]} ;
#     echo "level" ${levels_array[i]} "completed"

# done

# #CSV_BUILDER NAF
# #rm data_naf-${INPUT_FILE[m]}-${sorting_types[n]}.csv
# #rm data_naf-synthetic-fasta.csv
# rm data_naf*
# for ((i=${#levels_array[@]}-1; i>=0; i--))
#  do
#    for ((j=${#program[@]}-1; j>=0; j--))
#    do
#       CSV_BUILDER_NAF ${INPUT_FILE[m]} ${levels_array[i]} ${program[j]} ${sorting_types[n]}
#      # CSV_BUILDER_NAF "synthetic.fasta" ${levels_array[i]} ${program[j]}
#    done
#   done

#   BUILD_CSV_HEADER_1 "naf" ${INPUT_FILE[m]} ${sorting_types[n]}
#  # BUILD_CSV_HEADER_1 "naf" "synthetic.fasta" 
#  #PLOT_NAF "data_naf-$INPUT_FILE_SHORT_NAME-sorted_by-${sorting_types[n]}"

#  rm *naf.fasta;
#   m=$((m+1))
#  done

#./compression_mfcompress.sh sorting_types INPUT_FILE $n
./compression_mfcompress.sh \
  "${#sorting_types[@]}" "${sorting_types[@]}" \
  "${#INPUT_FILE[@]}" "${INPUT_FILE[@]}" \ 
    $n
# #for ((m=0; m<${#INPUT_FILE[@]}; m++)); do
# m=0
# while (($m < ${#INPUT_FILE[@]} )); do
#  rm "data_mfcompress.csv"
# #MFC
#  levels_array=("1" "2" "3")
#  partitions_array=("1" "4" "8")
# rm *.mfc
# levels_array=("0")
# partitions_array=("1")
# Levels for
# for ((i=0; i<${#levels_array[@]}; i++)); do
# Partitions
#   for ((j=0; j<${#partitions_array[@]}; j++)); do
#     MFCOMPRESS_COMPRESSION ${INPUT_FILE[m]} ${levels_array[i]} ${partitions_array[j]} ;
#  done
# done 

#  CSV_BUILDER_MFCOMPRESS
# rm data_mfcompress-${INPUT_FILE[m]}-${sorting_types[n]}.csv
#   for ((i=${#levels_array[@]}-1; i>=0; i--))
#   do
#   for ((j=${#partitions_array[@]}-1; j>=0; j--))
#    do
#     for ((k=${#program[@]}-1; k>=0; k--))
#      do
#       CSV_BUILDER_MFCOMPRESS ${INPUT_FILE[m]} ${levels_array[i]} ${partitions_array[j]} ${program[k]} ${sorting_types[n]}

#      done
#     done
#    done

#    BUILD_CSV_HEADER_2 "mfcompress" ${INPUT_FILE[m]} ${sorting_types[n]}
#    PLOT_MFCOMPRESS "data_mfcompress-$INPUT_FILE_SHORT_NAME"

#   rm *mfc.d
#  m=$((m+1))
# done

./compression_jarvis3.sh \
  "${#sorting_types[@]}" "${sorting_types[@]}" \
  "${#INPUT_FILE[@]}" "${INPUT_FILE[@]}" \ 
    $n

# #for ((m=0; m<${#INPUT_FILE[@]}; m++)); do
# m=0
# while (($m < ${#INPUT_FILE[@]} )); do
# #JARVIS3

# levels_array=("1" "2" "5" "8" )
# #levels_array=("15" "20" "25" "30")
# partitions_array=("10MB" "100MB" "1GB")
# partitions_in_mb=("10" "100" "1000")
# #partitions_array=("10MB")
# #partitions_in_mb=("10")

# rm *.tar
# j=0

# for ((i=0; i<${#levels_array[@]}; i++)); do
# j=0
#  while (($j < ${#partitions_array[@]} )); do
#     JARVIS3_COMPRESSION ${INPUT_FILE[m]} ${levels_array[i]} ${partitions_array[j]} ${partitions_in_mb[j]} ;

#   j=$((j+1))
#  done
# done

# rm data_jarvis3-${INPUT_FILE[m]}-${sorting_types[n]}.csv
# #CSV_BUILDER JARVIS3
# for ((i=${#levels_array[@]}-1; i>=0; i--))
#  do
#   for ((j=${#partitions_array[@]}-1; j>=0; j--))
#    do
#     for ((k=${#program[@]}-1; k>=0; k--))
#      do
#       CSV_BUILDER_JARVIS3 ${INPUT_FILE[m]} ${levels_array[i]} ${partitions_array[j]} ${partitions_in_mb[j]} ${program[k]} ${sorting_types[n]}

#      done
#     done
#    done

      
#      BUILD_CSV_HEADER_2 "jarvis3" ${INPUT_FILE[m]} ${sorting_types[n]}
#    #  PLOT_JARVIS3 "data_jarvis3-$INPUT_FILE_SHORT_NAME" $partitions_array
#    m=$((m+1))
#   done

./compression_gzip.sh \
  "${#sorting_types[@]}" "${sorting_types[@]}" \
  "${#INPUT_FILE[@]}" "${INPUT_FILE[@]}" \ 
    $n
# #for ((m=0; m<${#INPUT_FILE[@]}; m++)); do
# m=0
# while (($m < ${#INPUT_FILE[@]} )); do
# #General Use Compressors
# levels_array=("1" "4" "7" "9")
# #levels_array=("1")
# #gzip
# #rm "data_gzip.csv"
# rm data_gzip-${INPUT_FILE[m]}-${sorting_types[n]}.csv
# rm *.gz
# #execution mode
# for((i=0; i<${#levels_array[@]}; i++)); do

#   GZIP_COMPRESSION ${INPUT_FILE[m]} ${levels_array[i]};
# done

#   #CSV_BUILDER_GZIP
#    #CSV_BUILDER_GZIP
#    for ((i=${#levels_array[@]}-1; i>=0; i--))
#    do
#    for ((j=${#program[@]}-1; j>=0; j--))
#      do
#       CSV_BUILDER_GZIP ${INPUT_FILE[m]} ${levels_array[i]} ${program[j]} ${sorting_types[n]}
#    done
#   done


# BUILD_CSV_HEADER_1 "gzip" ${INPUT_FILE[m]} ${sorting_types[n]}
# # PLOT_GZIP "data_gzip-$INPUT_FILE_SHORT_NAME"

# #rm *unzip.fasta
#   m=$((m+1))
#  done

./compression_lzma.sh \
  "${#sorting_types[@]}" "${sorting_types[@]}" \
  "${#INPUT_FILE[@]}" "${INPUT_FILE[@]}" \ 
    $n
# #for ((m=0; m<${#INPUT_FILE[@]}; m++)); do
# m=0
# while (($m < ${#INPUT_FILE[@]} )); do
# # #lzma
#  levels_array=("1" "4" "7" "9")

# rm "data_lzma.csv"
# rm *.lzma
# #levels_array=("1")
# #program=("" "sortmf" "fasta_analysis")
# #execution mode
# for((i=0; i<${#levels_array[@]}; i++)); do

#   LZMA_COMPRESSION ${INPUT_FILE[m]} ${levels_array[i]};
# done

#   #CSV_BUILDER_LZMA
#    for ((i=${#levels_array[@]}-1; i>=0; i--))
#    do
#    for ((j=${#program[@]}-1; j>=0; j--))
#      do
#       CSV_BUILDER_LZMA ${INPUT_FILE[m]} ${levels_array[i]} ${program[j]} ${sorting_types[n]}
#    done
#   done

#   BUILD_CSV_HEADER_1 "lzma" ${INPUT_FILE[m]} ${sorting_types[n]}
#  # PLOT_LZMA "data_lzma-$INPUT_FILE_SHORT_NAME"
# m=$((m+1))
# done

./compression_bzip2.sh \
  "${#sorting_types[@]}" "${sorting_types[@]}" \
  "${#INPUT_FILE[@]}" "${INPUT_FILE[@]}" \ 
    $n
# #for ((m=0; m<${#INPUT_FILE[@]}; m++)); do
# m=0
# while (($m < ${#INPUT_FILE[@]} )); do
# # bzip2
# levels_array=("1" "4" "7" "9")
# rm "data_bzip2.csv"
# rm *.bz2
#  #levels_array=("1")
# #execution mode
# for((i=0; i<${#levels_array[@]}; i++)); do

#   BZIP2_COMPRESSION ${INPUT_FILE[m]} ${levels_array[i]};
# done

# #CSV_BUILDER_BZIP2
#   for ((i=${#levels_array[@]}-1; i>=0; i--))
#    do
#    for ((j=${#program[@]}-1; j>=0; j--))
#      do
#       CSV_BUILDER_BZIP2 ${INPUT_FILE[m]} ${levels_array[i]} ${program[j]} ${sorting_types[n]}
#    done
#   done

#    BUILD_CSV_HEADER_1 "bzip2" ${INPUT_FILE[m]} ${sorting_types[n]}
#  # PLOT_BZIP2 "data_bzip2-$INPUT_FILE_SHORT_NAME"
# m=$((m+1))
# done

./compression_mbgc.sh \
  "${#sorting_types[@]}" "${sorting_types[@]}" \
  "${#INPUT_FILE[@]}" "${INPUT_FILE[@]}" \ 
    $n
# #for ((m=0; m<${#INPUT_FILE[@]}; m++)); do
# m=0
# while (($m < ${#INPUT_FILE[@]} )); do

#    # #MBGC
# levels_array=("0" "1" "2" "3")
# #levels_array=("0")

# rm data_mbgc.csv
#  rm *.mbgc

#  for ((i=0; i<${#levels_array[@]}; i++)); do
#   MBGC_COMPRESSION ${INPUT_FILE[m]} ${levels_array[i]};
#  done

# #CSV_BUILDER_MBGC
#   for ((i=${#levels_array[@]}-1; i>=0; i--))
#   do
#    for ((j=${#program[@]}-1; j>=0; j--))
#      do
#       CSV_BUILDER_MBGC ${INPUT_FILE[m]} ${levels_array[i]} ${program[j]} ${sorting_types[n]}
#    done
#   done


# BUILD_CSV_HEADER_1 "mbgc" ${INPUT_FILE[m]} ${sorting_types[n]}
 # PLOT_MBGC "data_mbgc-$INPUT_FILE_SHORT_NAME"

# rm -d mbgc_decompress_*
# rm -d sort_mbgc_decompress_*
# rm -d sort_fa_mbgc_decompress_*
# m=$((m+1))
# done
 done

#   # PLOT CREATION

#      PLOT_NAF $INPUT_FILE ${sorting_types[n]}
#      PLOT_MBGC $INPUT_FILE ${sorting_types[n]}
#      PLOT_MFCOMPRESS $INPUT_FILE ${sorting_types[n]}
#      PLOT_GZIP $INPUT_FILE ${sorting_types[n]}
#      PLOT_LZMA $INPUT_FILE ${sorting_types[n]}
#      PLOT_BZIP2 $INPUT_FILE ${sorting_types[n]}
#      PLOT_JARVIS3 $INPUT_FILE ${sorting_types[n]}
     

# done
#     #  mail -s " Att test" data_naf.csv tiagorfonseca@ua.pt 

#     #  mutt -s "Subject" -a data_naf.csv -- tiagorfonseca@ua.pt < test-sort_fa_gunzip_l1.txt
# #rm data.csv


#   # IN_FILE="$1";
#   # LEVEL="$2";
#   # PARTITION="$3";
#   # PARTITION_MB="$4";
#   # SORTING_ALGORITHM="$5";
