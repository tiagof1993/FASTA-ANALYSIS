#testes com CVDB.fasta
#sorting CVDB.fasta file
{  /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=S CVDB.fasta sort_fanalysis.fasta 5 ;  } 2>>ordering_times.txt 
{  /bin/time -f "TIME\t%e\tMEM\t%M" ./a.out CVDB.fasta sort.fa ;  } 2>> sortmf_times.txt

#Tests performed by
#JARVIS3 
#rm *.txt

levels_array=("1" "5" "10" "15")
partitions_array=("10MB" "100MB" "1GB")
partitions_in_mb=("10" "100" "1000")
program=("" "sortmf" "fasta_analysis")
filename=("" "sort" "sort_fa")
sequence_type=("" "Alcor")

j=0
#for i in "${!levels_array[@]}"; do
for ((i=0; i<${#levels_array[@]}; i++)); do
j=0
 while (($j < ${#partitions_array[@]})); do
 
  #for j in "${!levels_array[@]}"; do

    { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l ${levels_array[i]} --block ${partitions_array[j]} --fasta -i CVDB.fasta ;  } 2>> cvdb_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l ${levels_array[i]} --block ${partitions_array[j]} --fasta -i sort.fa ;  } 2>> cvdb_sort_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l ${levels_array[i]} --block ${partitions_array[j]} --fasta -i sort_fanalysis.fasta ;  } 2>> cvdb_sort_fa_${partitions_in_mb[j]}_l${levels_array[i]}.txt

    { ls CVDB* -la -ltr | grep \.tar$ |awk '{print $5;}' ; } >> cvbd_size_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { ls sort.fa* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { ls sort_fanalysis* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_${partitions_in_mb[j]}_l${levels_array[i]}.txt

    { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l ${levels_array[i]} --fasta -i CVDB.fasta.tar ;  } 2>> cvdb_d_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l ${levels_array[i]} --fasta -i sort.fa.tar ;  } 2>> cvdb_d_sort_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l ${levels_array[i]} --fasta -i sort_fanalysis.fasta.tar ;  } 2>> cvdb_d_sort_fa_${partitions_in_mb[j]}_l${levels_array[i]}.txt

    { ls CVDB* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { ls sort.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { ls sort_fanalysis* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_${partitions_in_mb[j]}_l${levels_array[i]}.txt

  j=$((j+1))
 done
done


#NAF
{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level 22 CVDB.fasta ; } 2>>naf_cvdb.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level 22 sort.fa ; } 2>>naf_cvdb_sort.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level 22 sort_fanalysis.fasta ; } 2>>naf_cvdb_sort_fa.txt

{ ls CVDB* -la -ltr | grep \.naf$ |awk '{print $5;}' ; } >> naf_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \.naf$ |awk '{print $5;}'; } >> naf_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.naf$ |awk '{print $5;}'; } >> naf_sort_fa_cvdb_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf  CVDB.fasta.naf -o CVDB_naf.fasta ; } 2>>unnaf_cvdb.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf  sort.fa.naf -o sort_naf.fa ; } 2>>unnaf_sort.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf  sort.fa.naf -o sort_naf.fasta ; } 2>>unnaf_sort_fa.txt

{ ls CVDB* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}' ; } >> unnaf_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \._naf.fa$ |awk '{print $5;}'; } >> unnaf_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}'; } >> unnaf_sort_fa_cvdb_size.txt


#MBGC
{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -i CVDB.fasta CVDB.mbgc ; } 2>>mbgc_cvdb.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -i sort.fa sort.fa.mbgc ; } 2>>mbgc_sort_cvdb.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -i sort_fanalysis.fasta sort_fanalysis.mbgc ; } 2>>mbgc_sort_fa_cvdb.txt

{ ls CVDB* -la -ltr | grep \.mbgc$ |awk '{print $5;}' ; } >> mbgc_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \.mbgc$ |awk '{print $5;}'; } >> mbgc_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mbgc$ |awk '{print $5;}'; } >> mbgc_sort_fa_cvdb_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -i CVDB.fasta CVDB.mbgc ; } 2>>mbgc_d_cvdb.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -i sort.fa sort.fa.mbgc ; } 2>>mbgc_d_sort_cvdb_size.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -i sort_fanalysis.fasta sort_fanalysis.mbgc ; } 2>>mbgc_d_sort_fa_cvdb_size.txt

{ ls CVDB* -la -ltr | grep \.mbgc.fasta$ |awk '{print $5;}' ; } >> mbgc_d_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \.mbgc.fasta$ |awk '{print $5;}'; } >> mbgc_d_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mbgc.fasta$ |awk '{print $5;}'; } >> mbgc_d_sort_fa_cvdb_size.txt

#{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level 22 sort.fa ; } 2>>naf_cvdb_sort.txt
#{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level 22 sort_fanalysis.fasta ; } 2>>naf_cvdb_sort_fa.txt

#MFC
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -1 -p 1 -t 8 CVDB.fasta ; } 2>>mfc_cvdb_level1_p1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -1 -p 1 -t 8 sort.fa ; } 2>>mfc_sort_cvdb_level1_p1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -1 -p 1 -t 8 sort_fanalysis.fasta ; } 2>>mfc_sort_fa_cvdb_level1_p1.txt 

