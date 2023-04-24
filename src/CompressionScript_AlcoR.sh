#Generate a set of sequences with seed between 1 and 100 and subs and adds varying between 0.1 and 5%
#rm sequence.fasta
rm sequence_model.fasta
rm shuffled.fasta.gz
rm ordered_sequence_model_size.fasta.gz
rm ordered_sequence_model_AT.fasta.gz
rm ordered_sequence_model_CG.fasta.gz
rm ordered_shuffled_size.fasta.gz
rm ordered_shuffled_AT.fasta.gz
rm ordered_shuffled_CG.fasta.gz



AlcoR simulation -rs  10000:0:1:0:0:0 > sequence_1.fasta
AlcoR simulation -rs  20000:0:3:0:0:0 > sequence_2.fasta
AlcoR simulation -rs  30000:0:5:0:0:0 > sequence_3.fasta
AlcoR simulation -rs  40000:0:7:0:0:0 > sequence_4.fasta
AlcoR simulation -rs  50000:0:11:0:0:0 > sequence_5.fasta
AlcoR simulation -rs  60000:0:13:0:0:0 > sequence_6.fasta
AlcoR simulation -rs  70000:0:17:0:0:0 > sequence_7.fasta
AlcoR simulation -rs  80000:0:19:0:0:0 > sequence_8.fasta
AlcoR simulation -rs  90000:0:23:0:0:0 > sequence_9.fasta
AlcoR simulation -rs  100000:0:29:0:0:0 > sequence_10.fasta
AlcoR simulation -rs  110000:0:31:0:0:0 > sequence_11.fasta
AlcoR simulation -rs  120000:0:37:0:0:0 > sequence_12.fasta
AlcoR simulation -rs  130000:0:41:0:0:0 > sequence_13.fasta
AlcoR simulation -rs  140000:0:43:0:0:0 > sequence_14.fasta
AlcoR simulation -rs  150000:0:47:0:0:0 > sequence_15.fasta
AlcoR simulation -rs  160000:0:53:0:0:0 > sequence_16.fasta
AlcoR simulation -rs  170000:0:59:0:0:0 > sequence_17.fasta
AlcoR simulation -rs  180000:0:61:0:0:0 > sequence_18.fasta
AlcoR simulation -rs  190000:0:67:0:0:0 > sequence_19.fasta
AlcoR simulation -rs  200000:0:71:0:0:0 > sequence_20.fasta
AlcoR simulation -rs  210000:0:73:0:0:0 > sequence_21.fasta
AlcoR simulation -rs  220000:0:79:0:0:0 > sequence_22.fasta
AlcoR simulation -rs  230000:0:83:0:0:0 > sequence_23.fasta
AlcoR simulation -rs  240000:0:89:0:0:0 > sequence_24.fasta
AlcoR simulation -rs  250000:0:97:0:0:0 > sequence_25.fasta
AlcoR simulation -rs  260000:0:101:0:0:0 > sequence_26.fasta
AlcoR simulation -rs  270000:0:103:0:0:0 > sequence_27.fasta
AlcoR simulation -rs  280000:0:107:0:0:0 > sequence_28.fasta
AlcoR simulation -rs  290000:0:109:0:0:0 > sequence_29.fasta
AlcoR simulation -rs  300000:0:113:0:0:0 > sequence_30.fasta
AlcoR simulation -rs  310000:0:127:0:0:0 > sequence_31.fasta
AlcoR simulation -rs  320000:0:139:0:0:0 > sequence_32.fasta
AlcoR simulation -rs  330000:0:149:0:0:0 > sequence_33.fasta
AlcoR simulation -rs  340000:0:151:0:0:0 > sequence_34.fasta
AlcoR simulation -rs  350000:0:157:0:0:0 > sequence_35.fasta
AlcoR simulation -rs  360000:0:163:0:0:0 > sequence_36.fasta
AlcoR simulation -rs  370000:0:167:0:0:0 > sequence_37.fasta
AlcoR simulation -rs  380000:0:173:0:0:0 > sequence_38.fasta
AlcoR simulation -rs  390000:0:179:0:0:0 > sequence_39.fasta
AlcoR simulation -rs  400000:0:181:0:0:0 > sequence_40.fasta
AlcoR simulation -rs  410000:0:191:0:0:0 > sequence_41.fasta
AlcoR simulation -rs  420000:0:193:0:0:0 > sequence_42.fasta
AlcoR simulation -rs  430000:0:197:0:0:0 > sequence_43.fasta
AlcoR simulation -rs  440000:0:199:0:0:0 > sequence_44.fasta
AlcoR simulation -rs  450000:0:211:0:0:0 > sequence_45.fasta
AlcoR simulation -rs  460000:0:223:0:0:0 > sequence_46.fasta
AlcoR simulation -rs  470000:0:227:0:0:0 > sequence_47.fasta
AlcoR simulation -rs  480000:0:229:0:0:0 > sequence_48.fasta
AlcoR simulation -rs  490000:0:233:0:0:0 > sequence_49.fasta
AlcoR simulation -rs  500000:0:239:0:0:0 > sequence_50.fasta
AlcoR simulation -rs  510000:0:241:0:0:0 > sequence_51.fasta
AlcoR simulation -rs  520000:0:251:0:0:0 > sequence_52.fasta
AlcoR simulation -rs  530000:0:257:0:0:0 > sequence_53.fasta
AlcoR simulation -rs  540000:0:263:0:0:0 > sequence_54.fasta
AlcoR simulation -rs  550000:0:269:0:0:0 > sequence_55.fasta
AlcoR simulation -rs  560000:0:271:0:0:0 > sequence_56.fasta
AlcoR simulation -rs  570000:0:277:0:0:0 > sequence_57.fasta
AlcoR simulation -rs  580000:0:281:0:0:0 > sequence_58.fasta
AlcoR simulation -rs  590000:0:283:0:0:0 > sequence_59.fasta
AlcoR simulation -rs  600000:0:293:0:0:0 > sequence_60.fasta
AlcoR simulation -rs  610000:0:307:0:0:0 > sequence_61.fasta
AlcoR simulation -rs  620000:0:311:0:0:0 > sequence_62.fasta
AlcoR simulation -rs  630000:0:313:0:0:0 > sequence_63.fasta
AlcoR simulation -rs  640000:0:317:0:0:0 > sequence_64.fasta
AlcoR simulation -rs  650000:0:331:0:0:0 > sequence_65.fasta
AlcoR simulation -rs  660000:0:337:0:0:0 > sequence_66.fasta
AlcoR simulation -rs  670000:0:347:0:0:0 > sequence_67.fasta
AlcoR simulation -rs  680000:0:349:0:0:0 > sequence_68.fasta
AlcoR simulation -rs  690000:0:353:0:0:0 > sequence_69.fasta
AlcoR simulation -rs  700000:0:359:0:0:0 > sequence_70.fasta
AlcoR simulation -rs  710000:0:367:0:0:0 > sequence_71.fasta
AlcoR simulation -rs  720000:0:373:0:0:0 > sequence_72.fasta
AlcoR simulation -rs  730000:0:379:0:0:0 > sequence_73.fasta
AlcoR simulation -rs  740000:0:383:0:0:0 > sequence_74.fasta
AlcoR simulation -rs  750000:0:389:0:0:0 > sequence_75.fasta
AlcoR simulation -rs  760000:0:397:0:0:0 > sequence_76.fasta
AlcoR simulation -rs  770000:0:401:0:0:0 > sequence_77.fasta
AlcoR simulation -rs  780000:0:409:0:0:0 > sequence_78.fasta
AlcoR simulation -rs  790000:0:419:0:0:0 > sequence_79.fasta
AlcoR simulation -rs  800000:0:421:0:0:0 > sequence_80.fasta
AlcoR simulation -rs  810000:0:431:0:0:0 > sequence_81.fasta
AlcoR simulation -rs  820000:0:433:0:0:0 > sequence_82.fasta
AlcoR simulation -rs  830000:0:439:0:0:0 > sequence_83.fasta
AlcoR simulation -rs  840000:0:443:0:0:0 > sequence_84.fasta
AlcoR simulation -rs  850000:0:449:0:0:0 > sequence_85.fasta
AlcoR simulation -rs  860000:0:457:0:0:0 > sequence_86.fasta
AlcoR simulation -rs  870000:0:461:0:0:0 > sequence_87.fasta
AlcoR simulation -rs  880000:0:463:0:0:0 > sequence_88.fasta
AlcoR simulation -rs  890000:0:467:0:0:0 > sequence_89.fasta
AlcoR simulation -rs  900000:0:479:0:0:0 > sequence_90.fasta
AlcoR simulation -rs  910000:0:487:0:0:0 > sequence_91.fasta
AlcoR simulation -rs  920000:0:491:0:0:0 > sequence_92.fasta
AlcoR simulation -rs  930000:0:499:0:0:0 > sequence_93.fasta
AlcoR simulation -rs  940000:0:503:0:0:0 > sequence_94.fasta
AlcoR simulation -rs  950000:0:509:0:0:0 > sequence_95.fasta
AlcoR simulation -rs  960000:0:521:0:0:0 > sequence_96.fasta
AlcoR simulation -rs  970000:0:523:0:0:0 > sequence_97.fasta
AlcoR simulation -rs  980000:0:541:0:0:0 > sequence_98.fasta
AlcoR simulation -rs  990000:0:547:0:0:0 > sequence_99.fasta
AlcoR simulation -rs  1000000:0:557:0:0:0 > sequence_100.fasta
AlcoR simulation -rs  1010000:0:563:0:0:0 > sequence_101.fasta
AlcoR simulation -rs  1020000:0:569:0:0:0 > sequence_102.fasta
AlcoR simulation -rs  1030000:0:571:0:0:0 > sequence_103.fasta
AlcoR simulation -rs  1040000:0:577:0:0:0 > sequence_104.fasta
AlcoR simulation -rs  1050000:0:587:0:0:0 > sequence_105.fasta
AlcoR simulation -rs  1060000:0:593:0:0:0 > sequence_106.fasta
AlcoR simulation -rs  1070000:0:599:0:0:0 > sequence_107.fasta
AlcoR simulation -rs  1080000:0:601:0:0:0 > sequence_108.fasta
AlcoR simulation -rs  1090000:0:607:0:0:0 > sequence_109.fasta
AlcoR simulation -rs  1100000:0:613:0:0:0 > sequence_110.fasta
AlcoR simulation -rs  1110000:0:617:0:0:0 > sequence_111.fasta
AlcoR simulation -rs  1120000:0:619:0:0:0 > sequence_112.fasta
AlcoR simulation -rs  1130000:0:631:0:0:0 > sequence_113.fasta
AlcoR simulation -rs  1140000:0:641:0:0:0 > sequence_114.fasta
AlcoR simulation -rs  1150000:0:643:0:0:0 > sequence_115.fasta
AlcoR simulation -rs  1160000:0:647:0:0:0 > sequence_116.fasta
AlcoR simulation -rs  1170000:0:653:0:0:0 > sequence_117.fasta
AlcoR simulation -rs  1180000:0:659:0:0:0 > sequence_118.fasta
AlcoR simulation -rs  1190000:0:661:0:0:0 > sequence_119.fasta
AlcoR simulation -rs  1200000:0:673:0:0:0 > sequence_120.fasta
AlcoR simulation -rs  1210000:0:677:0:0:0 > sequence_121.fasta
AlcoR simulation -rs  1220000:0:683:0:0:0 > sequence_122.fasta
AlcoR simulation -rs  1230000:0:691:0:0:0 > sequence_123.fasta
AlcoR simulation -rs  1240000:0:701:0:0:0 > sequence_124.fasta
AlcoR simulation -rs  1250000:0:709:0:0:0 > sequence_125.fasta
AlcoR simulation -rs  1260000:0:719:0:0:0 > sequence_126.fasta
AlcoR simulation -rs  1270000:0:727:0:0:0 > sequence_127.fasta
AlcoR simulation -rs  1280000:0:733:0:0:0 > sequence_128.fasta
AlcoR simulation -rs  1290000:0:739:0:0:0 > sequence_129.fasta
AlcoR simulation -rs  1300000:0:743:0:0:0 > sequence_130.fasta
AlcoR simulation -rs  1310000:0:751:0:0:0 > sequence_131.fasta
AlcoR simulation -rs  1320000:0:761:0:0:0 > sequence_132.fasta
AlcoR simulation -rs  1330000:0:769:0:0:0 > sequence_133.fasta
AlcoR simulation -rs  1340000:0:773:0:0:0 > sequence_134.fasta
AlcoR simulation -rs  1350000:0:787:0:0:0 > sequence_135.fasta
AlcoR simulation -rs  1360000:0:797:0:0:0 > sequence_136.fasta
AlcoR simulation -rs  1370000:0:809:0:0:0 > sequence_137.fasta
AlcoR simulation -rs  1380000:0:811:0:0:0 > sequence_138.fasta
AlcoR simulation -rs  1390000:0:821:0:0:0 > sequence_139.fasta
AlcoR simulation -rs  1400000:0:823:0:0:0 > sequence_140.fasta
AlcoR simulation -rs  1410000:0:827:0:0:0 > sequence_141.fasta
AlcoR simulation -rs  1420000:0:829:0:0:0 > sequence_142.fasta
AlcoR simulation -rs  1430000:0:839:0:0:0 > sequence_143.fasta
AlcoR simulation -rs  1440000:0:853:0:0:0 > sequence_144.fasta
AlcoR simulation -rs  1450000:0:857:0:0:0 > sequence_145.fasta
AlcoR simulation -rs  1460000:0:859:0:0:0 > sequence_146.fasta
AlcoR simulation -rs  1470000:0:863:0:0:0 > sequence_147.fasta
AlcoR simulation -rs  1480000:0:877:0:0:0 > sequence_148.fasta
AlcoR simulation -rs  1490000:0:881:0:0:0 > sequence_149.fasta
AlcoR simulation -rs  1500000:0:883:0:0:0 > sequence_150.fasta
AlcoR simulation -rs  1510000:0:887:0:0:0 > sequence_151.fasta
AlcoR simulation -rs  1520000:0:907:0:0:0 > sequence_152.fasta
AlcoR simulation -rs  1530000:0:911:0:0:0 > sequence_153.fasta
AlcoR simulation -rs  1540000:0:919:0:0:0 > sequence_154.fasta
AlcoR simulation -rs  1550000:0:929:0:0:0 > sequence_155.fasta
AlcoR simulation -rs  1560000:0:937:0:0:0 > sequence_156.fasta
AlcoR simulation -rs  1570000:0:941:0:0:0 > sequence_157.fasta
AlcoR simulation -rs  1580000:0:947:0:0:0 > sequence_158.fasta
AlcoR simulation -rs  1590000:0:953:0:0:0 > sequence_159.fasta
AlcoR simulation -rs  1600000:0:967:0:0:0 > sequence_160.fasta
AlcoR simulation -rs  1610000:0:971:0:0:0 > sequence_161.fasta
AlcoR simulation -rs  1620000:0:977:0:0:0 > sequence_162.fasta
AlcoR simulation -rs  1630000:0:983:0:0:0 > sequence_163.fasta
AlcoR simulation -rs  1640000:0:991:0:0:0 > sequence_164.fasta
AlcoR simulation -rs  1650000:0:997:0:0:0 > sequence_165.fasta
AlcoR simulation -rs  1660000:0:1009:0:0:0 > sequence_166.fasta
AlcoR simulation -rs  1670000:0:1013:0:0:0 > sequence_167.fasta
AlcoR simulation -rs  1680000:0:1019:0:0:0 > sequence_168.fasta
AlcoR simulation -rs  1690000:0:1021:0:0:0 > sequence_169.fasta
AlcoR simulation -rs  1700000:0:1031:0:0:0 > sequence_170.fasta
AlcoR simulation -rs  1710000:0:1033:0:0:0 > sequence_171.fasta
AlcoR simulation -rs  1720000:0:1039:0:0:0 > sequence_172.fasta
AlcoR simulation -rs  1730000:0:1049:0:0:0 > sequence_173.fasta
AlcoR simulation -rs  1740000:0:1051:0:0:0 > sequence_174.fasta
AlcoR simulation -rs  1750000:0:1061:0:0:0 > sequence_175.fasta
AlcoR simulation -rs  1760000:0:1063:0:0:0 > sequence_176.fasta
AlcoR simulation -rs  1770000:0:1069:0:0:0 > sequence_177.fasta
AlcoR simulation -rs  1780000:0:1087:0:0:0 > sequence_178.fasta
AlcoR simulation -rs  1790000:0:1091:0:0:0 > sequence_179.fasta
AlcoR simulation -rs  1800000:0:1093:0:0:0 > sequence_180.fasta
AlcoR simulation -rs  1810000:0:1097:0:0:0 > sequence_181.fasta
AlcoR simulation -rs  1820000:0:1103:0:0:0 > sequence_182.fasta
AlcoR simulation -rs  1830000:0:1109:0:0:0 > sequence_183.fasta
AlcoR simulation -rs  1840000:0:1117:0:0:0 > sequence_184.fasta
AlcoR simulation -rs  1850000:0:1123:0:0:0 > sequence_185.fasta
AlcoR simulation -rs  1860000:0:1129:0:0:0 > sequence_186.fasta
AlcoR simulation -rs  1870000:0:1151:0:0:0 > sequence_187.fasta
AlcoR simulation -rs  1880000:0:1153:0:0:0 > sequence_188.fasta
AlcoR simulation -rs  1890000:0:1163:0:0:0 > sequence_189.fasta
AlcoR simulation -rs  1900000:0:1171:0:0:0 > sequence_190.fasta
AlcoR simulation -rs  1910000:0:1181:0:0:0 > sequence_191.fasta
AlcoR simulation -rs  1920000:0:1187:0:0:0 > sequence_192.fasta
AlcoR simulation -rs  1930000:0:1193:0:0:0 > sequence_193.fasta
AlcoR simulation -rs  1940000:0:1201:0:0:0 > sequence_194.fasta
AlcoR simulation -rs  1950000:0:1213:0:0:0 > sequence_195.fasta
AlcoR simulation -rs  1960000:0:1217:0:0:0 > sequence_196.fasta
AlcoR simulation -rs  1970000:0:1223:0:0:0 > sequence_197.fasta
AlcoR simulation -rs  1980000:0:1229:0:0:0 > sequence_198.fasta
AlcoR simulation -rs  1990000:0:1231:0:0:0 > sequence_199.fasta
AlcoR simulation -rs  2000000:0:1237:0:0:0 > sequence_200.fasta




