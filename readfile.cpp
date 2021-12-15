#include <iostream>
#include <utility>
using std::cerr;
using std::cout;
using std::endl;
#include <vector>
#include <algorithm>
#include <fstream>
using std::ifstream;
#include <string>
#include <cstdlib> 
using std::ofstream;
#include <tuple>


// This program reads an Fasta file with several DNA sequences and sorts
// them on alphabetical order. Then the sequences are written with their 
// resulting order in a new Fasta file

bool compare(std::string a, std::string b){ return a<b;}

std::tuple<std::string,std::string> readFile(std::string file){
  ifstream indata (file.c_str());
  int numA,numT,numC,numG=0;
  int line=0;
  std::string file_string="";
  std::string fasta_labels="";
 // std::vector<std::pair<std::string,std::string>> fasta_sequences={};
  
  if(!indata){
    cerr << "Error: file could not be opened" << endl;
    exit(1);
  }
  
  while(indata){
    std::string strInput;
    getline(indata, strInput);
    if(strInput.find('>') != std::string::npos){
     fasta_labels+=strInput;
     file_string+='\n';
    }
    
    else{ 
    	if((strInput.find('A') != std::string::npos) && 	 (strInput.find('T') != std::string::npos) && (strInput.find('C') != std::string::npos) && (strInput.find('G') != std::string::npos) ){
    file_string+=strInput;
    }
    
    
   
  }
 
  }

    
 return std::make_tuple(fasta_labels,file_string);
  
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
   std::string string_file1="";
   std::string labels_file1="";
  std::vector<std::string> labels_vector={};
  std::vector<std::string> ordered_labels_vector={};
   if(argc == 2){
     infile1= argv[1];
   }
   
   std::string similar_char="";
   std::ofstream ordered_sequence_file ("ordered_sequences.fasta");
   tie(labels_file1,string_file1) = readFile(infile1);
   
   cout << "Size of file_1: " << string_file1.size() << endl;
   cout << "Size of labels_file : " << labels_file1.size() << endl;
  int number_of_sequences=0;
  int number_of_sequences_labels=0;
  
  std::vector<int> positions ={};
  std::vector<int> sizes ={};
  
   for(int i=0;i<string_file1.size();i++){
      if(string_file1.substr(i,1)=="\n"){
      number_of_sequences++;
      positions.push_back(i);
     }
   }
   
   for(int i=0;i<labels_file1.size();i++){
      if(labels_file1.substr(i,1)==">"){
      number_of_sequences_labels++;
     }
   }
   
   for(int i=1;i<=positions.size();i++){
      sizes.push_back(positions[i]-positions[i-1]);
   }
   
   
   //cout << number_of_sequences << endl;
   //cout << number_of_sequences_labels << endl;
   //cout << positions.size() << endl;
   //cout << sizes.size() << endl;
   
   
   
   std::vector<std::string> sequences = {};
   
   for(int i=0; i< positions.size();i++){
        sequences.push_back(string_file1.substr(positions[i],sizes[i]));
   }
   
   std::vector<std::string> unordered_sequences = sequences;
   std::vector<std::pair<int,int>> sequence_order = {};
   
   std::sort(sequences.begin(),sequences.end());
   
   
   int j=0;
   while(j<unordered_sequences.size()){
   for(int i=0; i< unordered_sequences.size();i++){
    if(unordered_sequences[i] == sequences[j]){
      sequence_order.push_back(std::make_pair(i,j));
      j++;
    }
   }
  }
   
   
   std::string label_str="";
   
   for(int i=0; i< labels_file1.size();i++){
     if(labels_file1.substr(i,1)==">"){
       labels_vector.push_back(label_str);
       label_str=">";
       
     }
     else{
        label_str+=labels_file1.substr(i,1);
     }
   }
   ordered_labels_vector = labels_vector;
   
   for(int i=0; i< sequence_order.size();i++){
     ordered_labels_vector[sequence_order[i].first] = labels_vector[sequence_order[i].second];
   }
   
   std::string ordered_sequence_string="";
   
   for(int i=0;i< ordered_labels_vector.size();i++){
     ordered_sequence_string+=ordered_labels_vector[i]+sequences[i]+"\n";
   }
   
   
   ordered_sequence_file << ordered_sequence_string <<std::endl;
   
   ordered_sequence_file.close();
   
  
   
   
   
   return 0;
}