{ ls CVDB* -la -ltr | grep \.mfc$ |awk '{print $5;}' ; } >> mfc_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \.mfc$ |awk '{print $5;}'; } >> mfc_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mfc$ |awk '{print $5;}'; } >> mfc_sort_fa_cvdb_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -1 -p 1 -t 8 CVDB.fasta ; } 2>>mfc_d_cvdb_level1_p1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -1 -p 1 -t 8 sort.fa ; } 2>>mfc_d_sort_cvdb_level1_p1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -1 -p 1 -t 8 sort_fanalysis.fasta ; } 2>>mfc_d_sort_fa_cvdb_level1_p1.txt 

{ ls CVDB* -la -ltr | grep \.mfc.d$ |awk '{print $5;}' ; } >> mfc_d_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \.mfc.d$ |awk '{print $5;}'; } >> mfc_d_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mfc.d$ |awk '{print $5;}'; } >> mfc_d_sort_fa_cvdb_size.txt


{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -2 -p 1 -t 8 CVDB.fasta ; } 2>>mfc_cvdb_level2_p1.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -2 -p 1 -t 8 sort.fa ; } 2>>mfc_sort_cvdb_level2_p1.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -2 -p 1 -t 8 sort_fanalysis.fasta ; } 2>>mfc_sort_fa_cvdb_level2_p1.txt

{ ls CVDB* -la -ltr | grep \.mfc$ |awk '{print $5;}' ; } >> mfc_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \.mfc$ |awk '{print $5;}'; } >> mfc_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mfc$ |awk '{print $5;}'; } >> mfc_sort_fa_cvdb_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -2 -p 1 -t 8 CVDB.fasta ; } 2>>mfc_d_cvdb_level2_p1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -2 -p 1 -t 8 sort.fa ; } 2>>mfc_d_sort_cvdb_level2_p1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -2 -p 1 -t 8 sort_fanalysis.fasta ; } 2>>mfc_d_sort_fa_cvdb_level2_p1.txt 

{ ls CVDB* -la -ltr | grep \.mfc.d$ |awk '{print $5;}' ; } >> mfc_d_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \.mfc.d$ |awk '{print $5;}'; } >> mfc_d_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mfc.d$ |awk '{print $5;}'; } >> mfc_d_sort_fa_cvdb_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 1 -t 8 CVDB.fasta ; } 2>>mfc_cvdb_level3_p1.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 1 -t 8 sort.fa ; } 2>>mfc_sort_cvdb_level3_p1.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 1 -t 8 sort_fanalysis.fasta ; } 2>>mfc_sort_fa_cvdb_level3_p1.txt

{ ls CVDB* -la -ltr | grep \.mfc$ |awk '{print $5;}' ; } >> mfc_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \.mfc$ |awk '{print $5;}'; } >> mfc_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mfc$ |awk '{print $5;}'; } >> mfc_sort_fa_cvdb_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 1 -t 8 CVDB.fasta ; } 2>>mfc_d_cvdb_level3_p1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 1 -t 8 sort.fa ; } 2>>mfc_d_sort_cvdb_level3_p1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 1 -t 8 sort_fanalysis.fasta ; } 2>>mfc_d_sort_fa_cvdb_level3_p1.txt 

{ ls CVDB* -la -ltr | grep \.mfc.d$ |awk '{print $5;}' ; } >> mfc_d_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \.mfc.d$ |awk '{print $5;}'; } >> mfc_d_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mfc.d$ |awk '{print $5;}'; } >> mfc_d_sort_fa_cvdb_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -1 -p 8 -t 8 CVDB.fasta ; } 2>>mfc_cvdb_level1_p8.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -1 -p 8 -t 8 sort.fa ; } 2>>mfc_sort_cvdb_level1_p8.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -1 -p 8 -t 8 sort_fanalysis.fasta ; } 2>>mfc_sort_fa_cvdb_level1_p8.txt

{ ls CVDB* -la -ltr | grep \.mfc$ |awk '{print $5;}' ; } >> mfc_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \.mfc$ |awk '{print $5;}'; } >> mfc_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mfc$ |awk '{print $5;}'; } >> mfc_sort_fa_cvdb_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -1 -p 8 -t 8 CVDB.fasta ; } 2>>mfc_d_cvdb_level1_p8.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -1 -p 8 -t 8 sort.fa ; } 2>>mfc_d_sort_cvdb_level1_p8.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -1 -p 8 -t 8 sort_fanalysis.fasta ; } 2>>mfc_d_sort_fa_cvdb_level1_p8.txt 

{ ls CVDB* -la -ltr | grep \.mfc.d$ |awk '{print $5;}' ; } >> mfc_d_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \.mfc.d$ |awk '{print $5;}'; } >> mfc_d_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mfc.d$ |awk '{print $5;}'; } >> mfc_d_sort_fa_cvdb_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -2 -p 8 -t 8 CVDB.fasta ; } 2>>mfc_cvdb_level2_p8.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -2 -p 8 -t 8 sort.fa ; } 2>>mfc_sort_cvdb_level2_p8.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -2 -p 8 -t 8 sort_fanalysis.fasta ; } 2>>mfc_sort_fa_cvdb_level2_p8.txt

