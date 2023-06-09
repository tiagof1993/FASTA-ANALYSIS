#bin/bash
#!/usr/bin/bash


#functions 

function RUN_JARVIS2_SH {
  #
  IN_FILE="$1";
  C_COMMAND="$2";
  D_COMMAND="$3";
  NAME="$4";
  #
  /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS2.sh --level " $C_COMMAND " $6 --input $IN_FILE \
  |& grep "TIME" \
  |& tr '.' ',' \
  |& awk '{ printf $2/60"\t"$4/1024/1024"\n" }' > c_time_mem.txt;
  BYTES=`ls -la $IN_FILE.tar | awk '{ print $5 }'`;
  #
  /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS2.sh $D_COMMAND $IN_FILE.tar \
  |& grep "TIME" \
  |& tr '.' ',' \
  |& awk '{ printf $2/60"\t"$4/1024/1024"\n" }' > d_time_mem.txt;
  #
  cmp $IN_FILE.tar.out $IN_FILE > cmp.txt;
  #
  C_TIME=`cat c_time_mem.txt | awk '{ print $1}'`;
  C_MEME=`cat c_time_mem.txt | awk '{ print $2}'`;
  D_TIME=`cat d_time_mem.txt | awk '{ print $1}'`;
  D_MEME=`cat d_time_mem.txt | awk '{ print $2}'`;
  VERIFY="0";
  CMP_SIZE=`ls -la cmp.txt | awk '{ print $5}'`
  if [[ "$CMP_SIZE" != "0" ]]; then CMP_SIZE="1"; fi
  #
  printf "$NAME\t$BYTES\t$C_TIME\t$C_MEME\t$D_TIME\t$D_MEME\t$CMP_SIZE\t$5\n";
  #
  }

