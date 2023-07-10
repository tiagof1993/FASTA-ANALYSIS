#testes com CVDB.fasta
# { /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=S CVDB.fasta sort_fanalysis.fasta 5 ;  } 2>>ordering_times.txt 
# { /bin/time -f "TIME\t%e\tMEM\t%M" ./a.out CVDB.fasta sort.fa ;  } 2>> sortmf_times.txt

#JARVIS3 level 1
rm *.txt

#10MB
levels_array=("1" "5" "10" "15")
partitions_array=("10MB" "100MB" "1GB")
partitions_in_mb=("10" "100" "1000")
program=("" "sortmf" "fasta_analysis")
filename=("" "sort" "sort_fa")
sequence_type=("" "Alcor")

j=0
for i in "${!levels_array[@]}"; do
j=0
 while (($j < ${#partitions_array[@]})); do
 
  #for j in "${!levels_array[@]}"; do

    { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l ${levels_array[i]} --block ${partitions_array[j]} --fasta -i CVDB.fasta ;  } 2>> cvdb_10_l1.txt
    { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l ${levels_array[i]} --block ${partitions_array[j]} --fasta -i sort.fa ;  } 2>> cvdb_sort_10_l1.txt
    { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l ${levels_array[i]} --block ${partitions_array[j]} --fasta -i sort_fanalysis.fasta ;  } 2>> cvdb_sort_fa_10_l1.txt

    { ls CVDB* -la -ltr | grep \.tar$ |awk '{print $5;}' ; } >> cvbd_size_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { ls sort.fa* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { ls sort_fanalysis* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_${partitions_in_mb[j]}_l${levels_array[i]}.txt

    { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 1 --fasta -i CVDB.fasta.tar ;  } 2>> cvdb_d_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 1 --fasta -i sort.fa.tar ;  } 2>> cvdb_d_sort_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 1 --fasta -i sort_fanalysis.fasta.tar ;  } 2>> cvdb_d_sort_fa_${partitions_in_mb[j]}_l${levels_array[i]}.txt

    { ls CVDB* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { ls sort.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { ls sort_fanalysis* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_${partitions_in_mb[j]}_l${levels_array[i]}.txt

  j=$((j+1))
 done
done


j=0

for i in "${!levels_array[@]}"; do
j=0
 while (($j < ${#partitions_array[@]})); do

    { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l ${levels_array[i]} --block ${partitions_array[j]} --fasta -i sequence_model.fasta ;  } 2>> Alcor_sequence_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l ${levels_array[i]} --block ${partitions_array[j]} --fasta -i sort_ALCOR.fa ;  } 2>> Alcor_sequence_sort_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l ${levels_array[i]} --block ${partitions_array[j]} --fasta -i sort_fanalysis_ALCOR.fasta ;  } 2>> Alcor_sequence_sort_fa_${partitions_in_mb[j]}_l${levels_array[i]}.txt

    { ls sequence_model* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { ls sort_ALCOR.fa* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_${partitions_in_mb[j]}_l${levels_array[i]}.txt

    { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 1 --fasta -i sequence_model.fasta.tar ;  } 2>> Alcor_d_sequence_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 1 --fasta -i sort_ALCOR.fa.tar ;  } 2>> Alcor_d_sequence_sort_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 1 --fasta -i sort_fanalysis_ALCOR.fasta.tar ;  } 2>> Alcor_d_sequence_sort_fa_${partitions_in_mb[j]}_l${levels_array[i]}.txt

    { ls sequence_model* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { ls sort_ALCOR.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_${partitions_in_mb[j]}_l${levels_array[i]}.txt


  j=$((j+1))
 done
done