{ ls CVDB* -la -ltr | grep \.mfc$ |awk '{print $5;}' ; } >> mfc_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \.mfc$ |awk '{print $5;}'; } >> mfc_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mfc$ |awk '{print $5;}'; } >> mfc_sort_fa_cvdb_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -2 -p 8 -t 8 CVDB.fasta ; } 2>>mfc_d_cvdb_level2_p8.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -2 -p 8 -t 8 sort.fa ; } 2>>mfc_d_sort_cvdb_level2_p8.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -2 -p 8 -t 8 sort_fanalysis.fasta ; } 2>>mfc_d_sort_fa_cvdb_level2_p8.txt 

{ ls CVDB* -la -ltr | grep \.mfc.d$ |awk '{print $5;}' ; } >> mfc_d_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \.mfc.d$ |awk '{print $5;}'; } >> mfc_d_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mfc.d$ |awk '{print $5;}'; } >> mfc_d_sort_fa_cvdb_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 8 -t 8 CVDB.fasta ; } 2>>mfc_cvdb_level3_p8.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 8 -t 8 sort.fa ; } 2>>mfc_sort_cvdb_level3_p8.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 8 -t 8 sort_fanalysis.fasta ; } 2>>mfc_sort_fa_cvdb_level3_p8.txt

{ ls CVDB* -la -ltr | grep \.mfc$ |awk '{print $5;}' ; } >> mfc_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \.mfc$ |awk '{print $5;}'; } >> mfc_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mfc$ |awk '{print $5;}'; } >> mfc_sort_fa_cvdb_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 8 -t 8 CVDB.fasta ; } 2>>mfc_d_cvdb_level3_p8.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 8 -t 8 sort.fa ; } 2>>mfc_d_sort_cvdb_level3_p8.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 8 -t 8 sort_fanalysis.fasta ; } 2>>mfc_d_sort_fa_cvdb_level3_p8.txt 

{ ls CVDB* -la -ltr | grep \.mfc.d$ |awk '{print $5;}' ; } >> mfc_d_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \.mfc.d$ |awk '{print $5;}'; } >> mfc_d_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mfc.d$ |awk '{print $5;}'; } >> mfc_d_sort_fa_cvdb_size.txt

#General Use Compressors

#gzip
{ /bin/time -f "TIME\t%e\tMEM\t%M"  gzip -k -1 CVDB.fasta y ; } 2>>gzip_cvdb_level1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M"  gzip -k -1 sort.fa y ; } 2>>gzip_sort_cvdb_level1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M"  gzip -k -1 sort_fanalysis.fasta y ; } 2>>gzip_sort_fa_cvdb_level1.txt 

{ ls CVDB* -la -ltr | grep \.gz$ |awk '{print $5;}' ; } >> gzip_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \.gz$ |awk '{print $5;}'; } >> gzip_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.gz$ |awk '{print $5;}'; } >> gzip_sort_fa_cvdb_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c sort.fa.gz >sort_gz.fa ; } 2>>gunzip_cvdb_level1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c sort.fa.gz >sort_gz.fa ; } 2>>gunzip_sort_cvdb_level1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c sort.fa.gz >sort_gz.fa ; } 2>>gunzip_sort_fa_cvdb_level1.txt 

{ ls CVDB* -la -ltr | grep \_gz.fasta$ |awk '{print $5;}' ; } >> gunzip_d_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \_gz.fasta$ |awk '{print $5;}'; } >> gunzip_d_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \_gz.fasta$ |awk '{print $5;}'; } >> gunzip_d_sort_fa_cvdb_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M"  gzip -k -9 CVDB.fasta y ; } 2>>gzip_level9.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M"  gzip -k -9 sort.fa y ; } 2>>gzip_level9.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M"  gzip -k -9 sort_fanalysis.fasta y ; } 2>>gzip_level9.txt 

{ ls CVDB* -la -ltr | grep \.gz$ |awk '{print $5;}' ; } >> gzip_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \.gz$ |awk '{print $5;}'; } >> gzip_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.gz$ |awk '{print $5;}'; } >> gzip_sort_fa_cvdb_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c sort.fa.gz >sort_gz.fa ; } 2>>gunzip_cvdb_level9.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c sort.fa.gz >sort_gz.fa ; } 2>>gunzip_sort_cvdb_level9.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c sort.fa.gz >sort_gz.fa ; } 2>>gunzip_sort_fa_cvdb_level9.txt 

{ ls CVDB* -la -ltr | grep \_gz.fasta$ |awk '{print $5;}' ; } >> gunzip_d_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \_gz.fasta$ |awk '{print $5;}'; } >> gunzip_d_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \_gz.fasta$ |awk '{print $5;}'; } >> gunzip_d_sort_fa_cvdb_size.txt


#lzma
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -1 -f -k CVDB.fasta ; } 2>> lzma_cvdb_level1.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -1 -f -k sort.fa ; } 2>> lzma_cvdb_sort_level1.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -1 -f -k sort_fanalysis.fasta ; } 2>> lzma_cvdb_sort_fa_level1.txt;

