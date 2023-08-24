# FASTA_ANALYSIS

The objective of this project is to find an improved way to compress files with genomic sequences (fasta,fa,etc). For that we already have a plentitude of compressing tools available in the market, such as NAF,MBGC,GZIP, among others.

But, if we can work on a previous ordered file, where we group the most similar sequences, it's reasonable to think, the end result will also improve. So, to achieve that, we'll run a executable file (generated with C++ code) dedicated to sort that type of file. The criteria used to do that can be decided by the user when he is running ./FASTA_ANALY. It can go from absolute number or percentage of nucleotide pairs (AT or CG) to size or percentage. Different types of criteria can be grouped to achieve better results.

On the other hand, there's also a compression script being developed where we test the 5 sorting compression scenarios along with 6 different compressors, 3 general-purpose and 4 DNA-specific. This script will gives not only the sizes of the compressed files and the times of the compression but also a comparison between compression with or without sorting using tables and plots to give a better graphical understanding of what's happening 

## Usage Example
` ./FASTA_ANALY -sort=AT unsorted_file.fasta sorted_file.fasta 1 

A description of the options available can be obtained by invoking:

` ./FASTA_ANALY -h `



### Data compression tools used ###

<br>
<div align="center">

| Data Compressor | Repository | Description  |
|-----------------|------------|--------------|
| NAF             |<a href="https://github.com/KirillKryukov/naf">code</a>  | <a href="https://doi.org/10.1093/bioinformatics/btz144">article</a>|
| MFCompress      |<a href="http://sweet.ua.pt/ap/software/mfcompress/MFCompress-linux64-1.01.tgz">code</a>  | <a href="https://doi.org/10.1093/bioinformatics/btt594">article</a>|
| JARVIS3         |<a href="https://github.com/cobilab/jarvis3">code</a>  | |
| gzip           |<a href="https://ftp.eq.uc.pt/software/unix/gnu/gzip/">code</a>  | <a href="https://www.gnu.org/software/gzip/manual/">article</a>|
| lzma            |<a href="https://tukaani.org/xz/">code</a>  | <a href="https://tukaani.org/xz/">article</a>|
| bzip2           |<a href="https://sourceware.org/bzip2/">code</a>  | <a href="https://sourceware.org/bzip2/">article</a>|
| MBGC         |<a href="https://github.com/kowallus/mbgc">code</a>  | <a href="https://doi.org/10.1093/gigascience/giab099">article</a> |

</div>
<br>

### Compression Tests Reproducibility: ###

Change directory and give permitions:
<pre>
cd src/Compression_Scripts
chmod +x *.sh
</pre>