#declare p prime_values

#for i in ${!fasta_arr[@]}; do

 #   time echo "$((${fasta_arr[i]}))"
#prime_values={ 2 , 3 , 5 , 7 , 11 , 13 , 17 , 19 , 23 , 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557 }
#for x in {1..100}
#do
  #for i in ${!prime_values[@]}; do
 # for y in ${prime_values[@]}
 # do
 # size=$((1000*$x))
 # echo $y
 # AlcoR simulation -rs  $size:0:$y:0:0:0 > sequence_$x.fasta
 #done
#done




#index=1
for x  in {1..10}
do
 for y in {0..1}
 do
   for z in {1..200}
   do
    size=$((10000*$z))
    echo $size
    AlcoR simulation -fs 1:$size:0:$x:0.0$y:0:0:sequence_$z.fasta >> sequence_model.fasta
        done
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
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -1 -t 1 ordered_sequence_model.fasta ; } 2>>mf_compresstimes_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -1 -t 1 ordered_sequence_model_AT.fasta ; } 2>>mf_compresstimes_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -1 -t 1 ordered_sequence_model_CG.fasta ; } 2>>mf_compresstimes_s3.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -1 -t 1 ordered_shuffled_size.fasta ; } 2>>mf_compresstimes_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -1 -t 1 ordered_shuffled_AT.fasta ; } 2>>mf_compresstimes_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -1 -t 1 ordered_shuffled_CG.fasta ; } 2>>mf_compresstimes_s4.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -1 -t 1 sequence_model.fasta.mfc ; } 2>>mf_decompresstimes.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -1 -t 1 shuffled.fasta.mfc ; } 2>>mf_decompresstimes_s2.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -1 -t 1 ordered_sequence_model_size.fasta.mfc ; } 2>>mf_decompresstimes_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -1 -t 1 ordered_sequence_model_AT.fasta.mfc ; } 2>>mf_decompresstimes_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -1 -t 1 ordered_sequence_model_CG.fasta.mfc ; } 2>>mf_decompresstimes_s3.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -1 -t 1 ordered_shuffled_size.fasta.mfc ; } 2>>mf_decompresstimes_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -1 -t 1 ordered_shuffled_AT.fasta.mfc ; } 2>>mf_decompresstimes_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -1 -t 1 ordered_shuffled_CG.fasta.mfc ; } 2>>mf_decompresstimes_s4.txt