{ ls CVDB* -la -ltr | grep \.lzma$ |awk '{print $5;}' ; } >> lzma_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \.lzma$ |awk '{print $5;}'; } >> lzma_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.lzma$ |awk '{print $5;}'; } >> lzma_sort_fa_cvdb_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  CVDB.fasta.lzma ; } 2>>lzma_d_cvdb_level1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d sort.fa.lzma ; } 2>>lzma_d_sort_cvdb_level1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d sort_fanalysis.fasta.lzma ; } 2>>lzma_d_sort_fa_cvdb_level1.txt 

{ ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}' ; } >> lzma_d_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \.fasta$ |awk '{print $5;}'; } >> _d_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.fasta$ |awk '{print $5;}'; } >> gunzip_d_sort_fa_cvdb_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k CVDB.fasta ; } 2>> lzma_cvdb_level9.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k sort.fa ; } 2>> lzma_cvdb_sort_level9.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k sort_fanalysis.fasta ; } 2>> lzma_cvdb_sort_fa_level9.txt;

{ ls CVDB* -la -ltr | grep \.lzma$ |awk '{print $5;}' ; } >> lzma_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \.lzma$ |awk '{print $5;}'; } >> lzma_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.lzma$ |awk '{print $5;}'; } >> lzma_sort_fa_cvdb_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d CVDB.fasta ; } 2>>lzma_d_cvdb_level9.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d sort.fa ; } 2>>lzma_d_sort_cvdb_level9.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d sort_fanalysis.fasta ; } 2>>lzma_d_sort_fa_cvdb_level9.txt 

{ ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}' ; } >> lzma_d_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \.fasta$ |awk '{print $5;}'; } >> lzma_d_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.fasta$ |awk '{print $5;}'; } >> lzma_d_sort_fa_cvdb_size.txt


#bzip2
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -1 -f -k CVDB.fasta ; } 2>> bzip2_cvdb_level1.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -1 -f -k sort.fa ; } 2>> bzip2_cvdb_sort_level1.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -1 -f -k sort_fanalysis.fasta ; } 2>> bzip2_cvdb_sort_fa_level1.txt;

{ ls CVDB* -la -ltr | grep \.bz2$ |awk '{print $5;}' ; } >> bzip2_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \.bz2$ |awk '{print $5;}'; } >> bzip2_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.bz2$ |awk '{print $5;}'; } >> bzip2_sort_fa_cvdb_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d CVDB.fasta ; } 2>>bzip2_d_cvdb_level1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d sort.fa ; } 2>>bzip2_d_sort_cvdb_level1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d sort_fanalysis.fasta ; } 2>>bzip2_d_sort_fa_cvdb_level1.txt 

{ ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}' ; } >> bzip2_d_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \.fasta$ |awk '{print $5;}'; } >> bzip2_d_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.fasta$ |awk '{print $5;}'; } >> bzip2_d_sort_fa_cvdb_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -9 -f -k CVDB.fasta ; } 2>> bzip2_cvdb_level9.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -9 -f -k sort.fa ; } 2>> bzip2_cvdb_sort_level9.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -9 -f -k sort_fanalysis.fasta ; } 2>> bzip2_cvdb_sort_fa_level9.txt;

{ ls CVDB* -la -ltr | grep \.bz2$ |awk '{print $5;}' ; } >> bzip2_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \.bz2$ |awk '{print $5;}'; } >> bzip2_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.bz2$ |awk '{print $5;}'; } >> bzip2_sort_fa_cvdb_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d CVDB.fasta ; } 2>>bzip2_d_cvdb_level9.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d sort.fa ; } 2>>bzip2_d_sort_cvdb_level9.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d sort_fanalysis.fasta ; } 2>>bzip2_d_sort_fa_cvdb_level9.txt 

{ ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}' ; } >> bzip2_d_cvdb_size.txt
{ ls sort.fa* -la -ltr | grep \.fasta$ |awk '{print $5;}'; } >> bzip2_d_sort_cvdb_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.fasta$ |awk '{print $5;}'; } >> bzip2_d_sort_fa_cvdb_size.txt

#sorting sequence_model.fasta
{  /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=S sequence_model.fasta sort_fanalysis.fasta 5 ;  } 2>>ordering_times.txt 
{  /bin/time -f "TIME\t%e\tMEM\t%M" ./a.out sequence_model.fasta sort.fa ;  } 2>> sortmf_times.txt
j=0

