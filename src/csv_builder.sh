
#LEVEL 15

#J3 -l 15 --block=1GB_sort_fanalysis.fasta
rm data.csv

program="JARVIS3_ALCOR_fasta_analysis"
level=15
partition=1GB
bytes=$(ls sort_fanalysis_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_1000_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l15.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_sort_fa_1000_l15.txt)
c_mem=$(awk 'FNR ==2 {print $1}'  Alcor_sequence_sort_fa_1000_l15.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' Alcor_d_sequence_1000_l15.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_sort_fa_1000_l15.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_sort_fa_1000_l15.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 15 --block=1GB_sort.fa

program="JARVIS3_ALCOR_sortmf"
level=15
partition=1GB
bytes=$(ls sort_ALCOR* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' Alcor_sequence_size_1000_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l15.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_sort_fa_1000_l15.txt)
c_mem=$(awk 'FNR ==2 {print $1}' Alcor_sequence_sort_fa_1000_l15.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_size_1000_l15.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_sort_fa_1000_l15.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_sort_fa_1000_l15.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 15 --block=1GB_sequence_model.fasta

program="JARVIS3_ALCOR"
level=15
partition=1GB
bytes=$(ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l15.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_1000_l15.txt)
c_mem=$(awk 'FNR ==2 {print $1}' Alcor_sequence_1000_l15.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_size_1000_l15.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_1000_l15.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_1000_l15.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 15 --block=100MB_sort_fanalysis_ALCOR.fasta
program="JARVIS3_ALCOR_fasta_analysis"
level=15
partition=100MB
bytes=$(ls sort_fanalysis_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_100_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l15.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_sort_fa_100_l15.txt)
c_mem=$(awk 'FNR ==2 {print $1}'  Alcor_sequence_sort_fa_100_l15.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' Alcor_d_sequence_size_100_l15.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_sort_fa_100_l15.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_sort_fa_100_l15.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 15 --block=100MB_sort_ALCOR.fa

program="JARVIS3_ALCOR_sortmf"
level=15
partition=100MB
bytes=$(ls sort_ALCOR* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' Alcor_sequence_size_100_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l15.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_sort_100_l15.txt)
c_mem=$(awk 'FNR ==2 {print $1}' Alcor_sequence_sort_100_l15.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_size_100_l15.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_sort_100_l15.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_sort_100_l15.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 15 --block=100MB_sequence_model.fasta

program="JARVIS3_ALCOR"
level=15
partition=100MB
bytes=$(ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l15.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_100_l15.txt)
c_mem=$(awk 'FNR ==2 {print $1}' Alcor_sequence_100_l15.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_size_100_l15.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_100_l15.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_100_l15.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 15 --block=10MB_sort_fanalysis_ALCOR.fasta

program="JARVIS3_ALCOR_fasta_analysis"
level=15
partition=10MB
bytes=$(ls sort_fanalysis_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_10_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l15.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_sort_fa_10_l15.txt)
c_mem=$(awk 'FNR ==2 {print $1}'  Alcor_sequence_sort_fa_10_l15.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' Alcor_d_sequence_size_10_l15.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_sort_fa_10_l15.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_sort_fa_10_l15.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 15 --block=10MB_sort_ALCOR.fa

program="JARVIS3_ALCOR_sortmf"
level=15
partition=10MB
bytes=$(ls sort_ALCOR* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' Alcor_sequence_size_10_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l15.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_sort_10_l15.txt)
c_mem=$(awk 'FNR ==2 {print $1}' Alcor_sequence_sort_10_l15.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_size_10_l15.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_sort_10_l15.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_sort_10_l15.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 15 --block=10MB_sequence_model

program="JARVIS3_ALCOR"
level=15
partition=10MB
bytes=$(ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l15.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_10_l15.txt)
c_mem=$(awk 'FNR ==2 {print $1}' Alcor_sequence_10_l15.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_size_10_l15.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_size_10_l15.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_size_10_l15.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#LEVEL 10

#J3 -l 10 --block=1GB_sort_fanalysis_ALCOR.fasta

program="JARVIS3_ALCOR_fasta_analysis"
level=10
partition=1GB
bytes=$(ls sort_fanalysis_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_1000_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l10.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_sort_fa_1000_l10.txt)
c_mem=$(awk 'FNR ==2 {print $1}'  Alcor_sequence_sort_fa_1000_l10.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' Alcor_d_sequence_size_1000_l10.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_sort_fa_1000_l10.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_sort_fa_1000_l10.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 10 --block=1GB_sort_ALCOR.fa

program="JARVIS3_ALCOR_sortmf"
level=10
partition=1GB
bytes=$(ls sort_ALCOR* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' Alcor_sequence_size_1000_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l10.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_sort_1000_l10.txt)
c_mem=$(awk 'FNR ==2 {print $1}' Alcor_sequence_sort_1000_l10.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_size_1000_l10.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_sort_1000_l10.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_sort_1000_l10.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 10 --block=1GB_sequence_model

program="JARVIS3_ALCOR"
level=10
partition=1GB
bytes=$(ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l10.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_1000_l10.txt)
c_mem=$(awk 'FNR ==2 {print $1}' Alcor_sequence_1000_l10.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_size_1000_l10.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_1000_l10.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_1000_l10.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 10 --block=100MB_sort_fanalysis.fasta

program="JARVIS3_ALCOR_fasta_analysis"
level=10
partition=100MB
bytes=$(ls sort_fanalysis_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_100_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l10.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_sort_fa_100_l10.txt)
c_mem=$(awk 'FNR ==2 {print $1}'  Alcor_sequence_sort_fa_100_l10.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' Alcor_d_sequence_size_100_l10.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_sort_fa_100_l10.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_sort_fa_100_l10.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 10 --block=100MB_sort_ALCOR.fa

program="JARVIS3_ALCOR_sortmf"
level=10
partition=100MB
bytes=$(ls sort_ALCOR* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' Alcor_sequence_size_100_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l10.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_sort_fa_100_l10.txt)
c_mem=$(awk 'FNR ==2 {print $1}' Alcor_sequence_sort_fa_100_l10.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_size_100_l10.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_sort_100_l10.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_sort_100_l10.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 10 --block=100MB_sequence_model

program="JARVIS3_ALCOR"
level=10
partition=100MB
bytes=$(ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l10.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_100_l10.txt)
c_mem=$(awk 'FNR ==2 {print $1}' Alcor_sequence_100_l10.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_size_100_l10.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_100_l10.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_100_l10.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 10 --block=10MB_sort_fanalysis_ALCOR.fasta

program="JARVIS3_ALCOR_fasta_analysis"
level=10
partition=10MB
bytes=$(ls sort_fanalysis_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_10_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l10.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_sort_fa_10_l10.txt)
c_mem=$(awk 'FNR ==2 {print $1}'  Alcor_sequence_sort_fa_10_l10.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' Alcor_d_sequence_size_10_l10.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_sort_fa_10_l10.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_sort_fa_10_l10.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 10 --block=10MB_sort.fa

program="JARVIS3_ALCOR_sortmf"
level=10
partition=10MB
bytes=$(ls sort* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' Alcor_sequence_size_10_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l10.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_sort_10_l10.txt)
c_mem=$(awk 'FNR ==2 {print $1}' Alcor_sequence_sort_10_l10.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_size_10_l10.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_sort_10_l10.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_sort_10_l10.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 10 --block=10MB_sequence_model.fasta

program="JARVIS3_ALCOR"
level=10
partition=10MB
bytes=$(ls sequence_model.fasta* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l10.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_10_l10.txt)
c_mem=$(awk 'FNR ==2 {print $1}' Alcor_sequence_10_l10.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_size_10_l10.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_10_l10.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_10_l10.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#LEVEL 5

#J3 -l 5 --block=1GB_sort_fanalysis_ALCOR

program="JARVIS3_ALCOR_fasta_analysis"
level=5
partition=1GB
bytes=$(ls sort_fanalysis_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_1000_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l5.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_sort_fa_1000_l5.txt)
c_mem=$(awk 'FNR ==2 {print $1}' Alcor_sequence_sort_fa_1000_l5.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' Alcor_d_sequence_size_1000_l5.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_sort_fa_1000_l5.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_sort_fa_1000_l5.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 5 --block=1GB_sort.fa

program="JARVIS3_ALCOR_sortmf"
level=5
partition=1GB
bytes=$(ls sort_ALCOR* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' Alcor_sequence_size_1000_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l5.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_sort_1000_l5.txt)
c_mem=$(awk 'FNR ==2 {print $1}' Alcor_sequence_sort_1000_l5.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_size_1000_l5.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_1000_l5.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_1000_l5.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 5 --block=1GB_sequence_model

program="JARVIS3_ALCOR"
level=5
partition=1GB
bytes=$(ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $2)}' Alcor_sequence_size_1000_l5.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_1000_l5.txt)
c_mem=$(awk 'FNR ==2 {print $1}' Alcor_sequence_1000_l5.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_size_1000_l5.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_1000_l5.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_1000_l5.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 5 --block=100MB_sort_fanalysis_ALCOR

program="JARVIS3_ALCOR_fasta_analysis"
level=5
partition=100MB
bytes=$(ls sort_fanalysis_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_100_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l5.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_sort_fa_100_l5.txt)
c_mem=$(awk 'FNR ==2 {print $1}' Alcor_sequence_sort_fa_100_l5.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' Alcor_d_sequence_size_100_l5.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_sort_fa_100_l5.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_sort_fa_100_l5.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 5 --block=100MB_sort_ALCOR

program="JARVIS3_ALCOR_sortmf"
level=5
partition=100MB
bytes=$(ls sort_ALCOR* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' Alcor_sequence_size_100_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l5.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_sort_100_l5.txt)
c_mem=$(awk 'FNR ==2 {print $1}' Alcor_sequence_sort_100_l5.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_size_100_l5.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_sort_100_l5.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_sort_100_l5.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 5 --block=100MB_sequence_model

program="JARVIS3_ALCOR"
level=5
partition=100MB
bytes=$(ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l5.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_100_l5.txt)
c_mem=$(awk 'FNR ==2 {print $1}' Alcor_sequence_100_l5.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_size_100_l5.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_100_l5.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_100_l5.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}

#J3 -l 5 --block=10MB_sort_fanalysis_ALCOR

program="JARVIS3_ALCOR_fasta_analysis"
level=5
partition=10MB
bytes=$(ls sort_fanalysis_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_10_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_sort_fa_10_l5.txt)
c_mem=$(awk 'FNR ==2 {print $1}' Alcor_sequence_sort_fa_10_l5.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' Alcor_d_sequence_size_10_l5.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_sort_fa_10_l5.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_sort_fa_10_l5.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 5 --block=10MB_sort_ALCOR.fa

program="JARVIS3_ALCOR_sortmf"
level=5
partition=10MB
bytes=$(ls sort_ALCOR* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' Alcor_sequence_size_10_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_sort_10_l5.txt)
c_mem=$(awk 'FNR ==2 {print $1}' Alcor_sequence_sort_10_l5.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_size_10_l5.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_sort_10_l5.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_sort_10_l5.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 5 --block=10MB_sequence_model.fasta

program="JARVIS3_ALCOR"
level=5
partition=10MB
bytes=$(ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_10_l5.txt)
c_mem=$(awk 'FNR ==2 {print $1}' Alcor_sequence_10_l5.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_size_10_l5.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_10_l5.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_10_l5.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#LEVEL 1

#J3 -l 1 --block=1GB_sort_fanalysis_ALCOR.fasta

program="JARVIS3_ALCOR_fasta_analysis"
level=1
partition=1GB
bytes=$(ls sort_fanalysis_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_1000_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_sort_fa_1000_l1.txt)
c_mem=$(awk 'FNR ==2 {print $1}' Alcor_sequence_sort_fa_1000_l1.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' Alcor_d_sequence_size_1000_l1.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_sort_fa_1000_l1.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_sort_fa_1000_l1.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 1 --block=1GB_sort_ALCOR.fa

program="JARVIS3_ALCOR_sortmf"
level=1
partition=1GB
bytes=$(ls sort_ALCOR* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' Alcor_sequence_size_1000_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_sort_1000_l1.txt)
c_mem=$(awk 'FNR ==2 {print $1}' Alcor_sequence_sort_1000_l1.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_size_1000_l1.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_sort_1000_l1.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_sort_1000_l1.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 1 --block=1GB_sequence_model.fasta

program="JARVIS3_ALCOR"
level=1
partition=1GB
bytes=$(ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l1.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_1000_l1.txt)
c_mem=$(awk 'FNR ==2 {print $1}' Alcor_sequence_1000_l1.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_size_1000_l1.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_1000_l1.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_1000_l1.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 1 --block=100MB_sort_fanalysis_ALCOR.fasta

program="JARVIS3_ALCOR_fasta_analysis"
level=1
partition=100MB
bytes=$(ls sort_fanalysis_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_100_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_sort_fa_100_l1.txt)
c_mem=$(awk 'FNR ==2 {print $1}' Alcor_sequence_sort_fa_100_l1.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' Alcor_d_sequence_size_100_l1.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_sort_fa_100_l1.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_sort_fa_100_l1.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 1 --block=100MB_sort_ALCOR.fa

program="JARVIS3_ALCOR_sortmf"
level=1
partition=100MB
bytes=$(ls sort_ALCOR* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' Alcor_sequence_size_100_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' Alcor_sequence_sort_100_l1.txt)
c_mem=$(awk 'FNR ==2 {print $1}' Alcor_sequence_sort_100_l1.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_size_100_l1.txt)
d_time=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_sort_100_l1.txt)
d_mem=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_sort_100_l1.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 1 --block=100MB_sequence_model.fasta

program="JARVIS3_ALCOR"
level=1
partition=100MB
bytes=$(ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l1.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' Alcor_sequence_100_l1.txt)
c_mem=$(awk 'FNR ==1 {print $4}' Alcor_sequence_100_l1.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_size_100_l1.txt)
d_time=$(awk 'FNR ==1 {print $2}' Alcor_sequence_100_l1.txt)
d_mem=$(awk 'FNR ==1 {print $4}' Alcor_sequence_100_l1.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 1 --block=10MB_sort_fanalysis_ALCOR.fasta

program="JARVIS3_ALCOR_fasta_analysis"
level=1
partition=10MB
bytes=$(ls sort_fanalysis_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_10_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l1.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' Alcor_sequence_sort_fa_10_l1.txt)
c_mem=$(awk 'FNR ==1 {print $4}' Alcor_sequence_sort_fa_10_l1.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' Alcor_d_sequence_size_10_l1.txt)
d_time=$(awk 'FNR ==1 {print $2}' Alcor_d_sequence_sort_fa_10_l1.txt)
d_mem=$(awk 'FNR ==1 {print $4}' Alcor_d_sequence_sort_fa_10_l1.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 1 --block=10MB_sort_ALCOR.fa

program="JARVIS3_ALCOR_sortmf"
level=1
partition=10MB
bytes=$(ls sort_ALCOR* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' Alcor_sequence_size_10_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l1.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' Alcor_sequence_sort_10_l1.txt)
c_mem=$(awk 'FNR ==1 {print $4}' Alcor_sequence_sort_10_l1.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_size_10_l1.txt)
d_time=$(awk 'FNR ==1 {print $2}' Alcor_d_sequence_sort_10_l1.txt)
d_mem=$(awk 'FNR ==1 {print $4}' Alcor_d_sequence_sort_10_l1.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 1 --block=10MB_sequence_model.fasta

program="JARVIS3_ALCOR"
level=1
partition=10MB
bytes=$(ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l1.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' Alcor_sequence_10_l1.txt)
c_mem=$(awk 'FNR ==1 {print $4}' Alcor_sequence_10_l1.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_size_10_l1.txt)
d_time=$(awk 'FNR ==1 {print $2}' Alcor_d_sequence_10_l1.txt)
d_mem=$(awk 'FNR ==1 {print $4}' Alcor_d_sequence_10_l1.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}

#sequence_model

file="data.csv"

{
ed -s "$file" <<EOF
1
i
"PROGRAM","LEVEL","PARTITION","BYTES","C_BYTES","BPS_original","BPS_final","GAIN","C_TIME(s)","C_RAM(GB)","D_TIME(s)","D_MEM(GB)","DIFF","RUN"
.
wq
EOF
}


file="data.csv"

{
ed -s "$file" <<EOF
1
i
"DS2",
.
wq
EOF
}





#LEVEL 15

#J3 -l 15 --block=1GB_sort_fanalysis.fasta

program="JARVIS3_fasta_analysis"
level=15
partition=1GB
bytes=$(ls sort_fa* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' cvbd_size_1000_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l15.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#bps=0
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' cvdb_sort_fa_1000_l15.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  cvdb_sort_fa_1000_l15.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' cvbd_d_size_1000_l15.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_fa_1000_l15.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_fa_1000_l15.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 15 --block=1GB_sort.fa

program="JARVIS3_sortmf"
level=15
partition=1GB
bytes=$(ls sort* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' cvbd_size_1000_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l15.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#bps=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_1000_l15.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_sort_1000_l15.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' cvbd_d_size_1000_l15.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_1000_l15.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_1000_l15.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 15 --block=1GB_CVDB

program="JARVIS3_ns"
level=15
partition=1GB
bytes=$(ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l15.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' cvdb_1000_l15.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_1000_l15.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l15.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_1000_l15.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_1000_l15.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 15 --block=100MB_sort_fanalysis.fasta

program="JARVIS3_fasta_analysis"
level=15
partition=100MB
bytes=$(ls sort_fa* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' cvbd_size_100_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l15.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#bps=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_fa_100_l15.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  cvdb_sort_fa_100_l15.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' cvbd_d_size_100_l15.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_fa_100_l15.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_fa_100_l15.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 15 --block=100MB_sort.fa

program="JARVIS3_sortmf"
level=15
partition=100MB
bytes=$(ls sort* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' cvdb_d_sort_fa_100_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvdb_d_sort_fa_100_l15.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#bps=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_100_l15.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_sort_100_l15.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' cvbd_d_size_100_l15.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_100_l15.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_100_l15.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 15 --block=100MB_CVDB

program="JARVIS3_ns"
level=15
partition=100MB
bytes=$(ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l15.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' cvdb_100_l15.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_100_l15.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' cvbd_d_size_100_l15.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_100_l15.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_100_l15.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 15 --block=10MB_sort_fanalysis.fasta

program="JARVIS3_fasta_analysis"
level=15
partition=10MB
bytes=$(ls sort_fa* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' cvbd_size_10_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l15.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#bps=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_fa_10_l15.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  cvdb_sort_fa_10_l15.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' cvbd_d_size_10_l15.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_fa_10_l15.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_fa_10_l15.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 15 --block=10MB_sort.fa

program="JARVIS3_sortmf"
level=15
partition=10MB
bytes=$(ls sort* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' cvbd_size_10_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l15.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#bps=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_10_l15.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_sort_10_l15.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' cvbd_d_size_10_l10.txt)
d_time=$(awk 'FNR ==1 {print $2}'cvdb_d_sort_10_l15.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_10_l15.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 15 --block=10MB_CVDB

program="JARVIS3_ns"
level=15
partition=10MB
bytes=$(ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l15.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' cvdb_10_l15.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_10_l15.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' cvbd_d_size_10_l15.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_10_l15.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_10_l15.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#LEVEL 10

#J3 -l 10 --block=1GB_sort_fanalysis.fasta

program="JARVIS3_fasta_analysis"
level=10
partition=1GB
bytes=$(ls sort_fa* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' cvbd_size_1000_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l10.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#bps=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_fa_1000_l10.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  cvdb_sort_fa_1000_l10.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' cvdb_d_1000_l10.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_fa_1000_l10.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_fa_1000_l10.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 10 --block=1GB_sort.fa

program="JARVIS3_sortmf"
level=10
partition=1GB
bytes=$(ls sort* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' cvbd_size_1000_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l10.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#bps=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_1000_l10.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_sort_1000_l10.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' cvbd_d_size_1000_l10.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_1000_l10.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_1000_l10.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 10 --block=1GB_CVDB

program="JARVIS3_ns"
level=10
partition=1GB
bytes=$(ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l10.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' cvdb_1000_l10.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_1000_l10.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' cvbd_d_size_1000_l10.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_1000_l10.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_1000_l10.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 10 --block=100MB_sort_fanalysis.fasta

program="JARVIS3_fasta_analysis"
level=10
partition=100MB
bytes=$(ls sort_fa* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' cvbd_size_100_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l10.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#bps=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_fa_100_l10.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  cvdb_sort_fa_100_l10.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' cvbd_d_size_100_l10.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_fa_100_l10.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_fa_100_l10.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 10 --block=100MB_sort.fa

program="JARVIS3_sortmf"
level=10
partition=100MB
bytes=$(ls sort* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' cvbd_size_100_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l10.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#bps=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_100_l10.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_sort_100_l10.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' cvbd_d_size_100_l10.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_100_l10.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_100_l10.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 10 --block=100MB_CVDB

program="JARVIS3_ns"
level=10
partition=100MB
bytes=$(ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l10.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' cvdb_100_l10.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_100_l10.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' cvbd_d_size_100_l10.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_100_l10.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_100_l10.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 10 --block=10MB_sort_fanalysis.fasta

program="JARVIS3_fasta_analysis"
level=10
partition=10MB
bytes=$(ls sort_fa* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' cvbd_size_10_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l10.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#bps=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_fa_10_l10.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  cvdb_sort_fa_10_l10.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' cvbd_d_size_10_l10.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_fa_10_l10.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_fa_10_l10.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 10 --block=10MB_sort.fa

program="JARVIS3_sortmf"
level=10
partition=10MB
bytes=$(ls sort* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' cvbd_size_10_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l10.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#bps=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_10_l10.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_sort_10_l10.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' cvbd_d_size_10_l10.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_d_10_l10.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_sort_d_10_l10.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 10 --block=10MB_CVDB

program="JARVIS3_ns"
level=10
partition=10MB
bytes=$(ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l10.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' cvdb_10_l10.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_10_l10.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' cvbd_d_size_10_l10.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_10_l10.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_10_l10.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#LEVEL 5

#J3 -l 5 --block=1GB_sort_fan

program="JARVIS3_fasta_analysis"
level=5
partition=1GB
bytes=$(ls sort_fa* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' cvbd_size_1000_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#bps=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_fa_1000_l5.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_sort_fa_1000_l5.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' cvdb_d_1000_l5.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_fa_1000_l5.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_fa_1000_l5.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 5 --block=1GB_sort.fa

program="JARVIS3_sortmf"
level=5
partition=1GB
bytes=$(ls sort* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' cvbd_size_1000_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#bps=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_1000_l5.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_sort_1000_l5.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' cvdb_d_1000_l5.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_1000_l5.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_1000_l5.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 5 --block=1GB_CVDB

program="JARVIS3_ns"
level=5
partition=1GB
bytes=$(ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' cvdb_1000_l5.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_1000_l5.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' cvdb_d_1000_l5.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_1000_l5.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_1000_l5.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 5 --block=100MB_sort_fa

program="JARVIS3_fasta_analysis"
level=5
partition=100MB
bytes=$(ls sort_fa* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' cvbd_size_100_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#bps=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_fa_100_l5.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_sort_fa_100_l5.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' cvdb_d_100_l5.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_fa_100_l5.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_fa_100_l5.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 5 --block=100MB_sort

program="JARVIS3_sortmf"
level=5
partition=100MB
bytes=$(ls sort* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' cvbd_size_100_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#bps=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_100_l5.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_sort_100_l5.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' cvdb_d_100_l5.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_100_l5.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_100_l5.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 5 --block=100MB_CVDB

program="JARVIS3_ns"
level=5
partition=100MB
bytes=$(ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' cvdb_100_l5.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_100_l5.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' cvbd_d_size_100_l5.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_100_l5.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_100_l5.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}

#J3 -l 5 --block=10MB_sort_fa

program="JARVIS3_fasta_analysis"
level=5
partition=10MB
bytes=$(ls sort_fa* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' cvbd_size_10_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#bps=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_fa_10_l5.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_sort_fa_10_l5.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' cvbd_d_size_10_l5.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_fa_10_l5.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_fa_10_l5.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 5 --block=10MB_sort.fa

program="JARVIS3_sortmf"
level=5
partition=10MB
bytes=$(ls sort* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' cvbd_size_10_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#bps=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_10_l5.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_sort_10_l5.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' cvbd_d_size_10_l5.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_10_l5.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_10_l5.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 5 --block=10MB_CVDB.fasta

program="JARVIS3_ns"
level=5
partition=10MB
bytes=$(ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' cvdb_10_l5.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_10_l5.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' cvbd_d_size_10_l5.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_10_l5.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_10_l5.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#LEVEL 1

#J3 -l 1 --block=1GB_sort_fanalysis.fasta

program="JARVIS3_fasta_analysis"
level=1
partition=1GB
bytes=$(ls sort_fan* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' cvbd_size_1000_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#bps=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_fa_1000_l1.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_sort_fa_1000_l1.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' cvbd_d_size_1000_l1.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_fa_1000_l1.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_fa_1000_l1.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 1 --block=1GB_sort.fa

program="JARVIS3_sortmf"
level=1
partition=1GB
bytes=$(ls sort* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' cvbd_size_1000_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#bps=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_1000_l1.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_sort_1000_l1.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' cvbd_d_size_1000_l1.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_1000_l1.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_1000_l1.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 1 --block=1GB_CVDB.fasta

program="JARVIS3_ns"
level=1
partition=1GB
bytes=$(ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' cvdb_1000_l1.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_1000_l1.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' cvbd_d_size_1000_l1.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_1000_l1.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_1000_l1.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 1 --block=100MB_sort_fanalysis.fasta

program="JARVIS3_fasta_analysis"
level=1
partition=100MB
bytes=$(ls sort_fa* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' cvbd_size_100_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#bps=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_fa_100_l1.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_sort_fa_100_l1.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' cvbd_d_size_100_l1.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_fa_100_l1.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_fa_100_l1.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 1 --block=100MB_sort.fa

program="JARVIS3_sortmf"
level=1
partition=100MB
bytes=$(ls sort* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' cvbd_size_100_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#bps=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_100_l1.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_sort_100_l1.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' cvbd_d_size_100_l1.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_100_l1.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_100_l1.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 1 --block=100MB_CVDB.fasta

program="JARVIS3_ns"
level=1
partition=100MB
bytes=$(ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' cvdb_100_l1.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_100_l1.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' cvbd_d_size_100_l1.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_100_l1.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_100_l1.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 1 --block=10MB_sort_fanalysis.fasta

program="JARVIS3_fasta_analysis"
level=1
partition=10MB
bytes=$(ls sort_fan* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' cvbd_size_10_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_fa_10_l1.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_sort_fa_10_l1.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' cvbd_d_size_10_l1.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_fa_10_l1.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_fa_10_l1.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 1 --block=10MB_sort.fa

program="JARVIS3_sortmf"
level=1
partition=10MB
bytes=$(ls sort* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' cvbd_size_10_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_10_l1.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_sort_10_l1.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' cvbd_d_size_10_l1.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_10_l1.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_10_l1.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 1 --block=10MB_CVDB.fasta

program="JARVIS3_ns"
level=1
partition=10MB
bytes=$(ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l1.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#gain=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_10_l1.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_10_l1.txt)
d_bytes=$(awk 'FNR ==1 {print $2}' cvbd_d_size_10_l1.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_10_l1.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_10_l1.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=0

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


file="data.csv"

{
ed -s "$file" <<EOF
1
i
"PROGRAM","LEVEL","PARTITION","BYTES","C_BYTES","BPS_original","BPS_final","GAIN","C_TIME(s)","C_RAM(GB)","D_TIME(s)","D_MEM(GB)","DIFF","RUN"
.
wq
EOF
}


file="data.csv"

{
ed -s "$file" <<EOF
1
i
"DS1",
.
wq
EOF
}


