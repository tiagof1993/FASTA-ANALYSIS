#Testes ALCOR
#testes com CVDB.fasta
#{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=S CVDB.fasta sort_fanalysis.fasta 5 ; } 2>>ordering_times.txt 
#{ /bin/time -f "TIME\t%e\tMEM\t%M" ./a.out CVDB.fasta sort.fa ; } 2>> sortmf_times.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 2 --block 10MB --fasta -i CVDB.fasta ; } 2>> cvdb_10.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 2 --block 10MB --fasta -i sort.fa ; } 2>> cvdb_sort_10.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 2 --block 10MB --fasta -i sort_fanalysis.fasta ; } 2>> cvdb_sort_fa_10.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 2 --block 100MB --fasta -i sequence_model.fasta ; } 2>> cvdb_100.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 2 --block 100MB --fasta -i sort.fa ; } 2>> cvdb_sort_100.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 2 --block 100MB --fasta -i sort_fanalysis.fasta ; } 2>> cvdb_sort_fa_100.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 2 --block 1GB --fasta -i sequence_model.fasta ; } 2>> cvdb_1000.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 2 --block 1GB --fasta -i sort.fa ; } 2>> cvdb_sort_1000.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 2 --block 1GB --fasta -i sort_fanalysis.fasta ; } 2>> cvdb_sort_fa_1000.txt


#testes com sequence_model.fasta
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=S sequence_model.fasta sort_fanalysis.fasta 5 ; } 2>>ordering_times.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./a.out sequence_model.fasta sort.fa ; } 2>> sortmf_times.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 2 --block 10MB --fasta -i sequence_model.fasta ; } 2>> Alcor_sequence_10.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 2 --block 10MB --fasta -i sort.fa ; } 2>> Alcor_sequence_sort_10.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 2 --block 10MB --fasta -i sort_fanalysis.fasta ; } 2>> Alcor_sequence_sort_fa_10.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 2 --block 100MB --fasta -i sequence_model.fasta ; } 2>> Alcor_sequence_100.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 2 --block 100MB --fasta -i sort.fa ; } 2>> Alcor_sequence_sort_100.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 2 --block 100MB --fasta -i sort_fanalysis.fasta ; } 2>> Alcor_sequence_sort_fa_100.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 2 --block 1GB --fasta -i sequence_model.fasta ; } 2>> Alcor_sequence_1000.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 2 --block 1GB --fasta -i sort.fa ; } 2>> Alcor_sequence_sort_1000.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 2 --block 1GB --fasta -i sort_fanalysis.fasta ; } 2>> Alcor_sequence_sort_fa_1000.txt





#ALCOR sequence generator

rm sequence_model.fasta
rm shuffled.fasta.gz
rm ordered_sequence_model_size.fasta.gz
rm ordered_sequence_model_AT.fasta.gz
rm ordered_sequence_model_CG.fasta.gz
rm ordered_shuffled_size.fasta.gz
rm ordered_shuffled_AT.fasta.gz
rm ordered_shuffled_CG.fasta.gz
rm sort_fanalysis.fasta.gz
rm sort.fa.gz
rm sequence_model.fasta.gz


read -p "Define the seed range: " SEED_RANGE
echo "The first $SEED_RANGE prime numbers  are: "
declare -a seed_arr=()

m=2
while [  ${#seed_arr[@]}  -lt $SEED_RANGE ]
do
i=2
flag=0
while [ $i -le `expr $m / 2` ]
do
if [ `expr $m % $i` -eq 0 ]
then
flag=1
break
fi
i=`expr $i + 1`
done
if [ $flag -eq 0 ]
then
#echo $m
seed_arr+=($m)
#echo ${#seed_arr[@]}  
fi
m=`expr $m + 1`
done

for((i=0;i<${#seed_arr[@]}; i++ ))
do
  echo ${seed_arr[$i]} > prime_numbers.txt
done


for x in {1..200}
do 
j=$(($x-1)) 
 size=$((1000*$x))
 #echo ${seed_arr[x]}
 seed=${seed_arr[$j]}
 #echo $seed
 echo $size
 AlcoR simulation -rs  $size:0:$seed:0:0:0 > sequence_$x.fasta
done

#for x in {0...$SEED_RANGE}
for((x=0;x<${#seed_arr[@]}; x++ ))
do
j=$(($x-1)) 
 for y in {0..1}
 do
   for z in {1..200}
   do
    size=$((1000*$z))
    #echo $size
    #seed=$(${seed_arr[x]})
    AlcoR simulation -fs 1:$size:0:${seed_arr[$j]}:0.0$y:0:0:sequence_$z.fasta >> sequence_model.fasta
        done
       done
     done
####    
sed -i '/^$/d' sequence_model.fasta  
    