#for i in "${!levels_array[@]}"; do
for ((i=0; i<${#levels_array[@]}; i++)); do
j=0
 while (($j < ${#partitions_array[@]})); do

    { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l ${levels_array[i]} --block ${partitions_array[j]} --fasta -i sequence_model.fasta ;  } 2>> Alcor_sequence_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l ${levels_array[i]} --block ${partitions_array[j]} --fasta -i sort_ALCOR.fa ;  } 2>> Alcor_sequence_sort_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l ${levels_array[i]} --block ${partitions_array[j]} --fasta -i sort_fanalysis_ALCOR.fasta ;  } 2>> Alcor_sequence_sort_fa_${partitions_in_mb[j]}_l${levels_array[i]}.txt

    { ls sequence_model* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { ls sort_ALCOR.fa* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_${partitions_in_mb[j]}_l${levels_array[i]}.txt

    { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l ${levels_array[i]} --fasta -i sequence_model.fasta.tar ;  } 2>> Alcor_d_sequence_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l ${levels_array[i]} --fasta -i sort_ALCOR.fa.tar ;  } 2>> Alcor_d_sequence_sort_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l ${levels_array[i]} --fasta -i sort_fanalysis_ALCOR.fasta.tar ;  } 2>> Alcor_d_sequence_sort_fa_${partitions_in_mb[j]}_l${levels_array[i]}.txt

    { ls sequence_model* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { ls sort_ALCOR.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_${partitions_in_mb[j]}_l${levels_array[i]}.txt
    { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_${partitions_in_mb[j]}_l${levels_array[i]}.txt


  j=$((j+1))
 done
done

#NAF
{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level 22 sequence_model.fasta ; } 2>>naf_cvdb.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level 22 sort.fa ; } 2>>naf_ALCOR_sort.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level 22 sort_fanalysis.fasta ; } 2>>naf_ALCOR_sort_fa.txt

{ ls sequence_model* -la -ltr | grep \.naf$ |awk '{print $5;}' ; } >> naf_ALCOR_size.txt
{ ls sort.fa* -la -ltr | grep \.naf$ |awk '{print $5;}'; } >> naf_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.naf$ |awk '{print $5;}'; } >> naf_sort_fa_ALCOR_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf  sequence_model.fasta.naf -o sequence_model_naf.fasta ; } 2>>unnaf_cvdb.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf  sort.fa.naf -o sort_naf.fa ; } 2>>unnaf_sort.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf  sort.fa.naf -o sort_naf.fasta ; } 2>>unnaf_sort_fa.txt

{ ls sequence_model* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}' ; } >> unnaf_ALCOR_size.txt
{ ls sort.fa* -la -ltr | grep \._naf.fa$ |awk '{print $5;}'; } >> unnaf_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \._naf.fasta$ |awk '{print $5;}'; } >> unnaf_sort_fa_ALCOR_size.txt


#MBGC
{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -i sequence_model.fasta sequence_model.mbgc ; } 2>>mbgc_ALCOR.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -i sort.fa sort.fa.mbgc ; } 2>>mbgc_sort_ALCOR.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -i sort_fanalysis.fasta sort_fanalysis.mbgc ; } 2>>mbgc_sort_fa_ALCOR.txt

{ ls sequence_model* -la -ltr | grep \.mbgc$ |awk '{print $5;}' ; } >> mbgc_ALCOR_size.txt
{ ls sort.fa* -la -ltr | grep \.mbgc$ |awk '{print $5;}'; } >> mbgc_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mbgc$ |awk '{print $5;}'; } >> mbgc_sort_fa_ALCOR_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -i sequence_model.fasta sequence_model.mbgc ; } 2>>mbgc_d_ALCOR.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -i sort.fa sort.fa.mbgc ; } 2>>mbgc_d_sort_ALCOR_size.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -i sort_fanalysis.fasta sort_fanalysis.mbgc ; } 2>>mbgc_d_sort_fa_ALCOR_size.txt

{ ls sequence_model* -la -ltr | grep \.mbgc.fasta$ |awk '{print $5;}' ; } >> mbgc_d_ALCOR_size.txt
{ ls sort.fa* -la -ltr | grep \.mbgc.fasta$ |awk '{print $5;}'; } >> mbgc_d_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mbgc.fasta$ |awk '{print $5;}'; } >> mbgc_d_sort_fa_ALCOR_size.txt

#{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level 22 sort.fa ; } 2>>naf_ALCOR_sort.txt
#{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level 22 sort_fanalysis.fasta ; } 2>>naf_ALCOR_sort_fa.txt

#MFC
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -1 -p 1 -t 8 sequence_model.fasta ; } 2>>mfc_ALCOR_level1_p1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -1 -p 1 -t 8 sort.fa ; } 2>>mfc_sort_ALCOR_level1_p1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -1 -p 1 -t 8 sort_fanalysis.fasta ; } 2>>mfc_sort_fa_ALCOR_level1_p1.txt 

{ ls sequence_model* -la -ltr | grep \.mfc$ |awk '{print $5;}' ; } >> mfc_ALCOR_size.txt
{ ls sort.fa* -la -ltr | grep \.mfc$ |awk '{print $5;}'; } >> mfc_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mfc$ |awk '{print $5;}'; } >> mfc_sort_fa_ALCOR_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -1 -p 1 -t 8 sequence_model.fasta ; } 2>>mfc_d_ALCOR_level1_p1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -1 -p 1 -t 8 sort.fa ; } 2>>mfc_d_sort_ALCOR_level1_p1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -1 -p 1 -t 8 sort_fanalysis.fasta ; } 2>>mfc_d_sort_fa_ALCOR_level1_p1.txt 

{ ls sequence_model* -la -ltr | grep \.mfc.d$ |awk '{print $5;}' ; } >> mfc_d_ALCOR_size.txt
{ ls sort.fa* -la -ltr | grep \.mfc.d$ |awk '{print $5;}'; } >> mfc_d_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mfc.d$ |awk '{print $5;}'; } >> mfc_d_sort_fa_ALCOR_size.txt