function RUN_NAF {
  #
  mkdir -p tmp/
  TMP="tmp-x.fa";
  rm -f $TMP.naf $TMP.unnaf
  echo ">x" > $TMP;
  cat $1 >> $TMP; #copy input file into tmp file
  printf "\n" >> $TMP;
  #
  C_COMMAND="$2"; #Compress Command
  D_COMMAND="$3"; #Decompress Command
  NAME="$4"; # Output file name
  #
  /bin/time -f "TIME\t%e\tMEM\t%M" $C_COMMAND $TMP 2> naf_tmp_report.txt;
  cat naf_tmp_report.txt | grep "TIME" | tr '.' ',' | awk '{ printf $2/60"\t"$4/1024/1024"\n" }' > c_time_mem.txt;
  #
  BYTES=`ls -la $TMP.naf | awk '{ print $5 }'`;
  #
  /bin/time -f "TIME\t%e\tMEM\t%M" $D_COMMAND -o $TMP.unnaf $TMP.naf 2> naf_tmp_report.txt 
  cat naf_tmp_report.txt | grep "TIME" | tr '.' ',' | awk '{ printf $2/60"\t"$4/1024/1024"\n" }' > d_time_mem.txt;
  #
  cmp $TMP.unnaf $TMP > cmp.txt;
  #
  C_TIME=`cat c_time_mem.txt | awk '{ print $1}'`;
  C_MEME=`cat c_time_mem.txt | awk '{ print $2}'`;
  D_TIME=`cat d_time_mem.txt | awk '{ print $1}'`;
  D_MEME=`cat d_time_mem.txt | awk '{ print $2}'`;
  VERIFY="0";
  CMP_SIZE=`ls -la cmp.txt | awk '{ print $5}'`
  if [[ "$CMP_SIZE" != "0" ]]; then CMP_SIZE="1"; fi
  #
  printf "$NAME\t$BYTES\t$C_TIME\t$C_MEME\t$D_TIME\t$D_MEME\t$CMP_SIZE\t$5\n";
  #
  rm -f $TMP $TMP.unnaf
  #
  }
  
    FILE="CVDB.fasta";
  #Stage 1
  RUN_NAF "$FILE" "ennaf --temp-dir tmp/ --dna --level 22 " "unnaf " "NAF-22" "24"
  #Stage 2
  RUN_NAF "shuffled.fasta" "ennaf --temp-dir tmp/ --dna --level 22 " "unnaf " "NAF-22" "24"
  #Stage 3
  RUN_NAF "ordered_size_$FILE" "ennaf --temp-dir tmp/ --dna --level 22 " "unnaf " "NAF-22" "24"
  RUN_NAF "ordered_AT_$FILE" "ennaf --temp-dir tmp/ --dna --level 22 " "unnaf " "NAF-22" "24"
  RUN_NAF "ordered_CG_$FILE" "ennaf --temp-dir tmp/ --dna --level 22 " "unnaf " "NAF-22" "24"
  #Stage 4
  RUN_NAF "ordered_shuffled_v2_size.fasta" "ennaf --temp-dir tmp/ --dna --level 22 " "unnaf " "NAF-22" "24"
  RUN_NAF "ordered_shuffled_v2_AT.fasta" "ennaf --temp-dir tmp/ --dna --level 22 " "unnaf " "NAF-22" "24"
  RUN_NAF "ordered_shuffled_v2_CG.fasta" "ennaf --temp-dir tmp/ --dna --level 22 " "unnaf " "NAF-22" "24"
  
  
  function RUN_MFC {
  #
  FILE="$1";
  C_COMMAND="$2";
  D_COMMAND="$3";
  NAME="$4";
  #
  echo ">x" > $FILE.orig;
  cat $FILE >> $FILE.orig;
  printf "\n" >> $FILE.orig;
  #
  /bin/time -f "TIME\t%e\tMEM\t%M" $C_COMMAND -o $FILE.mfc $FILE.orig 1> c_stdout.txt 2> c_tmp_report.txt;
  cat c_tmp_report.txt | grep "TIME" | tr '.' ',' | awk '{ printf $2/60"\t"$4/1024/1024"\n" }' > c_time_mem.txt;
  #
  BYTES=`ls -la $FILE.mfc | awk '{ print $5 }'`;
  #
  /bin/time -f "TIME\t%e\tMEM\t%M" $D_COMMAND -o $FILE.d $FILE.mfc 1> d_stdout.txt 2> d_tmp_report.txt
  cat d_tmp_report.txt | grep "TIME" | tr '.' ',' | awk '{ printf $2/60"\t"$4/1024/1024"\n" }' > d_time_mem.txt;
  #
  cmp $FILE.orig $FILE.d > cmp.txt;
  #
  C_TIME=`cat c_time_mem.txt | awk '{ print $1}'`;
  C_MEME=`cat c_time_mem.txt | awk '{ print $2}'`;
  D_TIME=`cat d_time_mem.txt | awk '{ print $1}'`;
  D_MEME=`cat d_time_mem.txt | awk '{ print $2}'`;
  VERIFY="0";
  CMP_SIZE=`ls -la cmp.txt | awk '{ print $5}'`
  if [[ "$CMP_SIZE" != "0" ]]; then CMP_SIZE="1"; fi
  #
  printf "$NAME\t$BYTES\t$C_TIME\t$C_MEME\t$D_TIME\t$D_MEME\t$CMP_SIZE\t$5\n";
  #
  rm -f $FILE.orig $FILE.mfc $FILE.d c_tmp_report.txt d_tmp_report.txt c_time_mem.txt d_time_mem.txt c_stdout.txt d_stdout.txt
  #
  }
  
  FILE="CVDB.fasta";
  
{ ./FASTA_ANALY -s $FILE.fasta shuffled.fasta 5 ; } 2>>shuffle_times.txt
sed -i '$ s/.$//' shuffled.fasta
  
{ time ./FASTA_ANALY -sort=S $FILE.fasta ordered_size_$FILE.fasta 5 ; } 2>>ordering_times.txt
sed -i '$ s/.$//' ordered_size_$FILE.fasta
{ time ./FASTA_ANALY -sort=AT $FILE.fasta ordered_AT_$FILE.fasta 5 ; } 2>>ordering_times.txt
sed -i '$ s/.$//' ordered_AT_$FILE.fasta
{ time ./FASTA_ANALY -sort=CG $FILE.fasta ordered_CG_$FILE.fasta 5 ; } 2>>ordering_times.txt
sed -i '$ s/.$//' ordered_CG_$FILE.fasta

