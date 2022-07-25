CC = g++
CFLAGS = -g -Wall
TARGET= FASTA_ANALY


fasta_analysis: fasta_analysis.o msg.o
	$(CC) -o $(TARGET) fasta_analysis_without_aux_files.o msg.o
fasta_analysis.o: fasta_analysis_without_aux_files.cpp fasta_analysis.hpp msg.hpp
	$(CC) -c fasta_analysis_without_aux_files.cpp fasta_analysis.hpp
	$(CC) -c msg.cpp msg.hpp