{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -2 -p 1 -t 8 sequence_model.fasta ; } 2>>mfc_ALCOR_level2_p1.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -2 -p 1 -t 8 sort.fa ; } 2>>mfc_sort_ALCOR_level2_p1.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -2 -p 1 -t 8 sort_fanalysis.fasta ; } 2>>mfc_sort_fa_ALCOR_level2_p1.txt

{ ls sequence_model* -la -ltr | grep \.mfc$ |awk '{print $5;}' ; } >> mfc_ALCOR_size.txt
{ ls sort.fa* -la -ltr | grep \.mfc$ |awk '{print $5;}'; } >> mfc_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mfc$ |awk '{print $5;}'; } >> mfc_sort_fa_ALCOR_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -2 -p 1 -t 8 sequence_model.fasta ; } 2>>mfc_d_ALCOR_level2_p1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -2 -p 1 -t 8 sort.fa ; } 2>>mfc_d_sort_ALCOR_level2_p1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -2 -p 1 -t 8 sort_fanalysis.fasta ; } 2>>mfc_d_sort_fa_ALCOR_level2_p1.txt 

{ ls sequence_model* -la -ltr | grep \.mfc.d$ |awk '{print $5;}' ; } >> mfc_d_ALCOR_size.txt
{ ls sort.fa* -la -ltr | grep \.mfc.d$ |awk '{print $5;}'; } >> mfc_d_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mfc.d$ |awk '{print $5;}'; } >> mfc_d_sort_fa_ALCOR_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 1 -t 8 sequence_model.fasta ; } 2>>mfc_ALCOR_level3_p1.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 1 -t 8 sort.fa ; } 2>>mfc_sort_ALCOR_level3_p1.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 1 -t 8 sort_fanalysis.fasta ; } 2>>mfc_sort_fa_ALCOR_level3_p1.txt

{ ls sequence_model* -la -ltr | grep \.mfc$ |awk '{print $5;}' ; } >> mfc_ALCOR_size.txt
{ ls sort.fa* -la -ltr | grep \.mfc$ |awk '{print $5;}'; } >> mfc_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mfc$ |awk '{print $5;}'; } >> mfc_sort_fa_ALCOR_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 1 -t 8 sequence_model.fasta ; } 2>>mfc_d_ALCOR_level3_p1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 1 -t 8 sort.fa ; } 2>>mfc_d_sort_ALCOR_level3_p1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 1 -t 8 sort_fanalysis.fasta ; } 2>>mfc_d_sort_fa_ALCOR_level3_p1.txt 

{ ls sequence_model* -la -ltr | grep \.mfc.d$ |awk '{print $5;}' ; } >> mfc_d_ALCOR_size.txt
{ ls sort.fa* -la -ltr | grep \.mfc.d$ |awk '{print $5;}'; } >> mfc_d_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mfc.d$ |awk '{print $5;}'; } >> mfc_d_sort_fa_ALCOR_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -1 -p 8 -t 8 sequence_model.fasta ; } 2>>mfc_ALCOR_level1_p8.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -1 -p 8 -t 8 sort.fa ; } 2>>mfc_sort_ALCOR_level1_p8.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -1 -p 8 -t 8 sort_fanalysis.fasta ; } 2>>mfc_sort_fa_ALCOR_level1_p8.txt

{ ls sequence_model* -la -ltr | grep \.mfc$ |awk '{print $5;}' ; } >> mfc_ALCOR_size.txt
{ ls sort.fa* -la -ltr | grep \.mfc$ |awk '{print $5;}'; } >> mfc_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mfc$ |awk '{print $5;}'; } >> mfc_sort_fa_ALCOR_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -1 -p 8 -t 8 sequence_model.fasta ; } 2>>mfc_d_sequence_model_level1_p8.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -1 -p 8 -t 8 sort.fa ; } 2>>mfc_d_sort_ALCOR_level1_p8.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -1 -p 8 -t 8 sort_fanalysis.fasta ; } 2>>mfc_d_sort_fa_ALCOR_level1_p8.txt 

{ ls sequence_model* -la -ltr | grep \.mfc.d$ |awk '{print $5;}' ; } >> mfc_d_ALCOR_size.txt
{ ls sort.fa* -la -ltr | grep \.mfc.d$ |awk '{print $5;}'; } >> mfc_d_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mfc.d$ |awk '{print $5;}'; } >> mfc_d_sort_fa_ALCOR_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -2 -p 8 -t 8 sequence_model.fasta ; } 2>>mfc_ALCOR_level2_p8.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -2 -p 8 -t 8 sort.fa ; } 2>>mfc_sort_ALCOR_level2_p8.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -2 -p 8 -t 8 sort_fanalysis.fasta ; } 2>>mfc_sort_fa_ALCOR_level2_p8.txt

