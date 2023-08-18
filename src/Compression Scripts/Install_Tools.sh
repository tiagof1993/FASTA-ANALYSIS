#!/bin/bash
#
# Manual Installation
#
# MFC --------------------------------------------------------------------------
#
rm MFCompress-linux64-1.01.tgz MFCompress-linux64-1.01/ -fr
wget http://sweet.ua.pt/ap/software/mfcompress/MFCompress-linux64-1.01.tgz
tar -xvzf MFCompress-linux64-1.01.tgz
cp MFCompress-linux64-1.01/MFCompressC .
cp MFCompress-linux64-1.01/MFCompressD .
#
# JARVIS3 ----------------------------------------------------------------------
#
#rm -rf JARVIS2-bin-64-Linux.zip extra JARVIS2.sh JARVIS2-bin-64-Linux/
#wget https://github.com/cobioders/HumanGenome/raw/main/bin/JARVIS2-bin-64-Linux.zip
wget https://github.com/cobilab/jarvis3/archive/refs/heads/main.zip
unzip -o jarvis3-main.zip
cd jarvis3-main/src/
./JARVIS3.sh --install
cd ..
cd ..
cp /jarvis3-main/src/JARVIS3.sh .
cp /jarvis3-main/src/JARVIS3 .
cp /jarvis3-main/src/MergeFastaStreamsJ3 .
cp /jarvis3-main/src/MergeFastqStreamsJ3 .
cp /jarvis3-main/src/SplitFastaStreamsJ3 .
cp /jarvis3-main/src/SplitFastqStreamsJ3 .
cp /jarvis3-main/src/bbb .
cp /jarvis3-main/src/bzip2 .
#
#
# LZMA ----------------------------------------------------------------------
#
sudo apt-get update -y
sudo apt-get install -y lzma
#
# MBGC ----------------------------------------------------------------------
#
git clone https://github.com/kowallus/mbgc.git
cd mbgc
mkdir -p build
cd build
cmake ..
make mbgc
cd ../../
mv mbgc mbgc_dir # rename mbgc directory to move mbgc executable to scripts
cp mbgc_dir/build/mbgc .
rm -fr mbgc_dir
#
# MFCompressC ----------------------------------------------------------------------
#
rm -fr MFCompress-linux64-1.01.tgz MFCompress-linux64-1.01/
wget http://sweet.ua.pt/ap/software/mfcompress/MFCompress-linux64-1.01.tgz
tar -xvzf MFCompress-linux64-1.01.tgz
cp MFCompress-linux64-1.01/MFCompressC .
cp MFCompress-linux64-1.01/MFCompressD .
rm -fr MFCompress-linux64-1.01/ MFCompress-linux64-1.01.tgz
#
# NAF ----------------------------------------------------------------------
#
git clone --recurse-submodules https://github.com/KirillKryukov/naf.git
cd naf && make && make test && sudo make install
cp ennaf/ennaf ../
cp unnaf/unnaf ../
cd ../
rm -fr naf
# cp JARVIS2-bin-64-Linux/extra/* .
# cp JARVIS2-bin-64-Linux/JARVIS2.sh .
# cp JARVIS2-bin-64-Linux/JARVIS2 .
#
# ------------------------------------------------------------------------------