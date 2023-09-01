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
   #    # x=$((${#seed_arr[@]}-1))
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
read -p "Choose Installation Mode(0 [With Conda] or 1 [Manual]) : " Install_Mode
 ./Install_Tools.sh $Install_Mode
 ./Genomes_download.sh


INPUT_FILE+=($(GENERATE_ALCOR_FILE))
read -p "File to be read : " File_1
INPUT_FILE+=("$File_1")

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
m=0
 while (($m < ${#INPUT_FILE[@]} )); do
   { /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=${sorting_types[n]} ${INPUT_FILE[m]} sort_fanalysis_${sorting_types[n]}-${INPUT_FILE[m]} 5 ; } 2>>ordering_times.txt 
# #   #{  /bin/time -f "TIME\t%e\tMEM\t%M" ./sortmf ${INPUT_FILE[m]} sort_${INPUT_FILE[m]} ;  } 2>> sortmf_times.txt
    m=$((m+1))
  done
done

 #valgrind -v ennaf --strict --temp-dir tmp/ --dna --level 1 sort_fanalysis_AT-TaeRenan_refseq_v2_1.fasta


rm data_naf*
rm data_mfcompress*
rm data_jarvis3*
rm data_gzip*
rm data_lzma*
rm data_bzip2*
rm data_mbgc*

for ((n=1; n<${#sorting_types[@]}; n++)); do

test=0
m=0
 while (($m < ${#INPUT_FILE[@]} )); do
 ./compression_mfcompress.sh ${sorting_types[n]} ${INPUT_FILE[m]} $test
 m=$((m+1))
 done
./plot_mfcompress.sh ${INPUT_FILE[0]} ${INPUT_FILE[1]} ${sorting_types[n]} 

test=0
 m=0
 while (($m < ${#INPUT_FILE[@]} )); do
  ./compression_jarvis3.sh ${sorting_types[n]} ${INPUT_FILE[m]} $test
  m=$((m+1))
  done
./plot_jarvis3.sh ${INPUT_FILE[0]} ${INPUT_FILE[1]} ${sorting_types[n]} 

test=0
 m=0
 while (($m < ${#INPUT_FILE[@]} )); do
  ./compression_gzip.sh ${sorting_types[n]} ${INPUT_FILE[m]} $test
  m=$((m+1))
  done
  ./plot_gzip.sh ${INPUT_FILE[0]} ${INPUT_FILE[1]} ${sorting_types[n]} 

 test=0
 m=0
  while (($m < ${#INPUT_FILE[@]} )); do
   ./compression_lzma.sh ${sorting_types[n]} ${INPUT_FILE[m]} $test
   m=$((m+1))
   done
   ./plot_lzma.sh ${INPUT_FILE[0]} ${INPUT_FILE[1]} ${sorting_types[n]} 

 test=0
 m=0
   while (($m < ${#INPUT_FILE[@]} )); do
    ./compression_bzip2.sh ${sorting_types[n]} ${INPUT_FILE[m]} $test
    m=$((m+1))
    done
    ./plot_bzip2.sh ${INPUT_FILE[0]} ${INPUT_FILE[1]} ${sorting_types[n]} 

  test=0
  m=0
   while (($m < ${#INPUT_FILE[@]} )); do
    ./compression_mbgc.sh ${sorting_types[n]} ${INPUT_FILE[m]} $test
    m=$((m+1))
    done
   ./plot_mbgc.sh ${INPUT_FILE[0]} ${INPUT_FILE[1]} ${sorting_types[n]} 

done