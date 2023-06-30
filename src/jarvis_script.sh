#testes com CVDB.fasta
# { /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=S CVDB.fasta sort_fanalysis.fasta 5 ;  } 2>>ordering_times.txt 
# { /bin/time -f "TIME\t%e\tMEM\t%M" ./a.out CVDB.fasta sort.fa ;  } 2>> sortmf_times.txt

#JARVIS3 level 1
rm *.txt

#10MB

# { /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=S CVDB.fasta sort_fanalysis.fasta 5 ;  } 2>>ordering_times.txt 
# { /bin/time -f "TIME\t%e\tMEM\t%M" ./a.out CVDB.fasta sort.fa ;  } 2>> sortmf_times.txt

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 1 --block 10MB --fasta -i CVDB.fasta ;  } 2>> cvdb_10_l1.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 1 --block 10MB --fasta -i sort.fa ;  } 2>> cvdb_sort_10_l1.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 1 --block 10MB --fasta -i sort_fanalysis.fasta ;  } 2>> cvdb_sort_fa_10_l1.txt

 { ls CVDB* -la -ltr | grep \.tar$ |awk '{print $5;}' ; } >> cvbd_size_10_l1.txt
 { ls sort.fa* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_10_l1.txt
 { ls sort_fanalysis* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_10_l1.txt

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 1 --fasta -i CVDB.fasta.tar ;  } 2>> cvdb_d_10_l1.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 1 --fasta -i sort.fa.tar ;  } 2>> cvdb_d_sort_10_l1.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 1 --fasta -i sort_fanalysis.fasta.tar ;  } 2>> cvdb_d_sort_fa_10_l1.txt

 { ls CVDB* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_10_l1.txt
 { ls sort.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_10_l1.txt
 { ls sort_fanalysis* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_10_l1.txt

#100MB

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 1 --block 100MB --fasta -i CVDB.fasta ;  } 2>> cvdb_100_l1.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 1 --block 100MB --fasta -i sort.fa ;  } 2>> cvdb_sort_100_l1.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 1 --block 100MB --fasta -i sort_fanalysis.fasta ;  } 2>> cvdb_sort_fa_100_l1.txt

 { ls CVDB* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_100_l1.txt
 { ls sort.fa* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_100_l1.txt
 { ls sort_fanalysis* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_100_l1.txt


 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 1 --fasta -i CVDB.fasta.tar ;  } 2>> cvdb_d_100_l1.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 1 --fasta -i sort.fa.tar ;  } 2>> cvdb_d_sort_100_l1.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 1 --fasta -i sort_fanalysis.fasta.tar ;  } 2>> cvdb_d_sort_fa_100_l1.txt

 { ls CVDB* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_100_l1.txt
 { ls sort.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_100_l1.txt
 { ls sort_fanalysis* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_100_l1.txt

#1GB

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 1 --block 1GB --fasta -i CVDB.fasta ;  } 2>> cvdb_1000_l1.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 1 --block 1GB --fasta -i sort.fa ;  } 2>> cvdb_sort_1000_l1.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 1 --block 1GB --fasta -i sort_fanalysis.fasta ;  } 2>> cvdb_sort_fa_1000_l1.txt

 { ls CVDB* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_1000_l1.txt
 { ls sort.fa* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_1000_l1.txt
 { ls sort_fanalysis* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_1000_l1.txt

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 1 --fasta -i CVDB.fasta.tar ;  } 2>> cvdb_d_1000_l1.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 1 --fasta -i sort.fa.tar ;  } 2>> cvdb_d_sort_1000_l1.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 1 --fasta -i sort_fanalysis.fasta.tar ;  } 2>> cvdb_d_sort_fa_1000_l1.txt

 { ls CVDB* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_1000_l1.txt
 { ls sort.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_1000_l1.txt
 { ls sort_fanalysis* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_1000_l1.txt

#JARVIS3 level 5

#10 MB

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 5 --block 10MB --fasta -i CVDB.fasta ;  } 2>> cvdb_10_l5.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 5 --block 10MB --fasta -i sort.fa ;  } 2>> cvdb_sort_10_l5.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 5 --block 10MB --fasta -i sort_fanalysis.fasta ;  } 2>> cvdb_sort_fa_10_l5.txt

 { ls CVDB* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_10_l5.txt
 { ls sort.fa* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_10_l5.txt
 { ls sort_fanalysis* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_10_l5.txt


 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 5 --fasta -i CVDB.fasta.tar ;  } 2>> cvdb_d_10_l5.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 5 --fasta -i sort.fa.tar ;  } 2>> cvdb_d_sort_10_l5.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 5 --fasta -i sort_fanalysis.fasta.tar ;  } 2>> cvdb_d_sort_fa_10_l5.txt

 { ls CVDB* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_10_l5.txt
 { ls sort.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_10_l5.txt
 { ls sort_fanalysis* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_10_l5.txt

#100 MB

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 5 --block 100MB --fasta -i CVDB.fasta ;  } 2>> cvdb_100_l5.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 5 --block 100MB --fasta -i sort.fa ;  } 2>> cvdb_sort_100_l5.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 5 --block 100MB --fasta -i sort_fanalysis.fasta ;  } 2>> cvdb_sort_fa_100_l5.txt

 { ls CVDB* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_100_l5.txt
 { ls sort.fa* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_100_l5.txt
 { ls sort_fanalysis* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_100_l5.txt

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 5 --fasta -i CVDB.fasta.tar ;  } 2>> cvdb_d_100_l5.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 5 --fasta -i sort.fa.tar ;  } 2>> cvdb_d_sort_100_l5.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 5 --fasta -i sort_fanalysis.fasta.tar ;  } 2>> cvdb_d_sort_fa_100_l5.txt

 { ls CVDB* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_100_l5.txt
 { ls sort.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_100_l5.txt
 { ls sort_fanalysis* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_100_l5.txt


#1GB


 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 5 --block 1GB --fasta -i CVDB.fasta ;  } 2>> cvdb_1000_l5.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 5 --block 1GB --fasta -i sort.fa ;  } 2>> cvdb_sort_1000_l5.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 5 --block 1GB --fasta -i sort_fanalysis.fasta ;  } 2>> cvdb_sort_fa_1000_l5.txt

 { ls CVDB* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_1000_l5.txt
 { ls sort.fa* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_1000_l5.txt
 { ls sort_fanalysis* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_1000_l5.txt

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 5 --fasta -i CVDB.fasta.tar ;  } 2>> cvdb_d_1000_l5.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 5 --fasta -i sort.fa ;  } 2>> cvdb_d_sort_1000_l5.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 5 --fasta -i sort_fanalysis.fasta ;  } 2>> cvdb_d_sort_fa_1000_l5.txt

 { ls CVDB* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_1000_l5.txt
 { ls sort.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_1000_l5.txt
 { ls sort_fanalysis* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_1000_l5.txt

#JARVIS3 level 10

#10MB

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 10 --block 10MB --fasta -i CVDB.fasta ;  } 2>> cvdb_10_l10.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 10 --block 10MB --fasta -i sort.fa ;  } 2>> cvdb_sort_10_l10.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 10 --block 10MB --fasta -i sort_fanalysis.fasta ;  } 2>> cvdb_sort_fa_10_l10.txt

 { ls CVDB* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_10_l10.txt
 { ls sort.fa* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_10_l10.txt
 { ls sort_fanalysis* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_10_l10.txt

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 10 --fasta -i CVDB.fasta.tar ;  } 2>> cvdb_d_10_l10.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 10 --fasta -i sort.fa.tar ;  } 2>> cvdb_sort_d_10_l10.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 10 --fasta -i sort_fanalysis.fasta.tar ;  } 2>> cvdb_d_sort_fa_10_l10.txt

 { ls CVDB* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_10_l10.txt
 { ls sort.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_10_l10.txt
 { ls sort_fanalysis* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_10_l10.txt

#100MB

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 10 --block 100MB --fasta -i CVDB.fasta ;  } 2>> cvdb_100_l10.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 10 --block 100MB --fasta -i sort.fa ;  } 2>> cvdb_sort_100_l10.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 10 --block 100MB --fasta -i sort_fanalysis.fasta ;  } 2>> cvdb_sort_fa_100_l10.txt

 { ls CVDB* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_100_l10.txt
 { ls sort.fa* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_100_l10.txt
 { ls sort_fanalysis* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_100_l10.txt

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 10 --fasta -i CVDB.fasta.tar ;  } 2>> cvdb_d_100_l10.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 10 --fasta -i sort.fa.tar ;  } 2>> cvdb_d_sort_100_l10.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 10 --fasta -i sort_fanalysis.fasta.tar ;  } 2>> cvdb_d_sort_fa_100_l10.txt

 { ls CVDB* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_100_l10.txt
 { ls sort.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_100_l10.txt
 { ls sort_fanalysis* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_100_l10.txt

#1GB

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 10 --block 1GB --fasta -i CVDB.fasta ;  } 2>> cvdb_1000_l10.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 10 --block 1GB --fasta -i sort.fa ;  } 2>> cvdb_sort_1000_l10.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 10 --block 1GB --fasta -i sort_fanalysis.fasta ;  } 2>> cvdb_sort_fa_1000_l10.txt

 { ls CVDB* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_1000_l10.txt
 { ls sort.fa* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_1000_l10.txt
 { ls sort_fanalysis* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_1000_l10.txt

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 10 --fasta -i CVDB.fasta.tar ;  } 2>> cvdb_d_1000_l10.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 10 --fasta -i sort.fa.tar ;  } 2>> cvdb_d_sort_1000_l10.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 10 --fasta -i sort_fanalysis.fasta.tar ;  } 2>> cvdb_d_sort_fa_1000_l10.txt

 { ls CVDB* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_1000_l10.txt
 { ls sort.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_1000_l10.txt
 { ls sort_fanalysis* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_1000_l10.txt

#JARVIS3 level 15

#10MB

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 15 --block 10MB --fasta -i CVDB.fasta ;  } 2>> cvdb_10_l15.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 15 --block 10MB --fasta -i sort.fa ;  } 2>> cvdb_sort_10_l15.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 15 --block 10MB --fasta -i sort_fanalysis.fasta ;  } 2>> cvdb_sort_fa_10_l15.txt

 { ls CVDB* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_10_l15.txt
 { ls sort.fa* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_10_l15.txt
 { ls sort_fanalysis* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_10_l15.txt

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 15 --fasta -i CVDB.fasta.tar ;  } 2>> cvdb_d_10_l15.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 15 --fasta -i sort.fa.tar ;  } 2>> cvdb_d_sort_10_l15.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 15 --fasta -i sort_fanalysis.fasta.tar ;  } 2>> cvdb_d_sort_fa_10_l15.txt

 { ls CVDB* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_10_l15.txt
 { ls sort.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_10_l15.txt
 { ls sort_fanalysis* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_10_l15.txt

#100MB

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 15 --block 100MB --fasta -i CVDB.fasta ;  } 2>> cvdb_100_l15.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 15 --block 100MB --fasta -i sort.fa ;  } 2>> cvdb_sort_100_l15.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 15 --block 100MB --fasta -i sort_fanalysis.fasta ;  } 2>> cvdb_sort_fa_100_l15.txt

 { ls CVDB* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_100_l15.txt
 { ls sort.fa* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_100_l15.txt
 { ls sort_fanalysis* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_100_l15.txt

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 15 --fasta -i CVDB.fasta.tar ;  } 2>> cvdb_d_100_l15.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 15 --fasta -i sort.fa.tar ;  } 2>> cvdb_d_sort_100_l15.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 15 --fasta -i sort_fanalysis.fasta.tar ;  } 2>> cvdb_d_sort_fa_100_l15.txt

 { ls CVDB* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_100_l15.txt
 { ls sort.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_100_l15.txt
 { ls sort_fanalysis* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_100_l15.txt
   
#1GB

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 15 --block 1GB --fasta -i CVDB.fasta ;  } 2>> cvdb_1000_l15.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 15 --block 1GB --fasta -i sort.fa ;  } 2>> cvdb_sort_1000_l15.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 15 --block 1GB --fasta -i sort_fanalysis.fasta ;  } 2>> cvdb_sort_fa_1000_l15.txt

 { ls CVDB* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_1000_l15.txt
 { ls sort.fa* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_100_l15.txt
 { ls sort_fanalysis* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> cvbd_size_100_l15.txt

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 15 --fasta -i CVDB.fasta.tar ;  } 2>> cvdb_d_1000_l15.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 15 --fasta -i sort.fa.tar ;  } 2>> cvdb_d_sort_1000_l15.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 15 --fasta -i sort_fanalysis.fasta.tar ;  } 2>> cvdb_d_sort_fa_1000_l15.txt

 { ls CVDB* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_1000_l15.txt
 { ls sort.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_100_l15.txt
 { ls sort_fanalysis* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> cvbd_d_size_100_l15.txt


#testes com sequence_model.fasta

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=S sequence_model.fasta sort_fanalysis_ALCOR.fasta 5 ;  } 2>>ordering_times.txt 
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./a.out sequence_model.fasta sort_ALCOR.fa ;  } 2>> sortmf_times.txt

#LEVEL 1

#10MB
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 1 --block 10MB --fasta -i sequence_model.fasta ;  } 2>> Alcor_sequence_10_l1.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 1 --block 10MB --fasta -i sort_ALCOR.fa ;  } 2>> Alcor_sequence_sort_10_l1.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 1 --block 10MB --fasta -i sort_fanalysis_ALCOR.fasta ;  } 2>> Alcor_sequence_sort_fa_10_l1.txt

 { ls sequence_model* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_10_l1.txt
 { ls sort_ALCOR.fa* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_10_l1.txt
 { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_10_l1.txt

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 1 --fasta -i sequence_model.fasta.tar ;  } 2>> Alcor_d_sequence_10_l1.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 1 --fasta -i sort_ALCOR.fa.tar ;  } 2>> Alcor_d_sequence_sort_10_l1.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 1 --fasta -i sort_fanalysis_ALCOR.fasta.tar ;  } 2>> Alcor_d_sequence_sort_fa_10_l1.txt

 { ls sequence_model* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_10_l1.txt
 { ls sort_ALCOR.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_10_l1.txt
 { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_10_l1.txt



#100MB
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 1 --block 100MB --fasta -i sequence_model.fasta ;  } 2>> Alcor_sequence_100_l1.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 1 --block 100MB --fasta -i sort_ALCOR.fa ;  } 2>> Alcor_sequence_sort_100_l1.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 1 --block 100MB --fasta -i sort_fanalysis_ALCOR.fasta ;  } 2>> Alcor_sequence_sort_fa_100_l1.txt


 { ls sequence_model* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_100_l1.txt
 { ls sort_ALCOR.fa* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_100_l1.txt
 { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_100_l1.txt

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 1 --fasta -i sequence_model.fasta.tar ;  } 2>> Alcor_d_sequence_100_l1.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 1 --fasta -i sort_ALCOR.fa.tar ;  } 2>> Alcor_d_sequence_sort_100_l1.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 1 --fasta -i sort_fanalysis_ALCOR.fasta.tar ;  } 2>> Alcor_d_sequence_sort_fa_100_l1.txt

 { ls sequence_model* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_100_l1.txt
 { ls sort_ALCOR.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_100_l1.txt
 { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_100_l1.txt

#1GB
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 1 --block 1GB --fasta -i sequence_model.fasta ;  } 2>> Alcor_sequence_1000_l1.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 1 --block 1GB --fasta -i sort_ALCOR.fa ;  } 2>> Alcor_sequence_sort_1000_l1.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 1 --block 1GB --fasta -i sort_fanalysis_ALCOR.fasta ;  } 2>> Alcor_sequence_sort_fa_1000_l1.txt

 { ls sequence_model* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_sequence_size_1000_l1.txt
 { ls sort_ALCOR.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_sequence_size_1000_l1.txt
 { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_sequence_size_1000_l1.txt

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 1 --fasta -i sequence_model.fasta.tar ;  } 2>> Alcor_d_sequence_1000_l1.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 1 --fasta -i sort_ALCOR.fa.tar ;  } 2>> Alcor_d_sequence_sort_1000_l1.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 1 --fasta -i sort_fanalysis_ALCOR.fasta.tar ;  } 2>> Alcor_d_sequence_sort_fa_1000_l1.txt

 { ls sequence_model* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_1000_l1.txt
 { ls sort_ALCOR.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_1000_l1.txt
 { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_1000_l1.txt



#LEVEL 5
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 5 --block 10MB --fasta -i sequence_model.fasta ;  } 2>> Alcor_sequence_10_l5.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 5 --block 10MB --fasta -i sort_ALCOR.fa ;  } 2>> Alcor_sequence_sort_10_l5.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 5 --block 10MB --fasta -i sort_fanalysis_ALCOR.fasta ;  } 2>> Alcor_sequence_sort_fa_10_l5.txt

 { ls sequence_model* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_10_l5.txt
 { ls sort_ALCOR.fa* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_10_l5.txt
 { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_10_l5.txt

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 5 --fasta -i sequence_model.fasta.tar ;  } 2>> Alcor_d_sequence_10_l5.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 5 --fasta -i sort_ALCOR.fa.tar ;  } 2>> Alcor_d_sequence_sort_10_l5.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 5 --fasta -i sort_fanalysis_ALCOR.fasta.tar ;  } 2>> Alcor_d_sequence_sort_fa_10_l5.txt

 { ls sequence_model* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_10_l5.txt
 { ls sort_ALCOR.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_10_l5.txt
 { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_10_l5.txt




 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 5 --block 100MB --fasta -i sequence_model.fasta ;  } 2>> Alcor_sequence_100_l5.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 5 --block 100MB --fasta -i sort_ALCOR.fa ;  } 2>> Alcor_sequence_sort_100_l5.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 5 --block 100MB --fasta -i sort_fanalysis_ALCOR.fasta ;  } 2>> Alcor_sequence_sort_fa_100_l5.txt


 { ls sequence_model* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_100_l5.txt
 { ls sort_ALCOR.fa* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_100_l5.txt
 { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_100_l5.txt

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 5 --fasta -i sequence_model.fasta.tar ;  } 2>> Alcor_d_sequence_100_l5.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 5 --fasta -i sort_ALCOR.fa.tar ;  } 2>> Alcor_d_sequence_sort_100_l5.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 5 --fasta -i sort_fanalysis_ALCOR.fasta.tar ;  } 2>> Alcor_d_sequence_sort_fa_100_l5.txt

 { ls sequence_model* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_100_l5.txt
 { ls sort_ALCOR.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_100_l5.txt
 { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_100_l5.txt



 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 5 --block 1GB --fasta -i sequence_model.fasta ;  } 2>> Alcor_sequence_1000_l5.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 5 --block 1GB --fasta -i sort_ALCOR.fa ;  } 2>> Alcor_sequence_sort_1000_l5.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 5 --block 1GB --fasta -i sort_fanalysis_ALCOR.fasta ;  } 2>> Alcor_sequence_sort_fa_1000_l5.txt

 { ls sequence_model* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_1000_l5.txt
 { ls sort_ALCOR.fa* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_1000_l5.txt
 { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_1000_l5.txt

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 5 --fasta -i sequence_model.fasta.tar ;  } 2>> Alcor_d_sequence_1000_l5.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 5 --fasta -i sort_ALCOR.fa.tar ;  } 2>> Alcor_d_sequence_sort_1000_l5.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 5 --fasta -i sort_fanalysis_ALCOR.fasta.tar ;  } 2>> Alcor_d_sequence_sort_fa_1000_l5.txt

 { ls sequence_model* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_1000_l5.txt
 { ls sort_ALCOR.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_1000_l5.txt
 { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_1000_l5.txt


#LEVEL 10
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 10 --block 10MB --fasta -i sequence_model.fasta ;  } 2>> Alcor_sequence_10_l10.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 10 --block 10MB --fasta -i sort_ALCOR.fa ;  } 2>> Alcor_sequence_sort_10_l10.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 10 --block 10MB --fasta -i sort_fanalysis_ALCOR.fasta ;  } 2>> Alcor_sequence_sort_fa_10_l10.txt

 { ls sequence_model* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_10_l10.txt
 { ls sort_ALCOR.fa* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_10_l10.txt
 { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_10_l10.txt

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 10 --fasta -i sequence_model.fasta.tar ;  } 2>> Alcor_d_sequence_10_l10.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 10 --fasta -i sort_ALCOR.fa.tar ;  } 2>> Alcor_d_sequence_sort_10_l10.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 10 --fasta -i sort_fanalysis_ALCOR.fasta.tar ;  } 2>> Alcor_d_sequence_sort_fa_10_l10.txt

 { ls sequence_model* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_10_l10.txt
 { ls sort_ALCOR.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_10_l10.txt
 { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_10_l10.txt


 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 10 --block 100MB --fasta -i sequence_model.fasta ;  } 2>> Alcor_sequence_100_l10.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 10 --block 100MB --fasta -i sort_ALCOR.fa ;  } 2>> Alcor_sequence_sort_100_l10.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 10 --block 100MB --fasta -i sort_fanalysis_ALCOR.fasta ;  } 2>> Alcor_sequence_sort_fa_100_l10.txt


 { ls sequence_model* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_100_l10.txt
 { ls sort_ALCOR.fa* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_100_l10.txt
 { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_100_l10.txt

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 10 --fasta -i sequence_model.fasta.tar ;  } 2>> Alcor_d_sequence_100_l10.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 10 --fasta -i sort_ALCOR.fa.tar ;  } 2>> Alcor_d_sequence_sort_100_l10.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 10 --fasta -i sort_fanalysis_ALCOR.fasta.tar ;  } 2>> Alcor_d_sequence_sort_fa_100_l10.txt

 { ls sequence_model* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_100_l10.txt
 { ls sort_ALCOR.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_100_l10.txt
 { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_100_l10.txt

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 10 --block 1GB --fasta -i sequence_model.fasta ;  } 2>> Alcor_sequence_1000_l10.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 10 --block 1GB --fasta -i sort_ALCOR.fa ;  } 2>> Alcor_sequence_sort_1000_l10.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 10 --block 1GB --fasta -i sort_fanalysis_ALCOR.fasta ;  } 2>> Alcor_sequence_sort_fa_1000_l10.txt

 { ls sequence_model* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_1000_l10.txt
 { ls sort_ALCOR.fa* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_1000_l10.txt
 { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_1000_l10.txt

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 10 --fasta -i sequence_model.fasta.tar ;  } 2>> Alcor_d_sequence_1000_l10.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 10 --fasta -i sort_ALCOR.fa.tar ;  } 2>> Alcor_d_sequence_sort_1000_l10.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 10 --fasta -i sort_fanalysis_ALCOR.fasta.tar ;  } 2>> Alcor_d_sequence_sort_fa_1000_l10.txt

 { ls sequence_model* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_1000_l10.txt
 { ls sort_ALCOR.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_1000_l10.txt
 { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_1000_l10.txt



#LEVEL 15
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 15 --block 10MB --fasta -i sequence_model.fasta ;  } 2>> Alcor_sequence_10_l15.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 15 --block 10MB --fasta -i sort_ALCOR.fa ;  } 2>> Alcor_sequence_sort_10_l15.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 15 --block 10MB --fasta -i sort_fanalysis_ALCOR.fasta ;  } 2>> Alcor_sequence_sort_fa_10_l15.txt

 { ls sequence_model* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_10_l15.txt
 { ls sort_ALCOR.fa* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_10_l15.txt
 { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_10_l15.txt

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 15 --fasta -i sequence_model.fasta.tar ;  } 2>> Alcor_d_sequence_10_l15.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 15 --fasta -i sort_ALCOR.fa.tar ;  } 2>> Alcor_d_sequence_sort_10_l15.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 15 --fasta -i sort_fanalysis_ALCOR.fasta.tar ;  } 2>> Alcor_d_sequence_sort_fa_10_l15.txt

 { ls sequence_model* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_10_l15.txt
 { ls sort_ALCOR.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_10_l15.txt
 { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_10_l15.txt

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 15 --block 100MB --fasta -i sequence_model.fasta ;  } 2>> Alcor_sequence_100_l15.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 15 --block 100MB --fasta -i sort_ALCOR.fa ;  } 2>> Alcor_sequence_sort_100_l15.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 15 --block 100MB --fasta -i sort_fanalysis_ALCOR.fasta ;  } 2>> Alcor_sequence_sort_fa_100_l15.txt

 { ls sequence_model* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_100_l15.txt
 { ls sort_ALCOR.fa* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_100_l15.txt
 { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_100_l15.txt

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 15 --fasta -i sequence_model.fasta.tar ;  } 2>> Alcor_d_sequence_100_l15.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 15 --fasta -i sort_ALCOR.fa.tar ;  } 2>> Alcor_d_sequence_sort_100_l15.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 15 --fasta -i sort_fanalysis_ALCOR.fasta.tar ;  } 2>> Alcor_d_sequence_sort_fa_100_l15.txt

 { ls sequence_model* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_100_l15.txt
 { ls sort_ALCOR.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_100_l15.txt
 { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_100_l15.txt

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 15 --block 1GB --fasta -i sequence_model.fasta ;  } 2>> Alcor_sequence_1000_l15.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 15 --block 1GB --fasta -i sort_ALCOR.fa ;  } 2>> Alcor_sequence_sort_1000_l15.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 15 --block 1GB --fasta -i sort_fanalysis_ALCOR.fasta ;  } 2>> Alcor_sequence_sort_fa_1000_l15.txt

 { ls sequence_model* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_1000_l15.txt
 { ls sort_ALCOR.fa* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_1000_l15.txt
 { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar$ |awk '{print $5;}'; } >> Alcor_sequence_size_1000_l15.txt

 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 15 --fasta -i sequence_model.fasta.tar ;  } 2>> Alcor_d_sequence_1000_l15.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 15 --fasta -i sort_ALCOR.fa.tar ;  } 2>> Alcor_d_sequence_sort_1000_l15.txt
 { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l 15 --fasta -i sort_fanalysis_ALCOR.fasta.tar ;  } 2>> Alcor_d_sequence_sort_fa_1000_l15.txt

 { ls sequence_model* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_1000_l15.txt
 { ls sort_ALCOR.fa* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_1000_l15.txt
 { ls sort_fanalysis_ALCOR* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } >> Alcor_d_sequence_size_1000_l15.txt

./csv_builder.sh



#testes com sequence_model.fasta (variando tamanhos das sequências }
#  { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 2 --block 100MB --fasta -i sequence_model.fasta ;  } 2>> Alcor_sequence_100.txt
#  { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 2 --block 100MB --fasta -i sort.fa ;  } 2>> Alcor_sequence_sort_100.txt
# }  /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l 2 --block 100MB --fasta -i sort_fanalysis.fasta ;  } 2>> Alcor_sequence_sort_fa_100.txt



#  { /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -s sequence_model.fasta shuffled.fasta 5 ;  } 2>>shuffle_times.txt
#  { /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=S sequence_model.fasta sort_fanalysis.fasta 5 ;  } 2>>ordering_times.txt 
#time ./JARVIS3.sh -l 2 --block 10MB --fasta -i sequence_model.fasta
#time ./a.out sequence_model.fasta sort.fa
#time ./JARVIS3.sh -l 2 --block 10MB --fasta -i sort.fa
#  { /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=S sequence_model.fasta sort_fanalysis.fasta 5 ;  } 2>>ordering_times.txt
#time ./JARVIS3.sh -l 2 --block 10MB --fasta -i sort_fanalysis.fasta

#time ./a.out CVDB.fasta sort.fa
#  { /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=S CVDB.fasta sort_fanalysis.fasta 5 ;  } 2>>ordering_times.txt
#time ./JARVIS3.sh -l 2 --block 10MB --fasta -i CVDB.fasta
#time ./JARVIS3.sh -l 2 --block 10MB --fasta -i sort.fa
#time ./JARVIS3.sh -l 2 --block 10MB --fasta -i sort_fanalysis.fasta

#time ./JARVIS3.sh -d -l 2 --block 100MB --fasta -i sort.fa.tar
#time ./JARVIS3.sh -d -l 2 --block 100MB --fasta -i sequence_model.fasta.tar
#time ./JARVIS3.sh -d -l 2 --block 100MB --fasta -i sort_fanalysis.fasta.tar
