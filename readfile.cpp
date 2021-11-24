#include <iostream>
using std::cerr;
using std::cout;
using std::endl;
#include <fstream>
using std::ifstream;
#include <string>
#include <cstdlib> 
using std::ofstream;


// This program reads values from the content of two Fasta files,
// determines the common nucleotide bases and saves them in a new fasta 
// file

std::string readFile(std::string file){
  ifstream indata (file.c_str());
  int numA,numT,numC,numG=0;
  int line=0;
  std::string file_string="";
  
  if(!indata){
    cerr << "Error: file could not be opened" << endl;
    exit(1);
  }
  
  while(indata){
    std::string strInput;
    getline(indata, strInput);
    if((strInput.find('A') != std::string::npos) && (strInput.find('T') != std::string::npos) && (strInput.find('C') != std::string::npos) && (strInput.find('G') != std::string::npos) ){
    cout << strInput << endl;
    file_string+=strInput;
    }
   }
    
 return file_string;
  
}

int relationalOperation(std::string s1,std::string s2){
  if(s1 != s2)
  {
    return 0;
  }
  else{
    return 1;
    }
  return 0;
}

int main(int argc,char** argv)
{
   std::string infile1="";
   std::string infile2="";
   std::string string_file1="";
   std::string string_file2="";
   if(argc == 3){
     infile1= argv[1];
     infile2 = argv[2];
   }
   
   std::string similar_char="";
   std::ofstream similarities_out_file ("similarities.fa");
   
   string_file1=readFile(infile1);
   string_file2=readFile(infile2);
   
   cout << "Size of file_1: " << string_file1.size() << endl;
   cout << "Size of file_2: " << string_file2.size() << endl; 
   
   for(int i=0;i<string_file1.size();i++){
     if(string_file1.size() <= string_file2.size() ){
                 if(relationalOperation(string_file1.substr(i,1),string_file2.substr(i,1))==1)
    similar_char+= string_file1.substr(i,1);
   }
  }
   
   for(int i=0;i<string_file2.size();i++){
     if(string_file2.size() <= string_file1.size() ){
                 if(relationalOperation(string_file2.substr(i,1),string_file1.substr(i,1))==1)
    similar_char+= string_file2.substr(i,1);
   }
  }
  
   cout << similar_char.size() << std::endl;
   
   similarities_out_file << similar_char <<std::endl;
   
   return 0;
}