{ ./FASTA_ANALY -s $FILE.fasta shuffled_v2.fasta 5 ; } 2>>shuffle_times_s4.txt
sed -i '$ s/.$//' shuffled_v2.fasta
{ time ./FASTA_ANALY -sort=S shuffled_v2.fasta ordered_shuffled_v2_size.fasta 5 ; } 2>>ordering_times_s4.txt
sed -i '$ s/.$//' ordered_shuffled_v2.fasta
{ time ./FASTA_ANALY -sort=S shuffled_v2.fasta ordered_shuffled_v2_AT.fasta 5 ; } 2>>ordering_times_s4.txt
sed -i '$ s/.$//' ordered_shuffled_v2.fasta
{ time ./FASTA_ANALY -sort=S shuffled_v2.fasta ordered_shuffled_v2_CG.fasta 5 ; } 2>>ordering_times_s4.txt
sed -i '$ s/.$//' ordered_shuffled_v2.fasta
  
  #NAF
  
  #Stage 1
  RUN_NAF "$FILE" "ennaf --temp-dir tmp/ --dna --level 22 " "unnaf " "NAF-22" "24"
  #Stage 2
  RUN_NAF "shuffled.fasta" "ennaf --temp-dir tmp/ --dna --level 22 " "unnaf " "NAF-22" "24"
  #Stage 3
  RUN_NAF "ordered_size_$FILE" "ennaf --temp-dir tmp/ --dna --level 22 " "unnaf " "NAF-22" "24"
  RUN_NAF "ordered_AT_$FILE" "ennaf --temp-dir tmp/ --dna --level 22 " "unnaf " "NAF-22" "24"
  RUN_NAF "ordered_CG_$FILE" "ennaf --temp-dir tmp/ --dna --level 22 " "unnaf " "NAF-22" "24"
  #Stage 4
  RUN_NAF "ordered_shuffled_v2_size.fasta" "ennaf --temp-dir tmp/ --dna --level 22 " "unnaf " "NAF-22" "24"
  RUN_NAF "ordered_shuffled_v2_AT.fasta" "ennaf --temp-dir tmp/ --dna --level 22 " "unnaf " "NAF-22" "24"
  RUN_NAF "ordered_shuffled_v2_CG.fasta" "ennaf --temp-dir tmp/ --dna --level 22 " "unnaf " "NAF-22" "24"
  
  #MFC
  
  #Stage 1
  RUN_MFC "$FILE" "./MFCompressC -v -1 -p 1 -t 1 " "./MFCompressD " "MFC-1" "30"
  RUN_MFC "$FILE" "./MFCompressC -v -2 -p 1 -t 1 " "./MFCompressD " "MFC-2" "31"
  RUN_MFC "$FILE" "./MFCompressC -v -3 -p 1 -t 1 " "./MFCompressD " "MFC-3" "32"
  #Stage 2
  RUN_MFC "shuffled.fasta" "./MFCompressC -v -1 -p 1 -t 1 " "./MFCompressD " "MFC-1" "30"
  RUN_MFC "shuffled.fasta" "./MFCompressC -v -2 -p 1 -t 1 " "./MFCompressD " "MFC-2" "31"
  RUN_MFC "shuffled.fasta" "./MFCompressC -v -3 -p 1 -t 1 " "./MFCompressD " "MFC-3" "32"
  #Stage 3
  RUN_MFC "ordered_size_$FILE" "./MFCompressC -v -1 -p 1 -t 1 " "./MFCompressD " "MFC-1" "30"
  RUN_MFC "ordered_size_$FILE" "./MFCompressC -v -2 -p 1 -t 1 " "./MFCompressD " "MFC-2" "31"
  RUN_MFC "ordered_size_$FILE" "./MFCompressC -v -3 -p 1 -t 1 " "./MFCompressD " "MFC-3" "32"
  RUN_MFC "ordered_AT_$FILE" "./MFCompressC -v -1 -p 1 -t 1 " "./MFCompressD " "MFC-1" "30"
  RUN_MFC "ordered_AT_$FILE" "./MFCompressC -v -2 -p 1 -t 1 " "./MFCompressD " "MFC-2" "31"
  RUN_MFC "ordered_AT_$FILE" "./MFCompressC -v -3 -p 1 -t 1 " "./MFCompressD " "MFC-3" "32"
  RUN_MFC "ordered_CG_$FILE" "./MFCompressC -v -1 -p 1 -t 1 " "./MFCompressD " "MFC-1" "30"
  RUN_MFC "ordered_CG_$FILE" "./MFCompressC -v -2 -p 1 -t 1 " "./MFCompressD " "MFC-2" "31"
  RUN_MFC "ordered_CG_$FILE" "./MFCompressC -v -3 -p 1 -t 1 " "./MFCompressD " "MFC-3" "32"
  #Stage 4
  RUN_MFC "ordered_shuffled_v2_size.fasta" "./MFCompressC -v -1 -p 1 -t 1 " "./MFCompressD " "MFC-1" "30"
  RUN_MFC "ordered_shuffled_v2_AT.fasta" "./MFCompressC -v -2 -p 1 -t 1 " "./MFCompressD " "MFC-2" "31"
  RUN_MFC "ordered_shuffled_v2_CG.fasta" "./MFCompressC -v -3 -p 1 -t 1 " "./MFCompressD " "MFC-3" "32"
  
  
  #JARVIS2
  
