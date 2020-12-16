#include <iostream>
#include <fstream>
#include <string>

//This programs reads a fasta file, received as an argument of the main function, and counts the number of A,C,G and T present in the DNA sequence
//Execute this file using: g++ readfastafile.cpp -o s && ./s filename.fasta

int main (int argc, char** argv)
{
 if(argc < 2){
   std::cerr << "Arguments missing" << std::endl;
 }
 
  std::string filename {argv[1]};
  std::ifstream file(filename.c_str());
  
  if(!file.good()){
   std::cerr << "Error opening: " << argv[1] << std::endl;
   return -1;
 
  }
  std::string str;
  std::string strA {"A"};
  std::string strC {"C"};
  std::string strG {"G"};
  std::string strT {"T"};
  std::int32_t numofT, numofA, numofG, numofC = 0;
  while (std::getline(file, str)) {
  
  std::size_t foundA = str.find(strA);
  std::size_t foundC = str.find(strC);
  std::size_t foundG = str.find(strG);
  std::size_t foundT = str.find(strT);
  
    if (str.empty())
      continue;
      if(foundA!= std::string::npos)
         numofA += 1;
      if(foundC!= std::string::npos)
         numofC += 1;
      if(foundT!= std::string::npos)
         numofT += 1;
      if(foundG!= std::string::npos)
         numofG += 1;
         
         std::cout << str << "\n";
       
  }
  std::cout << " A: " << numofA << std::endl;
  std::cout << " C: " << numofC << std::endl;
  std::cout << " T: " << numofT << std::endl;
  std::cout << " G: " << numofG << std::endl;
}
