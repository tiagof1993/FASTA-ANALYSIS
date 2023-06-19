
#LEVEL 15

#J3 -l 15 --block=1GB sort_fanalysis.fasta

rm data.csv

program="JARVIS3 l15 1GB sort_fa"
bytes=$(ls sort_fanalysis_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_1000_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l15.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
#bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 15 --block=1GB sort.fa

program="JARVIS3 l15 1GB sort"
bytes=$(ls sort_ALCOR* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' Alcor_sequence_size_1000_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l15.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
#bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 15 --block=1GB sequence_model.fasta

program="JARVIS3 l15 1GB sequence_model"
bytes=$(ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l15.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 15 --block=100MB sort_fanalysis_ALCOR.fasta

program="JARVIS3 l15 100MB sort_fa_ALCOR"
bytes=$(ls sort_fanalysis_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_100_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l15.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
#bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 15 --block=100MB sort_ALCOR.fa

program="JARVIS3 l15 100MB sort_ALCOR"
bytes=$(ls sort_ALCOR* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' Alcor_sequence_size_100_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l15.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
#bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 15 --block=100MB sequence_model.fasta

program="JARVIS3 l15 100MB sequence_model"
bytes=$(ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l15.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 15 --block=10MB sort_fanalysis_ALCOR.fasta

program="JARVIS3 l15 10MB sort_fanalysis_ALCOR"
bytes=$(ls sort_fanalysis_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_10_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l15.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
#bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 15 --block=10MB sort_ALCOR.fa

program="JARVIS3 l15 10MB sort_ALCOR"
bytes=$(ls sort_ALCOR* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' Alcor_sequence_size_10_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l15.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
#bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 15 --block=10MB sequence_model

program="JARVIS3 l15 10MB sequence_model"
bytes=$(ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l15.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#LEVEL 10

#J3 -l 10 --block=1GB sort_fanalysis_ALCOR.fasta

program="JARVIS3 l10 1GB sort_fanalysis_ALCOR"
bytes=$(ls sort_fanalysis_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_1000_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l10.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
#bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 10 --block=1GB sort_ALCOR.fa

program="JARVIS3 l10 1GB sort"
bytes=$(ls sort_ALCOR* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' Alcor_sequence_size_1000_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l10.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
#bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 10 --block=1GB sequence_model

program="JARVIS3 l10 1GB sequence_model"
bytes=$(ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l10.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 10 --block=100MB sort_fanalysis.fasta

program="JARVIS3 l10 100MB sort_fanalysis_ALCOR"
bytes=$(ls sort_fanalysis_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_100_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l10.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
#bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 10 --block=100MB sort_ALCOR.fa

program="JARVIS3 l10 100MB sort_ALCOR"
bytes=$(ls sort_ALCOR* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' Alcor_sequence_size_100_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l10.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
#bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 10 --block=100MB sequence_model

program="JARVIS3 l10 100MB sequence_model"
bytes=$(ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l10.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 10 --block=10MB sort_fanalysis_ALCOR.fasta

program="JARVIS3 l10 10MB sort_fanalysis_ALCOR"
bytes=$(ls sort_fanalysis_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_10_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l10.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
#bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 10 --block=10MB sort.fa

program="JARVIS3 l10 10MB sort"
bytes=$(ls sort* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' Alcor_sequence_size_10_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l10.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
#bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 10 --block=10MB sequence_model.fasta

program="JARVIS3 l10 10MB sequence_model"
bytes=$(ls sequence_model.fasta* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l10.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#LEVEL 5

#J3 -l 5 --block=1GB sort_fanalysis_ALCOR

program="JARVIS3 l5 1GB sort_fanalysis_ALCOR"
bytes=$(ls sort_fanalysis_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_1000_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
#bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 5 --block=1GB sort.fa

program="JARVIS3 l5 1GB sort_ALCOR"
bytes=$(ls sort_ALCOR* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' Alcor_sequence_size_1000_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
#bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 5 --block=1GB sequence_model

program="JARVIS3 l5 1GB sequence_model"
bytes=$(ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $2)}' Alcor_sequence_size_1000_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 5 --block=100MB sort_fanalysis_ALCOR

program="JARVIS3 l5 100MB sort_fanalysis_ALCOR"
bytes=$(ls sort_fanalysis_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_100_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
#bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 5 --block=100MB sort_ALCOR

program="JARVIS3 l5 100MB sort_ALCOR"
bytes=$(ls sort_ALCOR* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' Alcor_sequence_size_100_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
#bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 5 --block=100MB sequence_model

program="JARVIS3 l5 100MB sequence_model"
bytes=$(ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}

#J3 -l 5 --block=10MB sort_fanalysis_ALCOR

program="JARVIS3 l5 10MB sort_fanalysis_ALCOR"
bytes=$(ls sort_fanalysis_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_10_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
#bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 5 --block=10MB sort_ALCOR.fa

program="JARVIS3 l5 10MB sort_ALCOR"
bytes=$(ls sort_ALCOR* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' Alcor_sequence_size_10_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
#bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 5 --block=10MB sequence_model.fasta

program="JARVIS3 l5 10MB sequence_model"
bytes=$(ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#LEVEL 1

#J3 -l 1 --block=1GB sort_fanalysis_ALCOR.fasta

program="JARVIS3 l1 1GB sort_fanalysis_ALCOR"
bytes=$(ls sort_fanalysis_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_1000_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
#bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 1 --block=1GB sort_ALCOR.fa

program="JARVIS3 l1 1GB sort_ALCOR"
bytes=$(ls sort_ALCOR* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' Alcor_sequence_size_1000_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
#bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 1 --block=1GB sequence_model.fasta

program="JARVIS3 l1 1GB sequence_model"
bytes=$(ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_1000_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 1 --block=100MB sort_fanalysis_ALCOR.fasta

program="JARVIS3 l1 100MB sort_fanalysis_ALCOR"
bytes=$(ls sort_fanalysis_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_100_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
#bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 1 --block=100MB sort_ALCOR.fa

program="JARVIS3 l1 100MB sort_ALCOR"
bytes=$(ls sort_ALCOR* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' Alcor_sequence_size_100_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
#bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 1 --block=100MB sequence_model.fasta

program="JARVIS3 l1 100MB sequence_model"
bytes=$(ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_100_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 1 --block=10MB sort_fanalysis_ALCOR.fasta

program="JARVIS3 l1 10MB sort_fanalysis_ALCOR"
bytes=$(ls sort_fanalysis_ALCOR* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' Alcor_sequence_size_10_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 1 --block=10MB sort_ALCOR.fa

program="JARVIS3 l1 10MB sort_ALCOR"
bytes=$(ls sort_ALCOR* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' Alcor_sequence_size_10_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 1 --block=10MB sequence_model.fasta

program="JARVIS3 l1 10MB sequence_model"
bytes=$(ls sequence_model* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' Alcor_sequence_size_10_l1.txt)
bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
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
"PROGRAM","BYTES","C_BYTES","BPS", "C_TIME (s)", "C_RAM(GB)", "D_TIME(s)", "D_MEM(GB)","DIFF,"RUN"
.
wq
EOF
}


file="data.csv"

{
ed -s "$file" <<EOF
1
i
"Dataset-ALCOR_generated_file",
.
wq
EOF
}





#LEVEL 15

#J3 -l 15 --block=1GB sort_fanalysis.fasta

program="JARVIS3 l15 1GB sort_fa"
bytes=$(ls sort_fa* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' cvbd_size_1000_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l15.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#bps=0
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 15 --block=1GB sort.fa

program="JARVIS3 l15 1GB sort"
bytes=$(ls sort* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' cvbd_size_1000_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l15.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 15 --block=1GB CVDB

program="JARVIS3 l15 1GB CVDB"
bytes=$(ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l15.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 15 --block=100MB sort_fanalysis.fasta

program="JARVIS3 l15 100MB sort_fa"
bytes=$(ls sort_fa* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' cvbd_size_100_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l15.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 15 --block=100MB sort.fa

program="JARVIS3 l15 100MB sort"
bytes=$(ls sort* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' cvdb_d_sort_fa_100_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvdb_d_sort_fa_100_l15.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 15 --block=100MB CVDB

program="JARVIS3 l15 100MB CVDB"
bytes=$(ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l15.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 15 --block=10MB sort_fanalysis.fasta

program="JARVIS3 l15 10MB sort_fa"
bytes=$(ls sort_fa* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' cvbd_size_10_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l15.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 15 --block=10MB sort.fa

program="JARVIS3 l15 10MB sort"
bytes=$(ls sort* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' cvbd_size_10_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l15.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 15 --block=10MB CVDB

program="JARVIS3 l15 10MB CVDB"
bytes=$(ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l15.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l15.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#LEVEL 10

#J3 -l 10 --block=1GB sort_fanalysis.fasta

program="JARVIS3 l10 1GB sort_fa"
bytes=$(ls sort_fa* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' cvbd_size_1000_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l10.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 10 --block=1GB sort.fa

program="JARVIS3 l10 1GB sort"
bytes=$(ls sort* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' cvbd_size_1000_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l10.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 10 --block=1GB CVDB

program="JARVIS3 l10 1GB CVDB"
bytes=$(ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l10.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 10 --block=100MB sort_fanalysis.fasta

program="JARVIS3 l10 100MB sort_fa"
bytes=$(ls sort_fa* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' cvbd_size_100_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l10.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 10 --block=100MB sort.fa

program="JARVIS3 l10 100MB sort"
bytes=$(ls sort* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' cvbd_size_100_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l10.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 10 --block=100MB CVDB

program="JARVIS3 l10 100MB CVDB"
bytes=$(ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l10.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 10 --block=10MB sort_fanalysis.fasta

program="JARVIS3 l10 10MB sort_fa"
bytes=$(ls sort_fa* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' cvbd_size_10_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l10.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 10 --block=10MB sort.fa

program="JARVIS3 l10 10MB sort"
bytes=$(ls sort* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' cvbd_size_10_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l10.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 10 --block=10MB CVDB

program="JARVIS3 l10 10MB CVDB"
bytes=$(ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l10.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l10.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#LEVEL 5

#J3 -l 5 --block=1GB sort_fan

program="JARVIS3 l5 1GB sort_fan"
bytes=$(ls sort_fa* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' cvbd_size_1000_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 5 --block=1GB sort.fa

program="JARVIS3 l5 1GB sort"
bytes=$(ls sort* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' cvbd_size_1000_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}




#J3 -l 5 --block=1GB CVDB

program="JARVIS3 l5 1GB CVDB"
bytes=$(ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 5 --block=100MB sort_fa

program="JARVIS3 l5 100MB sort_fa"
bytes=$(ls sort_fa* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' cvbd_size_100_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 5 --block=100MB sort

program="JARVIS3 l5 100MB sort"
bytes=$(ls sort* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' cvbd_size_100_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 5 --block=100MB CVDB

program="JARVIS3 l5 100MB CVDB"
bytes=$(ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}

#J3 -l 5 --block=10MB sort_fa

program="JARVIS3 l5 10MB sort_fa"
bytes=$(ls sort_fa* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' cvbd_size_10_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 5 --block=10MB sort.fa

program="JARVIS3 l5 10MB sort"
bytes=$(ls sort* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' cvbd_size_10_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 5 --block=10MB CVDB.fasta

program="JARVIS3 l5 10MB CVDB"
bytes=$(ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l5.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l5.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#LEVEL 1

#J3 -l 1 --block=1GB sort_fanalysis.fasta

program="JARVIS3 l1 1GB sort_fan"
bytes=$(ls sort_fan* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' cvdb_size_1000_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 1 --block=1GB sort.fa

program="JARVIS3 l1 1GB sort"
bytes=$(ls sort* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' cvdb_size_1000_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
#bps=0
c_time=$(awk 'FNR ==1 {print $2}' cvdb_sort_1000_l1.txt)
c_mem=$(awk 'FNR ==1 {print $4}' cvdb_sort_1000_l1.txt)
d_bytes=$(awk 'FNR ==2 {print $1}' cvbd_d_size_1000_l1.txt)
d_time=$(awk 'FNR ==1 {print $2}'cvdb_d_sort_1000_l1.txt)
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 1 --block=1GB CVDB.fasta

program="JARVIS3 l1 1GB CVDB"
bytes=$(ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' cvdb_size_1000_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_1000_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 1 --block=100MB sort_fanalysis.fasta

program="JARVIS3 l1 100MB sort_fan"
bytes=$(ls sort_fa* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' cvbd_size_100_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}



#J3 -l 1 --block=100MB sort.fa

program="JARVIS3 l1 100MB sort"
bytes=$(ls sort* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' cvbd_size_100_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 1 --block=100MB CVDB.fasta

program="JARVIS3 l1 100MB CVDB"
bytes=$(ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_100_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
#bps=$(echo "scale=3; ($c_bytes * 8) / $original_c_bytes" | bc)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 1 --block=10MB sort_fanalysis.fasta

program="JARVIS3 l1 10MB sort_fanalysis"
bytes=$(ls sort_fan* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==3 {print $1}' cvbd_size_10_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 1 --block=10MB sort.fa

program="JARVIS3 l1 10MB sort"
bytes=$(ls sort* -la -ltr | grep \.fa$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==2 {print $1}' cvbd_size_10_l1.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l1.txt)
#bps=$((($c_bytes *8) / $original_c_bytes))
#bps=$(printf %.2f%% "$((10**3 * 100 * ($c_bytes *8)/$original_c_bytes))e-3")
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
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
$program,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


#J3 -l 1 --block=10MB CVDB.fasta

program="JARVIS3 l1 10MB"
bytes=$(ls CVDB* -la -ltr | grep \.fasta$ |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' cvbd_size_10_l1.txt)
bps_original=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
bps_final=$bps_original
#gain=$(printf %.2f%% "$((10**3 * 100 * $c_bytes/$original_c_bytes))e-3")
gain=0
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
$program;$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}


file="data.csv"

{
ed -s "$file" <<EOF
1
i
"PROGRAM","BYTES","C_BYTES","BPS_original","BPS_final","GAIN","C_TIME (s)","C_RAM(GB)", "D_TIME(s)", "D_MEM(GB)","DIFF","RUN",
.
wq
EOF
}


file="data.csv"

{
ed -s "$file" <<EOF
1
i
"Dataset-CVDB",
.
wq
EOF
}