#Stage 1  
RUN_JARVIS2_SH "$FILE" " -lr 0.01 -hs 42 -rm 200:11:1:0.9:7:0.3:1:0.2:220000 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 3 --dna --input " "JARVIS2-sh" "20" " --block 270MB --threads 3 --dna "
RUN_JARVIS2_SH "$FILE" " -lr 0.01 -hs 42 -rm 1000:12:0.1:0.9:7:0.4:1:0.2:220000 -cm 1:1:0:0.7/0:0:0:0 -cm 7:10:1:0.7/0:0:0:0 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 3 --dna --input " "JARVIS2-sh" "21" " --block 270MB --threads 3 --dna "
RUN_JARVIS2_SH "$FILE" " -lr 0.01 -hs 42 -rm 500:12:0.1:0.9:7:0.4:1:0.2:220000 -cm 1:1:0:0.7/0:0:0:0 -cm 7:1:0:0.7/0:0:0:0 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 6 --dna --input " "JARVIS2-sh" "22" " --block 150MB --threads 6 --dna "
RUN_JARVIS2_SH "$FILE" " -lr 0.01 -hs 42 -rm 200:11:1:0.9:7:0.3:1:0.2:220000 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 8 --dna --input " "JARVIS2-sh" "23" " --block 100MB --threads 8 --dna "

#Stage 2
RUN_JARVIS2_SH "shuffled.fasta" " -lr 0.01 -hs 42 -rm 200:11:1:0.9:7:0.3:1:0.2:220000 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 3 --dna --input " "JARVIS2-sh" "20" " --block 270MB --threads 3 --dna "
RUN_JARVIS2_SH "shuffled.fasta" " -lr 0.01 -hs 42 -rm 1000:12:0.1:0.9:7:0.4:1:0.2:220000 -cm 1:1:0:0.7/0:0:0:0 -cm 7:10:1:0.7/0:0:0:0 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 3 --dna --input " "JARVIS2-sh" "21" " --block 270MB --threads 3 --dna "
RUN_JARVIS2_SH "shuffled.fasta" " -lr 0.01 -hs 42 -rm 500:12:0.1:0.9:7:0.4:1:0.2:220000 -cm 1:1:0:0.7/0:0:0:0 -cm 7:1:0:0.7/0:0:0:0 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 6 --dna --input " "JARVIS2-sh" "22" " --block 150MB --threads 6 --dna "
RUN_JARVIS2_SH "shuffled.fasta" " -lr 0.01 -hs 42 -rm 200:11:1:0.9:7:0.3:1:0.2:220000 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 8 --dna --input " "JARVIS2-sh" "23" " --block 100MB --threads 8 --dna " 

