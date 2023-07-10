rm data.csv

levels_array=("1" "5" "10" "15")
partitions_array=("10MB" "100MB" "1GB")
partitions_in_mb=("10" "100" "1000")
program=("" "sortmf" "fasta_analysis")
filename=("" "sort" "sort_fa")
sequence_type=("" "Alcor")

#$program_index=2
partition_index=2
level_index=3
sequence_type=1
#while [ $program_index -ge 0 ]
#then
#for i in "${!program[@]}"; d

#echo ${partitions_array[partition_index]}


#LEVEL 15

#J3 -l 15 --block=1GB_sort_fanalysis.fasta
rm data.csv

#while [ $partition_index -ge 0 ]
#do

for ((i=${#levels_array[@]}-1; i>=0; i--))
do
echo $i
program="JARVIS3_ALCOR_fasta_analysis"
level=${levels_array[i]}
partition="1GB"
bytes=$(ls sort_fanalysis_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_1000_l${levels_array[i]}.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l${levels_array[i]}.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' Alcor_sequence_sort_fa_1000_l${levels_array[i]}.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  Alcor_sequence_sort_fa_1000_l${levels_array[i]}.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' Alcor_d_sequence_1000_l${levels_array[i]}.txt)
d_time=$(awk 'FNR ==1 {print $2}' Alcor_d_sequence_sort_fa_1000_l${levels_array[i]}.txt)
d_mem=$(awk 'FNR ==1 {print $4}' Alcor_d_sequence_sort_fa_1000_l${levels_array[i]}.txt)
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

done
#    if [ $levels_array[i] == "1" ]; then
#     partition_index=$(( $partition_index - 1 ))
#    fi
#  done
# done


for ((i=${#levels_array[@]}-1; i>=0; i--))
do
echo $i
program="JARVIS3_ALCOR_fasta_analysis"
level=${levels_array[i]}
partition="100MB"
bytes=$(ls sort_fanalysis_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_100_l${levels_array[i]}.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l${levels_array[i]}.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' Alcor_sequence_sort_fa_100_l${levels_array[i]}.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  Alcor_sequence_sort_fa_100_l${levels_array[i]}.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' Alcor_d_sequence_100_l${levels_array[i]}.txt)
d_time=$(awk 'FNR ==1 {print $2}' Alcor_d_sequence_sort_fa_100_l${levels_array[i]}.txt)
d_mem=$(awk 'FNR ==1 {print $4}' Alcor_d_sequence_sort_fa_100_l${levels_array[i]}.txt)
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

done


for ((i=${#levels_array[@]}-1; i>=0; i--))
do
echo $i
program="JARVIS3_ALCOR_fasta_analysis"
level=${levels_array[i]}
partition="10MB"
bytes=$(ls sort_fanalysis_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_10_l${levels_array[i]}.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l${levels_array[i]}.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' Alcor_sequence_sort_fa_10_l${levels_array[i]}.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  Alcor_sequence_sort_fa_10_l${levels_array[i]}.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' Alcor_d_sequence_10_l${levels_array[i]}.txt)
d_time=$(awk 'FNR ==1 {print $2}' Alcor_d_sequence_sort_fa_10_l${levels_array[i]}.txt)
d_mem=$(awk 'FNR ==1 {print $4}' Alcor_d_sequence_sort_fa_10_l${levels_array[i]}.txt)
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

done


#sortmf

for ((i=${#levels_array[@]}-1; i>=0; i--))
do
echo $i
program="JARVIS3_ALCOR_sortmf"
level=${levels_array[i]}
partition="1GB"
bytes=$(ls sort_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_1000_l${levels_array[i]}.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l${levels_array[i]}.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' Alcor_sequence_sort_1000_l${levels_array[i]}.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  Alcor_sequence_sort_1000_l${levels_array[i]}.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' Alcor_d_sequence_1000_l${levels_array[i]}.txt)
d_time=$(awk 'FNR ==1 {print $2}' Alcor_d_sequence_sort_1000_l${levels_array[i]}.txt)
d_mem=$(awk 'FNR ==1 {print $4}' Alcor_d_sequence_sort_1000_l${levels_array[i]}.txt)
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

done


partition_index=2
level_index=3
sequence_type=1

#partitions_array

for ((i=${#levels_array[@]}-1; i>=0; i--))
do

program="JARVIS3_ALCOR_sortmf"
level=${levels_array[i]}
partition="100MB"
bytes=$(ls sort_ALCOR* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' Alcor_sequence_size_100_l${levels_array[i]}.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l${levels_array[i]}.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' Alcor_sequence_sort_100_l${levels_array[i]}.txt)
c_mem=$(awk 'FNR ==1 {print $4}' Alcor_sequence_sort_100_l${levels_array[i]}.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_size_100_l${levels_array[i]}.txt)
d_time=$(awk 'FNR ==1 {print $2}' Alcor_d_sequence_sort_100_l${levels_array[i]}.txt)
d_mem=$(awk 'FNR ==1 {print $4}' Alcor_d_sequence_sort_100_l${levels_array[i]}.txt)
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

done

for ((i=${#levels_array[@]}-1; i>=0; i--))
do

program="JARVIS3_ALCOR_sortmf"
level=${levels_array[i]}
partition="10MB"
bytes=$(ls sort_ALCOR* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' Alcor_sequence_size_10_l${levels_array[i]}.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l${levels_array[i]}.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' Alcor_sequence_sort_10_l${levels_array[i]}.txt)
c_mem=$(awk 'FNR ==1 {print $4}' Alcor_sequence_sort_10_l${levels_array[i]}.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' Alcor_d_sequence_size_10_l${levels_array[i]}.txt)
d_time=$(awk 'FNR ==1 {print $2}' Alcor_d_sequence_sort_10_l${levels_array[i]}.txt)
d_mem=$(awk 'FNR ==1 {print $4}' Alcor_d_sequence_sort_10_l${levels_array[i]}.txt)
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

done


#J3 -l 15 --block=1GB_sort.fa

partition_index=2
level_index=3
sequence_type=1



#J3 -l 15 --block=1GB_sequence_model.fasta

for ((i=${#levels_array[@]}-1; i>=0; i--))
do

program="JARVIS3_ALCOR"
level=${levels_array[i]}
partition="1GB"
bytes=$(ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l${levels_array[i]}.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l${levels_array[i]}.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' Alcor_sequence_1000_l${levels_array[i]}.txt)
c_mem=$(awk 'FNR ==1 {print $4}' Alcor_sequence_1000_l${levels_array[i]}.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_size_1000_l${levels_array[i]}.txt)
d_time=$(awk 'FNR ==1 {print $2}' Alcor_d_sequence_1000_l${levels_array[i]}.txt)
d_mem=$(awk 'FNR ==1 {print $4}' Alcor_d_sequence_1000_l${levels_array[i]}.txt)
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

done

for ((i=${#levels_array[@]}-1; i>=0; i--))
do

program="JARVIS3_ALCOR"
level=${levels_array[i]}
partition="100MB"
bytes=$(ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l${levels_array[i]}.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l${levels_array[i]}.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' Alcor_sequence_100_l${levels_array[i]}.txt)
c_mem=$(awk 'FNR ==1 {print $4}' Alcor_sequence_100_l${levels_array[i]}.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_size_100_l${levels_array[i]}.txt)
d_time=$(awk 'FNR ==1 {print $2}' Alcor_d_sequence_100_l${levels_array[i]}.txt)
d_mem=$(awk 'FNR ==1 {print $4}' Alcor_d_sequence_100_l${levels_array[i]}.txt)
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

done


for ((i=${#levels_array[@]}-1; i>=0; i--))
do

program="JARVIS3_ALCOR"
level=${levels_array[i]}
partition="10MB"
bytes=$(ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l${levels_array[i]}.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l${levels_array[i]}.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' Alcor_sequence_10_l${levels_array[i]}.txt)
c_mem=$(awk 'FNR ==1 {print $4}' Alcor_sequence_10_l${levels_array[i]}.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' Alcor_d_sequence_size_10_l${levels_array[i]}.txt)
d_time=$(awk 'FNR ==1 {print $2}' Alcor_d_sequence_10_l${levels_array[i]}.txt)
d_mem=$(awk 'FNR ==1 {print $4}' Alcor_d_sequence_10_l${levels_array[i]}.txt)
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

done


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



#
# CVDB tests
# while [ $partition_index -ge 0 ]
# do

for ((i=${#levels_array[@]}-1; i>=0; i--))
do

program="JARVIS3_fasta_analysis"
level=${levels_array[i]}
partition="1GB"
bytes=$(ls sort_fanalysis.fasta -la -ltr | awk '{print $5;}')
#bytes=$(ls sort_fanalysis.fasta -la -ltr | awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' cvdb_size_1000_l${levels_array[i]}.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvdb_size_1000_l${levels_array[i]}.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#bps=0
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' cvdb_sort_fa_1000_l${levels_array[i]}.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  cvdb_sort_fa_1000_l${levels_array[i]}.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' cvdb_d_size_1000_l${levels_array[i]}.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_fa_1000_l${levels_array[i]}.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_fa_1000_l${levels_array[i]}.txt)
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

done

for ((i=${#levels_array[@]}-1; i>=0; i--))
do


program="JARVIS3_fasta_analysis"
level=${levels_array[i]}
partition="100MB"
bytes=$(ls sort_fanalysis.fasta -la -ltr | awk '{print $5;}')
#bytes=$(ls sort_fanalysis.fasta -la -ltr | awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' cvdb_size_100_l${levels_array[i]}.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvdb_size_100_l${levels_array[i]}.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#bps=0
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' cvdb_sort_fa_100_l${levels_array[i]}.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  cvdb_sort_fa_100_l${levels_array[i]}.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' cvdb_d_size_100_l${levels_array[i]}.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_fa_100_l${levels_array[i]}.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_fa_100_l${levels_array[i]}.txt)
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

done

for ((i=${#levels_array[@]}-1; i>=0; i--))
do

program="JARVIS3_fasta_analysis"
level=${levels_array[i]}
partition="10MB"
bytes=$(ls sort_fanalysis.fasta -la -ltr | awk '{print $5;}')
#bytes=$(ls sort_fanalysis.fasta -la -ltr | awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' cvdb_size_10_l${levels_array[i]}.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvdb_size_10_l${levels_array[i]}.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#bps=0
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $1}' cvdb_sort_fa_10_l${levels_array[i]}.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  cvdb_sort_fa_10_l${levels_array[i]}.txt)
d_bytes=$(awk 'FNR ==3 {print $1}' cvdb_d_size_10_l${levels_array[i]}.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_fa_10_l${levels_array[i]}.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_fa_10_l${levels_array[i]}.txt)
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

done

for ((i=${#levels_array[@]}-1; i>=0; i--))
do

program="JARVIS3_sortmf"
level=${levels_array[i]}
partition="1GB"
bytes=$(ls sort.fa -la -ltr | awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' cvdb_size_1000_l${levels_array[i]}.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvdb_size_1000_l${levels_array[i]}.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#bps=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_1000_l${levels_array[i]}.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_sort_1000_l${levels_array[i]}.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' cvdb_d_size_1000_l${levels_array[i]}.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_1000_l${levels_array[i]}.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_1000_l${levels_array[i]}.txt)
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

done


for ((i=${#levels_array[@]}-1; i>=0; i--))
do

program="JARVIS3_sortmf"
level=${levels_array[i]}
partition="100MB"
bytes=$(ls sort.fa -la -ltr | awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' cvdb_size_100_l${levels_array[i]}.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvdb_size_100_l${levels_array[i]}.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#bps=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_100_l${levels_array[i]}.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_sort_100_l${levels_array[i]}.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' cvdb_d_size_100_l${levels_array[i]}.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_100_l${levels_array[i]}.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_100_l${levels_array[i]}.txt)
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

done

for ((i=${#levels_array[@]}-1; i>=0; i--))
do

program="JARVIS3_sortmf"
level=${levels_array[i]}
partition="10MB"
bytes=$(ls sort.fa -la -ltr | awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' cvdb_size_10_l${levels_array[i]}.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvdb_size_10_l${levels_array[i]}.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#bps=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_10_l${levels_array[i]}.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_sort_10_l${levels_array[i]}.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' cvdb_d_size_10_l${levels_array[i]}.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_sort_10_l${levels_array[i]}.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_sort_10_l${levels_array[i]}.txt)
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

done



for ((i=${#levels_array[@]}-1; i>=0; i--))
do


program="JARVIS3_ns"
level=${levels_array[i]}
partition="1GB"
bytes=$(ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' cvdb_size_1000_l1.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#gain=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_1000_l${levels_array[i]}.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_1000_l${levels_array[i]}.txt)
d_bytes=$(awk 'FNR ==1 {print $2}' cvdb_d_size_1000_l${levels_array[i]}.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_1000_l${levels_array[i]}.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_1000_l${levels_array[i]}.txt)
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

done


for ((i=${#levels_array[@]}-1; i>=0; i--))
do


program="JARVIS3_ns"
level=${levels_array[i]}
partition="100MB"
bytes=$(ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' cvdb_size_100_l1.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#gain=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_100_l${levels_array[i]}.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_100_l${levels_array[i]}.txt)
d_bytes=$(awk 'FNR ==1 {print $2}' cvdb_d_size_100_l${levels_array[i]}.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_100_l${levels_array[i]}.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_100_l${levels_array[i]}.txt)
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

done


for ((i=${#levels_array[@]}-1; i>=0; i--))
do


program="JARVIS3_ns"
level=${levels_array[i]}
partition="10MB"
bytes=$(ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' cvdb_size_10_l1.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
#gain=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_10_l${levels_array[i]}.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_10_l${levels_array[i]}.txt)
d_bytes=$(awk 'FNR ==1 {print $2}' cvdb_d_size_10_l${levels_array[i]}.txt)
d_time=$(awk 'FNR ==1 {print $2}' cvdb_d_10_l${levels_array[i]}.txt)
d_mem=$(awk 'FNR ==1 {print $4}' cvdb_d_10_l${levels_array[i]}.txt)
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

done
 


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

#for f in cvbd_*; do mv "$f" "$(echo "$f" | sed s/cvbd/cvdb/)"; done