{ ls sequence_model* -la -ltr | grep \.mfc$ |awk '{print $5;}' ; } >> mfc_sequence_model_size.txt
{ ls sort.fa* -la -ltr | grep \.mfc$ |awk '{print $5;}'; } >> mfc_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mfc$ |awk '{print $5;}'; } >> mfc_sort_fa_ALCOR_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -2 -p 8 -t 8 sequence_model.fasta ; } 2>>mfc_d_ALCOR_level2_p8.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -2 -p 8 -t 8 sort.fa ; } 2>>mfc_d_sort_ALCOR_level2_p8.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -2 -p 8 -t 8 sort_fanalysis.fasta ; } 2>>mfc_d_sort_fa_ALCOR_level2_p8.txt 

{ ls sequence_model* -la -ltr | grep \.mfc.d$ |awk '{print $5;}' ; } >> mfc_d_ALCOR_size.txt
{ ls sort.fa* -la -ltr | grep \.mfc.d$ |awk '{print $5;}'; } >> mfc_d_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mfc.d$ |awk '{print $5;}'; } >> mfc_d_sort_fa_ALCOR_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 8 -t 8 sequence_model.fasta ; } 2>>mfc_ALCOR_level3_p8.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 8 -t 8 sort.fa ; } 2>>mfc_sort_ALCOR_level3_p8.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -3 -p 8 -t 8 sort_fanalysis.fasta ; } 2>>mfc_sort_fa_ALCOR_level3_p8.txt

{ ls sequence_model* -la -ltr | grep \.mfc$ |awk '{print $5;}' ; } >> mfc_ALCOR_size.txt
{ ls sort.fa* -la -ltr | grep \.mfc$ |awk '{print $5;}'; } >> mfc_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mfc$ |awk '{print $5;}'; } >> mfc_sort_fa_ALCOR_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 8 -t 8 sequence_model.fasta ; } 2>>mfc_d_ALCOR_level3_p8.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 8 -t 8 sort.fa ; } 2>>mfc_d_sort_ALCOR_level3_p8.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -3 -p 8 -t 8 sort_fanalysis.fasta ; } 2>>mfc_d_sort_fa_ALCOR_level3_p8.txt 

{ ls sequence_model* -la -ltr | grep \.mfc.d$ |awk '{print $5;}' ; } >> mfc_d_ALCOR_size.txt
{ ls sort.fa* -la -ltr | grep \.mfc.d$ |awk '{print $5;}'; } >> mfc_d_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.mfc.d$ |awk '{print $5;}'; } >> mfc_d_sort_fa_ALCOR_size.txt

#General Use Compressors

#gzip
{ /bin/time -f "TIME\t%e\tMEM\t%M"  gzip -k -1 sequence_model.fasta y ; } 2>>gzip_ALCOR_level1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M"  gzip -k -1 sort.fa y ; } 2>>gzip_sort_ALCOR_level1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M"  gzip -k -1 sort_fanalysis.fasta y ; } 2>>gzip_sort_fa_ALCOR_level1.txt 

{ ls sequence_model* -la -ltr | grep \.gz$ |awk '{print $5;}' ; } >> gzip_ALCOR_size.txt
{ ls sort.fa* -la -ltr | grep \.gz$ |awk '{print $5;}'; } >> gzip_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.gz$ |awk '{print $5;}'; } >> gzip_sort_fa_ALCOR_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c sort.fa.gz >sort_gz.fa ; } 2>>gunzip_ALCOR_level1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c sort.fa.gz >sort_gz.fa ; } 2>>gunzip_sort_ALCOR_level1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c sort.fa.gz >sort_gz.fa ; } 2>>gunzip_sort_fa_ALCOR_level1.txt 

{ ls sequence_model* -la -ltr | grep \_gz.fasta$ |awk '{print $5;}' ; } >> gunzip_d_ALCOR_size.txt
{ ls sort.fa* -la -ltr | grep \_gz.fasta$ |awk '{print $5;}'; } >> gunzip_d_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \_gz.fasta$ |awk '{print $5;}'; } >> gunzip_d_sort_fa_ALCOR_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M"  gzip -k -9 sequence_model.fasta y ; } 2>>gzip_level9.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M"  gzip -k -9 sort.fa y ; } 2>>gzip_level9.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M"  gzip -k -9 sort_fanalysis.fasta y ; } 2>>gzip_level9.txt 

{ ls sequence_model* -la -ltr | grep \.gz$ |awk '{print $5;}' ; } >> gzip_ALCOR_size.txt
{ ls sort.fa* -la -ltr | grep \.gz$ |awk '{print $5;}'; } >> gzip_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.gz$ |awk '{print $5;}'; } >> gzip_sort_fa_ALCOR_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c sort.fa.gz >sort_gz.fa ; } 2>>gunzip_ALCOR_level9.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c sort.fa.gz >sort_gz.fa ; } 2>>gunzip_sort_ALCOR_level9.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c sort.fa.gz >sort_gz.fa ; } 2>>gunzip_sort_fa_ALCOR_level9.txt 

{ ls sequence_model* -la -ltr | grep \_gz.fasta$ |awk '{print $5;}' ; } >> gunzip_d_ALCOR_size.txt
{ ls sort.fa* -la -ltr | grep \_gz.fasta$ |awk '{print $5;}'; } >> gunzip_d_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \_gz.fasta$ |awk '{print $5;}'; } >> gunzip_d_sort_fa_ALCOR_size.txt