#Stage 3
RUN_JARVIS2_SH "ordered_size_$FILE" " -lr 0.01 -hs 42 -rm 200:11:1:0.9:7:0.3:1:0.2:220000 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 3 --dna --input " "JARVIS2-sh" "20" " --block 270MB --threads 3 --dna "
RUN_JARVIS2_SH "ordered_size_$FILE" " -lr 0.01 -hs 42 -rm 1000:12:0.1:0.9:7:0.4:1:0.2:220000 -cm 1:1:0:0.7/0:0:0:0 -cm 7:10:1:0.7/0:0:0:0 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 3 --dna --input " "JARVIS2-sh" "21" " --block 270MB --threads 3 --dna "
RUN_JARVIS2_SH "ordered_size_$FILE" " -lr 0.01 -hs 42 -rm 500:12:0.1:0.9:7:0.4:1:0.2:220000 -cm 1:1:0:0.7/0:0:0:0 -cm 7:1:0:0.7/0:0:0:0 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 6 --dna --input " "JARVIS2-sh" "22" " --block 150MB --threads 6 --dna "
RUN_JARVIS2_SH "ordered_size_$FILE" " -lr 0.01 -hs 42 -rm 200:11:1:0.9:7:0.3:1:0.2:220000 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 8 --dna --input " "JARVIS2-sh" "23" " --block 100MB --threads 8 --dna "
RUN_JARVIS2_SH "ordered_AT_$FILE" " -lr 0.01 -hs 42 -rm 200:11:1:0.9:7:0.3:1:0.2:220000 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 3 --dna --input " "JARVIS2-sh" "20" " --block 270MB --threads 3 --dna "
RUN_JARVIS2_SH "ordered_AT_$FILE" " -lr 0.01 -hs 42 -rm 1000:12:0.1:0.9:7:0.4:1:0.2:220000 -cm 1:1:0:0.7/0:0:0:0 -cm 7:10:1:0.7/0:0:0:0 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 3 --dna --input " "JARVIS2-sh" "21" " --block 270MB --threads 3 --dna "
RUN_JARVIS2_SH "ordered_AT_$FILE" " -lr 0.01 -hs 42 -rm 500:12:0.1:0.9:7:0.4:1:0.2:220000 -cm 1:1:0:0.7/0:0:0:0 -cm 7:1:0:0.7/0:0:0:0 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 6 --dna --input " "JARVIS2-sh" "22" " --block 150MB --threads 6 --dna "
RUN_JARVIS2_SH "ordered_AT_$FILE" " -lr 0.01 -hs 42 -rm 200:11:1:0.9:7:0.3:1:0.2:220000 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 8 --dna --input " "JARVIS2-sh" "23" " --block 100MB --threads 8 --dna "
RUN_JARVIS2_SH "ordered_CG_$FILE" " -lr 0.01 -hs 42 -rm 200:11:1:0.9:7:0.3:1:0.2:220000 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 3 --dna --input " "JARVIS2-sh" "20" " --block 270MB --threads 3 --dna "
RUN_JARVIS2_SH "ordered_CG_$FILE" " -lr 0.01 -hs 42 -rm 1000:12:0.1:0.9:7:0.4:1:0.2:220000 -cm 1:1:0:0.7/0:0:0:0 -cm 7:10:1:0.7/0:0:0:0 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 3 --dna --input " "JARVIS2-sh" "21" " --block 270MB --threads 3 --dna "
RUN_JARVIS2_SH "ordered_CG_$FILE" " -lr 0.01 -hs 42 -rm 500:12:0.1:0.9:7:0.4:1:0.2:220000 -cm 1:1:0:0.7/0:0:0:0 -cm 7:1:0:0.7/0:0:0:0 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 6 --dna --input " "JARVIS2-sh" "22" " --block 150MB --threads 6 --dna "
RUN_JARVIS2_SH "ordered_CG_$FILE" " -lr 0.01 -hs 42 -rm 200:11:1:0.9:7:0.3:1:0.2:220000 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 8 --dna --input " "JARVIS2-sh" "23" " --block 100MB --threads 8 --dna "