#NAF
{ /bin/time -f "TIME\t%e\tMEM\t%M" ennaf --strict --temp-dir tmp/ --dna --level 22 sequence_model.fasta  ; } 2>>naf_times.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf sequence_model.fasta.naf -o sequence_model_naf.fasta ; } 2>>unnaf_times.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ennaf --strict --temp-dir tmp/ --dna --level 22 shuffled.fasta ; } 2>>naf_times_s2.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf shuffled.fasta.naf -o shuffled_naf.fasta ; } 2>>unnaf_times_s2.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level 22 ordered_sequence_model_size.fasta ; } 2>>naf_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ennaf --strict --temp-dir tmp/ --dna --level 22 ordered_sequence_model_AT.fasta ; } 2>>naf_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" ennaf --strict --temp-dir tmp/ --dna --level 22 ordered_sequence_model_CG.fasta  ; } 2>>naf_times_s3.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf  ordered_sequence_model_size.fasta.naf -o ordered_sequence_model_size_naf.fasta ; } 2>>unnaf_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf  ordered_sequence_model_AT.fasta.naf -o ordered_sequence_model_AT_naf.fasta ; } 2>>unnaf_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf  ordered_sequence_model_CG.fasta.naf -o ordered_sequence_model_CG_naf.fasta ; } 2>>unnaf_times_s3.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level 22  ordered_shuffled_size.fasta ; } 2>>naf_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level 22 ordered_shuffled_AT.fasta  ; } 2>>naf_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level 22 ordered_shuffled_CG.fasta ; } 2>>naf_times_s4.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf ordered_shuffled_size.fasta.naf -o ordered_shuffled_size_naf.fasta ; } 2>>unnaf_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf ordered_shuffled_AT.fasta.naf -o ordered_shuffled_AT_naf.fasta ; } 2>>unnaf_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf ordered_shuffled_CG.fasta.naf -o ordered_shuffled_CG_naf.fasta ; } 2>>unnaf_times_s4.txt


