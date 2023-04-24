rm sequence_model.fasta
rm shuffled.fasta.gz
rm ordered_sequence_model_size.fasta.gz
rm ordered_sequence_model_AT.fasta.gz
rm ordered_sequence_model_CG.fasta.gz
rm ordered_shuffled_size.fasta.gz
rm ordered_shuffled_AT.fasta.gz
rm ordered_shuffled_CG.fasta.gz


AlcoR simulation -rs  1000:0:1:0:0:0 > sequence_a.fasta
AlcoR simulation -rs  2000:0:3:0:0:0 > sequence_b.fasta
AlcoR simulation -rs  3000:0:3:0:0:0 > sequence_c.fasta
AlcoR simulation -rs  4000:0:3:0:0:0 > sequence_d.fasta
AlcoR simulation -rs  5000:0:5:0:0:0 > sequence_e.fasta
AlcoR simulation -rs  6000:0:5:0:0:0 > sequence_f.fasta
AlcoR simulation -rs  7000:0:5:0:0:0 > sequence_g.fasta
AlcoR simulation -rs  7500:0:7:0:0:0 > sequence_h.fasta
AlcoR simulation -rs 10000:0:11:0:0:0 > sequence_i.fasta
AlcoR simulation -rs 11000:0:11:0:0:0 > sequence_j.fasta
AlcoR simulation -rs 12500:0:13:0:0:0 > sequence_k.fasta
AlcoR simulation -rs 14000:0:13:0:0:0 > sequence_l.fasta
AlcoR simulation -rs 15000:0:17:0:0:0 > sequence_m.fasta
AlcoR simulation -rs 16000:0:17:0:0:0 > sequence_n.fasta
AlcoR simulation -rs 17500:0:21:0:0:0 > sequence_o.fasta
AlcoR simulation -rs 19000:0:23:0:0:0 > sequence_p.fasta
AlcoR simulation -rs 20000:0:23:0:0:0 > sequence_q.fasta
AlcoR simulation -rs 21000:0:23:0:0:0 > sequence_r.fasta
AlcoR simulation -rs 30000:0:23:0:0:0 > sequence_s.fasta
AlcoR simulation -rs 40000:0:23:0:0:0 > sequence_t.fasta
AlcoR simulation -rs 50000:0:29:0:0:0 > sequence_u.fasta
AlcoR simulation -rs 75000:0:29:0:0:0 > sequence_v.fasta
AlcoR simulation -rs 100000:0:31:0:0:0 > sequence_w.fasta
AlcoR simulation -rs 125000:0:31:0:0:0 > sequence_x.fasta
AlcoR simulation -rs 150000:0:37:0:0:0 > sequence_y.fasta
AlcoR simulation -rs 175000:0:37:0:0:0 > sequence_z.fasta
AlcoR simulation -rs 200000:0:41:0:0:0 > sequence_aa.fasta
AlcoR simulation -rs 500000:0:41:0:0:0 > sequence_ab.fasta

#index=1
for x  in {1..500}
do
 for y in {0..10}
 do
    # shellcheck disable=SC2129
    AlcoR simulation -fs 1:1000:0:$x:0.0$y:0:0:sequence_a.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:2000:0:$x:0.0$y:0:0:sequence_b.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:3000:0:$x:0.0$y:0:0:sequence_c.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:4000:0:$x:0.0$y:0:0:sequence_d.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:5000:0:$x:0.0$y:0:0:sequence_e.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:6000:0:$x:0.0$y:0:0:sequence_f.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:7000:0:$x:0.0$y:0:0:sequence_g.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:7500:0:$x:0.0$y:0:0:sequence_h.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:10000:0:$x:0.0$y:0:0:sequence_i.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:11000:0:$x:0.0$y:0:0:sequence_j.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:12500:0:$x:0.0$y:0:0:sequence_k.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:14000:0:$x:0.0$y:0:0:sequence_l.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:15000:0:$x:0.0$y:0:0:sequence_m.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:16000:0:$x:0.0$y:0:0:sequence_n.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:17500:0:$x:0.0$y:0:0:sequence_o.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:19000:0:$x:0.0$y:0:0:sequence_p.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:20000:0:$x:0.0$y:0:0:sequence_q.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:21000:0:$x:0.0$y:0:0:sequence_r.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:30000:0:$x:0.0$y:0:0:sequence_s.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:40000:0:$x:0.0$y:0:0:sequence_t.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:50000:0:$x:0.0$y:0:0:sequence_u.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:75000:0:$x:0.0$y:0:0:sequence_v.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:100000:0:$x:0.0$y:0:0:sequence_w.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:125000:0:$x:0.0$y:0:0:sequence_x.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:150000:0:$x:0.0$y:0:0:sequence_y.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:175000:0:$x:0.0$y:0:0:sequence_z.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:200000:0:$x:0.0$y:0:0:sequence_aa.fasta >> sequence_model.fasta
    AlcoR simulation -fs 1:500000:0:$x:0.0$y:0:0:sequence_ab.fasta >> sequence_model.fasta
       
       done
     done
####    
sed -i '/^$/d' sequence_model.fasta  

#Shuffle
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -s sequence_model.fasta shuffled.fasta 5 ; } 2>>shuffle_times.txt

#Sorting
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=S sequence_model.fasta ordered_sequence_model_size.fasta 5 ; } 2>>ordering_times.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=AT sequence_model.fasta ordered_sequence_model_AT.fasta 5 ; } 2>>ordering_times.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=CG sequence_model.fasta ordered_sequence_model_CG.fasta 5 ; } 2>>ordering_times.txt

#Shuffle + Sort
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=S shuffled.fasta ordered_shuffled_size.fasta 5 ; } 2>>ordering_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=AT shuffled.fasta ordered_shuffled_AT.fasta 5 ; } 2>>ordering_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./FASTA_ANALY -sort=CG shuffled.fasta ordered_shuffled_CG.fasta 5 ; } 2>>ordering_times_s4.txt


{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -1 -t 1 sequence_model.fasta ; } 2>>mf_compresstimes.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -1 -t 1 shuffled.fasta ; } 2>>mf_compresstimes_s2.txt


{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -1 -t 1 ordered_sequence_model_size.fasta ; } 2>>mf_compresstimes_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -1 -t 1 ordered_sequence_model_AT.fasta ; } 2>>mf_compresstimes_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -1 -t 1 ordered_sequence_model_CG.fasta ; } 2>>mf_compresstimes_s3.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -1 -t 1 ordered_shuffled_size.fasta ; } 2>>mf_compresstimes_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -1 -t 1 ordered_shuffled_AT.fasta ; } 2>>mf_compresstimes_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -1 -t 1 ordered_shuffled_CG.fasta ; } 2>>mf_compresstimes_s4.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -1 -t 1 sequence_model.fasta.mfc ; } 2>>mf_decompresstimes.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -1 -t 1 shuffled.fasta.mfc ; } 2>>mf_decompresstimes_s2.txt