#Stage 4
RUN_JARVIS2_SH "ordered_shuffled_v2_size.fasta" " -lr 0.01 -hs 42 -rm 200:11:1:0.9:7:0.3:1:0.2:220000 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 3 --dna --input " "JARVIS2-sh" "20" " --block 270MB --threads 3 --dna "
RUN_JARVIS2_SH "ordered_shuffled_v2_size.fasta" " -lr 0.01 -hs 42 -rm 1000:12:0.1:0.9:7:0.4:1:0.2:220000 -cm 1:1:0:0.7/0:0:0:0 -cm 7:10:1:0.7/0:0:0:0 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 3 --dna --input " "JARVIS2-sh" "21" " --block 270MB --threads 3 --dna "
RUN_JARVIS2_SH "ordered_shuffled_v2_size.fasta" " -lr 0.01 -hs 42 -rm 500:12:0.1:0.9:7:0.4:1:0.2:220000 -cm 1:1:0:0.7/0:0:0:0 -cm 7:1:0:0.7/0:0:0:0 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 6 --dna --input " "JARVIS2-sh" "22" " --block 150MB --threads 6 --dna "
RUN_JARVIS2_SH "ordered_shuffled_v2_size.fasta" " -lr 0.01 -hs 42 -rm 200:11:1:0.9:7:0.3:1:0.2:220000 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 8 --dna --input " "JARVIS2-sh" "23" " --block 100MB --threads 8 --dna " 

RUN_JARVIS2_SH "ordered_shuffled_v2_AT.fasta" " -lr 0.01 -hs 42 -rm 200:11:1:0.9:7:0.3:1:0.2:220000 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 3 --dna --input " "JARVIS2-sh" "20" " --block 270MB --threads 3 --dna "
RUN_JARVIS2_SH "ordered_shuffled_v2_AT.fasta" " -lr 0.01 -hs 42 -rm 1000:12:0.1:0.9:7:0.4:1:0.2:220000 -cm 1:1:0:0.7/0:0:0:0 -cm 7:10:1:0.7/0:0:0:0 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 3 --dna --input " "JARVIS2-sh" "21" " --block 270MB --threads 3 --dna "
RUN_JARVIS2_SH "ordered_shuffled_v2_AT.fasta" " -lr 0.01 -hs 42 -rm 500:12:0.1:0.9:7:0.4:1:0.2:220000 -cm 1:1:0:0.7/0:0:0:0 -cm 7:1:0:0.7/0:0:0:0 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 6 --dna --input " "JARVIS2-sh" "22" " --block 150MB --threads 6 --dna "
RUN_JARVIS2_SH "ordered_shuffled_v2_AT.fasta" " -lr 0.01 -hs 42 -rm 200:11:1:0.9:7:0.3:1:0.2:220000 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 8 --dna --input " "JARVIS2-sh" "23" " --block 100MB --threads 8 --dna " 

RUN_JARVIS2_SH "ordered_shuffled_v2_CG.fasta" " -lr 0.01 -hs 42 -rm 200:11:1:0.9:7:0.3:1:0.2:220000 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 3 --dna --input " "JARVIS2-sh" "20" " --block 270MB --threads 3 --dna "
RUN_JARVIS2_SH "ordered_shuffled_v2_CG.fasta" " -lr 0.01 -hs 42 -rm 1000:12:0.1:0.9:7:0.4:1:0.2:220000 -cm 1:1:0:0.7/0:0:0:0 -cm 7:10:1:0.7/0:0:0:0 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 3 --dna --input " "JARVIS2-sh" "21" " --block 270MB --threads 3 --dna "
RUN_JARVIS2_SH "ordered_shuffled_v2_CG.fasta" " -lr 0.01 -hs 42 -rm 500:12:0.1:0.9:7:0.4:1:0.2:220000 -cm 1:1:0:0.7/0:0:0:0 -cm 7:1:0:0.7/0:0:0:0 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 6 --dna --input " "JARVIS2-sh" "22" " --block 150MB --threads 6 --dna "
RUN_JARVIS2_SH "ordered_shuffled_v2_CG.fasta" " -lr 0.01 -hs 42 -rm 200:11:1:0.9:7:0.3:1:0.2:220000 -cm 12:1:1:0.85/0:0:0:0 " " --decompress --threads 8 --dna --input " "JARVIS2-sh" "23" " --block 100MB --threads 8 --dna " 