#MFCompress

#GZIP

{ /bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 sequence_model.fasta ; } 2>>gzip_times.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c sequence_model.fasta.gz >sequence_model_gz.fasta  ; } 2>>gunzip_times.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 shuffled.fasta ; } 2>>gzip_times_s2.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c shuffled.fasta.gz >shuffled_gz.fasta ; } 2>>gunzip_times_s2.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 ordered_sequence_model_size.fasta y ; } 2>>gzip_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 ordered_sequence_model_AT.fasta y ; } 2>>gzip_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 ordered_sequence_model_CG.fasta y ; } 2>>gzip_times_s3.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c ordered_sequence_model_size.fasta.gz >ordered_sequence_model_size_gz.fasta  ; } 2>>gunzip_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c ordered_sequence_model_AT.fasta.gz >ordered_sequence_model_AT_gz.fasta   ; } 2>>gunzip_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c ordered_sequence_model_CG.fasta.gz >ordered_sequence_model_CG_gz.fasta  ; } 2>>gunzip_times_s3.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 ordered_shuffled_size.fasta y ; } 2>>gzip_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 ordered_shuffled_AT.fasta y ; } 2>>gzip_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gzip -k -9 ordered_shuffled_CG.fasta y ; } 2>>gzip_times_s4.txt


{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c ordered_shuffled_size.fasta.gz >ordered_shuffled_size_gz.fasta  ; } 2>>gunzip_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c ordered_shuffled_AT.fasta.gz >ordered_shuffled_AT_gz.fasta ; } 2>>gunzip_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c ordered_shuffled_CG.fasta.gz >ordered_shuffled_CG_gz.fasta ; } 2>>gunzip_times_s4.txt