#lzma
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -1 -f -k sequence_model.fasta ; } 2>> lzma_ALCOR_level1.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -1 -f -k sort.fa ; } 2>> lzma_ALCOR_sort_level1.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -1 -f -k sort_fanalysis.fasta ; } 2>> lzma_ALCOR_sort_fa_level1.txt;

{ ls sequence_model* -la -ltr | grep \.lzma$ |awk '{print $5;}' ; } >> lzma_ALCOR_size.txt
{ ls sort.fa* -la -ltr | grep \.lzma$ |awk '{print $5;}'; } >> lzma_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.lzma$ |awk '{print $5;}'; } >> lzma_sort_fa_ALCOR_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  sequence_model.fasta.lzma ; } 2>>lzma_d_ALCOR_level1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d sort.fa.lzma ; } 2>>lzma_d_sort_ALCOR_level1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d sort_fanalysis.fasta.lzma ; } 2>>lzma_d_sort_fa_ALCOR_level1.txt 

{ ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}' ; } >> lzma_d_ALCOR_size.txt
{ ls sort.fa* -la -ltr | grep \.fasta$ |awk '{print $5;}'; } >> _d_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.fasta$ |awk '{print $5;}'; } >> gunzip_d_sort_fa_ALCOR_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k sequence_model.fasta ; } 2>> lzma_ALCOR_level9.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k sort.fa ; } 2>> lzma_ALCOR_sort_level9.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k sort_fanalysis.fasta ; } 2>> lzma_ALCOR_sort_fa_level9.txt;

{ ls sequence_model* -la -ltr | grep \.lzma$ |awk '{print $5;}' ; } >> lzma_ALCOR_size.txt
{ ls sort.fa* -la -ltr | grep \.lzma$ |awk '{print $5;}'; } >> lzma_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.lzma$ |awk '{print $5;}'; } >> lzma_sort_fa_ALCOR_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d sequence_model.fasta ; } 2>>lzma_d_ALCOR_level9.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d sort.fa ; } 2>>lzma_d_sort_ALCOR_level9.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d sort_fanalysis.fasta ; } 2>>lzma_d_sort_fa_ALCOR_level9.txt 

{ ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}' ; } >> lzma_d_ALCOR_size.txt
{ ls sort.fa* -la -ltr | grep \.fasta$ |awk '{print $5;}'; } >> lzma_d_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.fasta$ |awk '{print $5;}'; } >> lzma_d_sort_fa_ALCOR_size.txt


#bzip2
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -1 -f -k CVDB.fasta ; } 2>> bzip2_ALCOR_level1.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -1 -f -k sort.fa ; } 2>> bzip2_ALCOR_sort_level1.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -1 -f -k sort_fanalysis.fasta ; } 2>> bzip2_ALCOR_sort_fa_level1.txt;

{ ls sequence_model* -la -ltr | grep \.bz2$ |awk '{print $5;}' ; } >> bzip2_ALCOR_size.txt
{ ls sort.fa* -la -ltr | grep \.bz2$ |awk '{print $5;}'; } >> bzip2_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.bz2$ |awk '{print $5;}'; } >> bzip2_sort_fa_ALCOR_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d sequence_model.fasta ; } 2>>bzip2_d_ALCOR_level1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d sort.fa ; } 2>>bzip2_d_sort_ALCOR_level1.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d sort_fanalysis.fasta ; } 2>>bzip2_d_sort_fa_ALCOR_level1.txt 

{ ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}' ; } >> bzip2_d_ALCOR_size.txt
{ ls sort.fa* -la -ltr | grep \.fasta$ |awk '{print $5;}'; } >> bzip2_d_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.fasta$ |awk '{print $5;}'; } >> bzip2_d_sort_fa_ALCOR_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -9 -f -k sequence_model.fasta ; } 2>> bzip2_ALCOR_level9.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -9 -f -k sort.fa ; } 2>> bzip2_ALCOR_sort_level9.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -9 -f -k sort_fanalysis.fasta ; } 2>> bzip2_ALCOR_sort_fa_level9.txt;

{ ls sequence_model* -la -ltr | grep \.bz2$ |awk '{print $5;}' ; } >> bzip2_sequence_model_size.txt
{ ls sort.fa* -la -ltr | grep \.bz2$ |awk '{print $5;}'; } >> bzip2_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.bz2$ |awk '{print $5;}'; } >> bzip2_sort_fa_ALCOR_size.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d sequence_model.fasta ; } 2>>bzip2_d_sequence_model_level9.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d sort.fa ; } 2>>bzip2_d_sort_ALCOR_level9.txt 
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d sort_fanalysis.fasta ; } 2>>bzip2_d_sort_fa_ALCOR_level9.txt 

{ ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}' ; } >> bzip2_d_ALCOR_size.txt
{ ls sort.fa* -la -ltr | grep \.fasta$ |awk '{print $5;}'; } >> bzip2_d_sort_ALCOR_size.txt
{ ls sort_fanalysis* -la -ltr | grep \.fasta$ |awk '{print $5;}'; } >> bzip2_d_sort_fa_ALCOR_size.txt