#LZMA
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k -z sequence_model.fasta ; } 2>>lzma_times.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  sequence_model.fasta.lzma ; } 2>>lzma_decompress_times.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k shuffled.fasta ; } 2>> lzma_times_s2.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  shuffled.fasta.lzma ; } 2>> lzma_decompress_times_s2.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k ordered_sequence_model_size.fasta ; } 2>> lzma_times_s3.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k ordered_sequence_model_AT.fasta ; } 2>> lzma_times_s3.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k ordered_sequence_model_CG.fasta ; } 2>> lzma_times_s3.txt;

{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  ordered_sequence_model_size.fasta.lzma ; } 2>> lzma_decompress_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  ordered_sequence_model_AT.fasta.lzma ; } 2>> lzma_decompress_times_s3.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  ordered_sequence_model_CG.fasta.lzma ; } 2>> lzma_decompress_times_s3.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k ordered_shuffled_size.fasta ; } 2>> lzma_times_s4.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k ordered_shuffled_AT.fasta ; } 2>> lzma_times_s4.txt;
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -9 -f -k ordered_shuffled_CG.fasta ; } 2>> lzma_times_s4.txt;

{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  ordered_shuffled_size.fasta.lzma ; } 2>> lzma_decompress_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  ordered_shuffled_AT.fasta.lzma ; } 2>> lzma_decompress_times_s4.txt
{ /bin/time -f "TIME\t%e\tMEM\t%M" lzma -f -k -d  ordered_shuffled_CG.fasta.lzma ; } 2>> lzma_decompress_times_s4.txt




