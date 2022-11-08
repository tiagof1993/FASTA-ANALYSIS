#include <stdio.h> 
#include <stdlib.h>
#include "fasta_analysis.hpp"
#include "msg.hpp"
#include <sstream>
#include <iterator>
#include <fstream>

#define chunk_division_factor 20


#define DEF_VERBOSE            0


Options resolveOption(std::string input) {
    if( input == "-h" ) return Help;
    if( input == "-V" ) return Version;
    if( input == "-v" ) return Verbose;
    if( input == "-sort=S" ) return Sort_size;
    if( input == "-sort=AT") return Sort_nucleotide_AT;
    if( input == "-sort=CG") return Sort_nucleotide_CG;
    if( input == "-sort=A" ) return Sort_alphabetically;
    if( input == "-s" ) return Shuffle;
    return Option_Invalid;
 }

bool compareBySize(const item &a, const item &b){
  
   return a.size < b.size;
}

bool compareByInitialPosition(const item &a, const item &b){
   return a.initial_position < b.initial_position;
}

bool compareByATNucleotide(const item &a, const item &b){
   return a.AT_nucleotides > b.AT_nucleotides;

}

bool compareByCGNucleotide(const item &a, const item &b){
   return a.CG_nucleotides > b.CG_nucleotides;
}

bool compareByUnknownNucleotides(const item &a, const item &b){
  return a.N_nucleotides > b.N_nucleotides;
}

/*bool compareByGNucleotide(const item &a, const item &b){
   return a.G_nucleotides > b.G_nucleotides;
}
bool compareByTNucleotide(const item &a, const item &b){
   return a.T_nucleotides > b.T_nucleotides;
}*/

bool compareByData(const item &a, const item &b){
  if(a.size < b.size) return true;
  if(b.size < a.size) return false;
  
  if(a.initial_position < b.initial_position) return true;
  if(b.initial_position < a.initial_position) return false;
  
  return false;
}

void shuffle_items(std::vector<item> item_vec,std::string input_filename, unsigned seed_numb){
     unsigned seed=0;
     cout << "seed_numb: " << seed_numb << endl;
     //std::ofstream shuffle_file("shuflle_file.txt");
 //assert(shuffle_file.is_open());
 
  FILE* pfile;
  size_t result;
  long l_size;
  char* buffer;
  pfile = fopen (input_filename.c_str(),"r");
  
 fseek(pfile,1, SEEK_END);
 l_size = ftell(pfile);
 rewind(pfile);
 
 buffer = (char*) malloc (sizeof(char)*l_size);
 if(buffer == NULL) {fputs("Memory error",stderr); exit(2);}
 
 result = fread(buffer,1,l_size,pfile);

  if(seed_numb==(unsigned)0){
    seed = std::chrono::system_clock::now().time_since_epoch().count();
  }
  else{
    seed = seed_numb;
  }
    shuffle(item_vec.begin(),item_vec.end(),std::default_random_engine(seed));

 sequence_ordering(item_vec,Shuffle,input_filename,"shuffled.fasta");

 //shuffle_file.close();
   
    
}



std::vector<item> readFilePositions(std::string file_name){
  //items contain label+sequence positions
   std::vector<item> items={{1,1,0,0,0,0}};
   std::ofstream item_records("item_records.txt");
  // std::ofstream line_item_records("line_item_records.txt");
  // std::ofstream sequences_records("sequences_records.txt");
  // std::ofstream label_records("label_records.txt");
   //std::ofstream reads_file("reads.txt");
   //assert(reads_file.is_open()); 
   //std::ofstream items_read("items.txt");
   //assert(items_read.is_open()); 
   //std::ofstream line_items_file("line_items_file.txt");
   //assert(line_items_file.is_open()); 
   //std::ofstream labels_file("labels_file.txt");
   //assert(labels_file.is_open()); 
   //std::ofstream sequences_file("sequences_file.txt");
   //assert(sequences_file.is_open()); 
   
   //line_items c
  // ontain all line contents
   //std::vector<label> labels={{1,1,0}};
   // std::vector<item> line_items={{1,1,0,0,0,0}};
   std::fstream fasta_file(file_name.c_str());
   
   //aux text files
   assert(item_records.is_open());

  FILE* pfile;
  FILE* ofile;
  size_t result;
  long l_size;
  char* buffer;
  long int d=0;
  
  //input file
  pfile = fopen (file_name.c_str(),"r");

  //output file
  ofile = fopen(file_name.c_str(),"r");
  fseek(ofile,1, SEEK_END);
  l_size = ftell(ofile);
  rewind(ofile);
 
 //buffer = (char*) malloc (sizeof(char)*l_size);
 //if(buffer == NULL) {fputs("Memory error",stderr); exit(2);}
 
 //result = fread(buffer,1,l_size,ofile);
 
 
  //+std::ifstream in_file (file_name, std::ifstream::in);


    item seq;
    char value;
    int label=0;
    long int label_size=0;
    long int current_position=0;
    //max_size = 33 295 309 016

  
  long int sequences_number =0;
//items.reserve(400000000000);
// cout << "length: " << length << endl;

  std::ifstream infile_stream (file_name, std::ifstream::binary);
  // cout << "file_length: " << infile_stream.gcount() << endl; 
    infile_stream.seekg (0, infile_stream.end);
    cout << "file_length: " << infile_stream.gcount() << endl; 
    int file_length = -(infile_stream.tellg());
    infile_stream.seekg (0, infile_stream.beg);
    
    long int chunk_selected=1;
    
    // 
    long int file_upper_limit_adjusted=0;
    long int file_length_adjusted=0;
    std::vector<long int> adjusted_lengths = {0};
    long int previous_chunk = 0;
    std::vector<item> labels = {}; 
    std::vector<long int> items_by_chunk={0};
    std::vector<long int> line_items_by_chunk={0};
    long int large_position=0;
    
    std::vector<std::string> char_reads={};
    
    long int initial_read_position =((file_length/chunk_division_factor)*chunk_selected)-1;
    long int final_read_position =0;// ((file_length/chunk_division_factor)*chunk_selected+1)-1;
         
 
 long int sequence_initial_position=0;
 std::vector<long int> line_breaks={};
 char previous_value=' ';
 try{
 while((value = fgetc(pfile))!= EOF){
 current_position++;
     if(value=='>' && current_position >1){
       seq={items[items.size()-1].final_position,line_breaks[0],current_position,current_position-items[items.size()-1].final_position,0,0,0};
       items.push_back(seq);
       line_breaks.clear(); 
        break;
     }
     else if(value =='\n'){
       line_breaks.push_back(current_position);
     }

   }
   // item_records << "initial: " << items[items.size()-1].initial_position << ", initial_sequence: " << items[items.size()-1].initial_sequence_position << ", final: " << items[items.size()-1].final_position << endl;
  }catch(std::bad_alloc & exception){
      std::cerr << "Bad Alloc Exception" << exception.what();
    }
 
 //deal with <> cenario
    try{
    while((value = fgetc(pfile))!= EOF ){
     current_position++;
     //if(current_position < 33295309016){
        // switch(value){
        //case '>': //label=1;
        if(current_position>184085690 && current_position<184085748){
        item_records << value;
        //item_records << endl;
        }
       // item_records << endl;
         if(value=='>' && previous_value=='\n'){ 
              if(current_position>items[1].final_position){
                //else{
                   seq={items[items.size()-1].final_position,line_breaks[0] ,current_position, current_position-items[items.size()-1].final_position,0,0,0};
                   //cout << current_position << endl;
                   items.push_back(seq);
     //              item_records << "initial: " << items[items.size()-1].initial_position << ", initial_sequence: " << items[items.size()-1].initial_sequence_position << ", final: " << items[items.size()-1].final_position << endl;
                   line_breaks.clear();
                  // }
                  }
             }
            
                  //label_size++; continue;
                  //reads_file << ; 
        //case '\n' : //label=0; 
                 if(value=='\n'){
                 line_breaks.push_back(current_position);
                   //if(current_position>1){
            	     //  sequence_initial_position = current_position;
            	     //  seq={};
                   //seq={line_items[line_items.size()-1].final_position,current_position, current_position-line_items[line_items.size()-1].final_position,0,0,0}; 
                   //line_items.push_back(seq);
                  }
                  previous_value=value;
                 } 
                  
                   // label_size=0;
       // case 'A' : //reads_file << " ";
    //    case 'C' : //reads_file << " ";
      //  case 'T' : //reads_file << " ";
    //    case 'G' : //reads_file << value;
       // default: 
        //	continue;
               //if(label==1){
               //  reads_file << value;
              // }
       // }
       
     //}

      
        //while(label==1){
        //  reads_file << value;
       // }
    
     

      
        //while(label==1){
        //  reads_file << value;
       // }
       
    
    }catch(std::bad_alloc & exception){
      std::cerr << "Bad Alloc Exception" << exception.what();
    }
   
   cout << "read over" << endl;
   
    string item_str="";

    
fclose(ofile);

  //return items;
  //return sequence;
  cout << "ending read function" << endl;
  //return std::make_pair(items,sequence);
  return items;

}


void sequence_ordering(std::vector<item> items_vec,Options option,std::string infile_name,std::string outfile_name){
 //std::fstream infile(infile_name.c_str());
 std::ofstream ordered_fasta_file(outfile_name.c_str());
 std::ofstream items_vec_record("items_vec_record.txt");
 std::ofstream nucleotides_count("nucleotides_count.txt");
 std::vector<std::string> file_reads={};
 /*std::vector<std::string> file_reads_lines={};
 std::vector<std::string> file_reads_labels={};
 std::vector<std::string> file_writes={};*/
 std::vector<std::string> file_reads_sequences={};
   
 /*for(int i=0;i<100;i++){
cout << "item : " << i << " : " << items_vec[i].final_position-items_vec[i].initial_position << endl;
 }*/
 
 long int j=0;
 long int k=0;
 long int final_pos=0;
 assert(ordered_fasta_file.is_open());
 assert(items_vec_record.is_open());
 assert(nucleotides_count.is_open());
 std::string sequence_str="";
 //std::ofstream ordered_file_pos("ordered_file.txt");
 //assert(ordered_file_pos.is_open());
 //std::ofstream nucleotide_records("nucleotide_records.txt");
 //assert(nucleotide_records.is_open());
 //std::ofstream sequences_read_file("sequence_reads.txt");
 //assert(sequences_read_file.is_open());
 
//std::pair<std::vector,std::vector> items_data = std::make_pair(items_vec,sequences_vec);
 //std::vector<label> labels={};
  FILE* pfile;
  size_t result;
  long l_size;
  //long chunk_read=10000000;
  long l_size_chunk;
  char* buffer;
  pfile = fopen (infile_name.c_str(),"r");
  
 //fseek(pfile,1, SEEK_END);
// l_size = ftell(pfile);
 //l_size_chunk=chunk_read;
 //l_size_chunk=sequences_vec[0].final_position;
// rewind(pfile);
 k=0;
 
 //while(l_size_chunk<l_size){
 /*if(k=0){
    result = fread(buffer,1,l_size_chunk,pfile);
 }
 else{
  if(l_size_chunk+chunk_read>l_size){
      //l_size_chunk+=(l_size-l_size_chunk);
      result = fread(buffer,l_size_chunk,l_size,pfile);
      
    }
    else{
       //l_size_chunk+=chunk_read;
       result = fread(buffer,l_size_chunk,l_size_chunk+chunk_read,pfile);
       
    }
  }*/
 
 
 //std::sort(items_data.begin(), items_data.end() , compareByData);
 
 //std::string seq="";
 /*long int A_count=0;
 long int C_count=0;
 long int G_count=0;
 long int T_count=0;*/
 long int l=0;
 long int AT_count=0;
 long int CG_count=0;
 long int N_count=0;
   //for(long int i=0;i<items_data.size();i++){
    char value;
    long int current_position=items_vec[0].initial_sequence_position;
   // cout << current_position << endl;
      rewind(pfile);      
       //fseek(pfile,sequences_vec[l].initial_position , SEEK_SET);
    
      rewind(pfile);
      //l_size_chunk=sequences_vec[l].final_position-sequences_vec[l].initial_position;   
 //cout << "sequences_vec initial_position:" << sequences_vec[l].initial_position << endl;
 //cout << "sequences_vec final_position:" << sequences_vec[l].final_position << endl;
 //coATTTTACTATTTTATTTAGTGTCTAGAAAAAAATGTGTGACCCACGACCGTAGGAAACTCut << "l_size_chunk: " << l_size_chunk << endl;
 //buffer = (char*) malloc (sizeof(char)*l_size_chunk);
 //if(buffer == NULL) {fputs("Memory error",stderr); exit(2);}
 
 //result = fread(buffer,sequences_vec[l].initial_position,sequences_vec[l].final_position,pfile); 
 //result = fread(buffer,1,l_size_chunk,pfile);
//cout << sizeof(buffer) << endl;

//cout << sizeof(char)*l_size_chunk << endl;
std::string c="";
/*for(long int i=0; i< sizeof(char)*l_size_chunk ;i++){
    cout << buffer[i-1];
  }*/
  
   //while((value = fgetc(pfile))!= EOF){
   
   //Reading sequences to vector
 for(long int i=0;i<items_vec.size();i++){
// cout << file_reads_sequences.size() << endl;
   current_position = items_vec[i].initial_sequence_position;
   fseek(pfile,current_position , SEEK_SET);
   while(current_position < items_vec[i].final_position){
  // sequence_str="";
  value=fgetc(pfile);
       sequence_str+=value;
       //cout << sequence_str << endl;
        current_position++;
      // cout << value << endl;
        switch(value){
        /*case '>': //label=1; 
                  if(current_position>1){
                   //seq={items[items.size()-1].final_position,current_position, current_position-items[items.size()-1].final_position,0,0,0}; 
                   file_reads.push_back(sequence_str);
                   sequence_str="";
                  }
                  continue;*/
                  
        case '>': 
          if(current_position>1){
        	   file_reads_sequences.push_back(sequence_str);
        	  // cout << sequence_str << endl;
                   sequence_str="";
                   }
                   continue;
                  //label_size++; continue;
                  //reads_file << ; 
                    
                   // label_size=0;
       // case 'A' : //reads_file << " ";
    //    case 'C' : //reads_file << " ";
      //  case 'T' : //reads_file << " ";
    //    case 'G' : //reads_file << value;
        default: 
        	continue;
        	
       
       //cout << value << endl;
               //if(label==1){
               //  reads_file << value;
              // }
        }
   }
   l_size_chunk = items_vec[i].final_position-items_vec[i].initial_sequence_position;
   //cout << "l_size_chunk: " << l_size_chunk << endl;
   //cout << i << ", total size: " << items_vec.size() << endl;
   j=0;
   while(j<l_size_chunk){
   //cout << file_reads_sequences.size() << endl;
    if(file_reads_sequences[0].size()>1){
        c="";
        c=file_reads_sequences[0].at(j);
        //cout << "i: " << i << ", j: " << j << endl;
        if(c.compare("A") == 0 ){
          AT_count++;
        }
        else if(c.compare("T") == 0){
       	  AT_count++;
        } 
        //else if(buffer[j-1]=='C' || buffer[j-1]=='G'){
        else if(c.compare("C") == 0){
          CG_count++;
        }
        else if(c.compare("G") == 0){
          CG_count++;
         // cout << "CG" << endl;
        }
               //else if(buffer[j-1]=='N'){
        //  N_count++;
        //}
        /*else if(buffer[j-2]=='G'){
          G_count++;
        }
         else if(buffer[j-2]=='T'){
          T_count++;
        }*/
        //seq+=buffer[j-1];
      }
        j++;
   }
   items_vec[i].AT_nucleotides=AT_count;
   items_vec[i].CG_nucleotides=CG_count;
   items_vec[i].N_nucleotides=N_count;
  //   nucleotides_count << "items_nucleotides: " << items_vec[i].AT_nucleotides << endl;
   AT_count=0;
   CG_count=0;
   N_count=0;  
   
   file_reads_sequences.clear();
  }
    //cout << "Entering ordering function" << endl;
   //Counting nucleotide numbers in each sequence
   
   /*   do{
      
  
  cout << endl;
     //j=items_data.second[k].initial_position;
     //j=sequences_vec[l].initial_position;
    l_size_chunk = items_vec[l].final_position-items_vec[l].initial_sequence_position;
    //cout << "l_size_chunk: " << l_size_chunk << endl;
    //cout << l << endl;
    //cout << sequences_vec[1208].size << endl;
     j=0;
     //cout << j << endl;
   //  while(j<sequences_vec[l].final_position){
     while(j<l_size_chunk){
        if(file_reads_sequences[l].size()>1){
        c="";
        c=file_reads_sequences[l].at(j);
        //cout << "c: " << c << endl;
        if(c.compare("A") == 0 ){
          AT_count++;
        }
        else if(c.compare("T") == 0){
       	  AT_count++;
        } 
        //else if(buffer[j-1]=='C' || buffer[j-1]=='G'){
        else if(c.compare("C") == 0){
          CG_count++;
        }
        else if(c.compare("G") == 0){
          CG_count++;
         // cout << "CG" << endl;
        }
               //else if(buffer[j-1]=='N'){
        //  N_count++;
        //}
        /*else if(buffer[j-2]=='G'){
          G_count++;
        }
         else if(buffer[j-2]=='T'){
          T_count++;
        }*/
        //seq+=buffer[j-1];
        /*}
        j++;
      }
      //char seq[data[k].size] = buffer[data[k].initial_position-data[k].final_position];
      items_vec[l].AT_nucleotides=AT_count;
      items_vec[l].CG_nucleotides=CG_count;
      items_vec[l].N_nucleotides=N_count;
     cout << "items_nucleotides: " << items_vec[l].AT_nucleotides << endl;
      //items_data.first[k].G_nucleotides=G_count;
      //items_data.first[k].T_nucleotides=T_count;
      AT_count=0;
      CG_count=0;
      N_count=0;
      //G_count=0;
     // T_count=0;
      l++;
     // seq="";
     //free(buffer);
     }while(l<items_vec.size()-1); */
     
     //Sorting sequences
     
     cout << "Sorting..." << endl;
     if(option==Sort_size){
  //cout << "sort size" << endl;
  std::sort(items_vec.begin(), items_vec.end() , compareBySize);
 }
 else if(option==Sort_nucleotide_AT ){
 
 	//if(nucleotide=="AT" || nucleotide=="TA"){
  		std::sort(items_vec.begin(), items_vec.end() , compareByATNucleotide);
 	//}
 }
 else if(option==Sort_nucleotide_CG ){
	//if(nucleotide=="CG" || nucleotide=="GC"){
  		std::sort(items_vec.begin(), items_vec.end() ,compareByCGNucleotide);
 	//}
}
//else if(nucleotide=="N"){
//  std::sort(items_vec.begin(), items_vec.end() ,compareByUnknownNucleotides);
//}
 
 else if(option==Sort_alphabetically){
  //std::sort(items_vec.begin(), items_vec.end() ,compareAlphabetically);
 }
 
 
  for(long int i=0;i<items_vec.size();i++){
    // items_vec_record << "initial: " << items_vec[i].initial_position << ", initial_sequence: " << items_vec[i].initial_sequence_position << ", final: " << items_vec[i].final_position << endl;
}
 
 //Writing to ouput file
 
 
 current_position=0;
 sequence_str="";
 for(long int p=1;p<items_vec.size();p++){
  cout << p << ", total size: " << items_vec.size() << endl;
 current_position=items_vec[p].initial_position;
   fseek(pfile,current_position , SEEK_SET);
   while(current_position < items_vec[p].final_position){
  // sequence_str="";
  value=fgetc(pfile);
       sequence_str+=value;
       //cout << sequence_str << endl;
        current_position++;
  }
  file_reads.push_back(sequence_str);
  
   sequence_str="";
   //cout << sequence_str << endl;
   
   l_size_chunk=items_vec[p].final_position-items_vec[p].initial_position; 
    // cout << "item final: " << items_vec[i].final_position << endl;
    // cout << "item initial: " << items_vec[i].initial_position << endl;
     //cout << items_vec[i].final_position;
     cout << "item chunk: " << l_size_chunk << endl;
     
      //buffer = (char*) malloc (sizeof(char)*l_size_chunk);
      //rewind(wfile);
 //if(buffer == NULL) {fputs("Memory error",stderr); exit(2);}
 
 //result = fread(buffer,1, l_size_chunk ,wfile); 
 //cout << buffer[0] << endl;
 
   //  j=items_vec[i].initial_position;
   j=0;
     //while(j<items_vec[i].final_position){
     while(j<file_reads[0].size()){
        ordered_fasta_file << file_reads[0].at(j);
        //cout << file_reads[p].at(j);
        if(j==l_size_chunk){
          //ordered_fasta_file << file_reads_labels[i].at(j);
          ordered_fasta_file << file_reads[0].at(j) << endl;
        
        
        j++;
      }
  // fclose(pfile);
    //free(buffer);
     }
     file_reads.clear();
     //items_vec_record.close();
     cout << "buffer" << endl;
     //fclose(pfile)
    

  /*  fclose(pfile);
    free(buffer);
    
    if(l_size_chunk+chunk_read>l_size){
      l_size_chunk+=(l_size-l_size_chunk);
    }
    else{
       l_size_chunk+=chunk_read;
    }
 }*/
 
   //infile.close();
  // fasta_file_2.close();
  // ordered_fasta_file.close(); 
   
  
  
   
 }
 fclose(pfile);
 items_vec_record.close();
 ordered_fasta_file.close(); 
 
/* for(long int p=0;p<file_reads.size();p++){
 cout << "Size: " << file_reads.size() << endl;
 //cout << "file_reads: " <<  file_reads[p] << endl;
   } */
//items_vec_record << file_reads[0] << endl;
 /*for(long int i=0;i<items_vec.size();i++){
     //rewind(wfile);      
     //fseek(wfile,items_vec[i].initial_position , SEEK_SET);
    // cout << items_vec.size() << endl;
     l_size_chunk=items_vec[i].final_position-items_vec[i].initial_position; 
    // cout << "item final: " << items_vec[i].final_position << endl;
    // cout << "item initial: " << items_vec[i].initial_position << endl;
     //cout << items_vec[i].final_position;
     cout << "item chunk: " << l_size_chunk << endl;
     
      //buffer = (char*) malloc (sizeof(char)*l_size_chunk);
      //rewind(wfile);
 //if(buffer == NULL) {fputs("Memory error",stderr); exit(2);}
 
 //result = fread(buffer,1, l_size_chunk ,wfile); 
 //cout << buffer[0] << endl;
 
   //  j=items_vec[i].initial_position;
   j=0;
     //while(j<items_vec[i].final_position){
     while(j<file_reads[i].size()){
        ordered_fasta_file << file_reads[i].at(j);
        if(j==l_size_chunk){
          //ordered_fasta_file << file_reads_labels[i].at(j);
          ordered_fasta_file << file_reads[i].at(j) << endl;
        
        
        j++;
      }
   fclose(pfile);
    //free(buffer);
     }
     items_vec_record.close();
     cout << "buffer" << endl;
     //fclose(pfile);
    

  /*  fclose(pfile);
    free(buffer);
    
    if(l_size_chunk+chunk_read>l_size){
      l_size_chunk+=(l_size-l_size_chunk);
    }
    else{
       l_size_chunk+=chunk_read;
    }
 }*/
 
   //infile.close();
  // fasta_file_2.close();
   //ordered_fasta_file.close();
  // nucleotide_records.close();
//}
   
}

uint8_t ArgsState(uint8_t d, char *a[], uint32_t n, char *s, char *s2){

  for( ; --n ; )
    if(!strcmp(s, a[n]) || !strcmp(s2, a[n]))
      return d == 0 ? 1 : 0;
  return d;
  }

 int CheckFileisFasta(char* name){
   FILE *F =fopen(name,"r");
    if(getc(F)!='>'){
      return 0;
    }
    return 1;
 }



int main(int argc,char** argv){

//Prints the initial Menu, explaining execution options and objectives
 char **p = *&argv;
 
 
 uint32_t help = ArgsState(0, p, argc, "-h", "--help");
 uint32_t version = ArgsState(0, p, argc, "-V", "--version");
 //if(help){
 // PrintHelpMenu(1);
//}
 if(argv[1]==NULL){
  PrintNoArgumentsError();
  return 0;
 }
 if(help){
  PrintHelpMenu(1);
  return 0;
}
 if(version){
  PrintMenuCompression();
  PrintVersion();
  return 0;
  }


 std::string option=argv[1];

 
 std::string infile="";
 std::string outfile="";
 std::string seed_str="";
 std::string positions_string="";
  // std::vector<item> recorded_items={};
 //std::pair<std::vector<item>,std::vector<item>> recorded_items;
 std::vector<item> recorded_items;
 //std::vector<label> recorded_labels={};
 unsigned seed=0;
 stringstream s;
 std::string nucleotide="";

     assert(CheckFileisFasta(argv[argc-3])); 
     outfile = argv[argc-2];
     infile= argv[argc-3];
     seed = (unsigned)atoi(argv[argc-1]);
     //nucleotide = argv[argc-4];
    
     
   assert(outfile.substr(outfile.size()-6)==".fasta" || outfile.substr(outfile.size()-3)==".fna");
   // assert(seed_str!="");
   //assert (nucleotide=="A" || nucleotide=="C" || nucleotide== "G" || nucleotide == "T");
   
   //s << seed_str;
   //s >> seed;
   
 
 switch(resolveOption(option) ) {
 	case Help: 
 	             PrintHelpMenu(1); 
 	   //        }
 	           break;
 	           
        case Version:
         PrintMenuCompression();
         PrintVersion();
        	   
        	   break;
        	   
       case  Verbose:   fprintf(stderr, "[>] Running FASTA_ANALYSIS v%u.%u ...\n", VERSION, RELEASE);
       		   break;
       
       case Sort_size:
       		recorded_items = readFilePositions(infile);
      //sequence_ordering(recorded_items.first,Sort_size,recorded_items.second,infile,outfile);
              sequence_ordering(recorded_items,Sort_size,infile,outfile);          
                break;
      
      case Sort_nucleotide_AT:
       		recorded_items = readFilePositions(infile);
  //sequence_ordering(recorded_items.first,Sort_nucleotide_AT,recorded_items.second,infile,outfile);
sequence_ordering(recorded_items,Sort_nucleotide_AT,infile,outfile);
                
                break;
     case Sort_nucleotide_CG:
       		recorded_items = readFilePositions(infile);
      //sequence_ordering(recorded_items.first,Sort_nucleotide_CG,recorded_items.second,infile,outfile);
sequence_ordering(recorded_items,Sort_nucleotide_CG,infile,outfile);                 
                break;
                
      case Sort_alphabetically:
       		recorded_items = readFilePositions(infile);
      //sequence_ordering(recorded_items.first,Sort_alphabetically,recorded_items.second,infile,outfile);
  sequence_ordering(recorded_items,Sort_alphabetically,infile,outfile);               
                break;
       
       case Shuffle:
       		recorded_items = readFilePositions(infile);
       	     shuffle_items(recorded_items,infile,seed);
      	     
      	     break;
       
       default:
       
       recorded_items = readFilePositions(infile);
      //sequence_ordering(recorded_items.first,Sort_size,recorded_items.second,infile,outfile);
      sequence_ordering(recorded_items,Sort_size,infile,outfile);
      break;
       
 }
 


 //uint32_t verbose    = ArgsState (DEF_VERBOSE, p, argc, "-v", "--verbose");
  //if(verbose){
   // fprintf(stderr, "[>] Running FASTA_ANALYSIS v%u.%u ...\n", VERSION, RELEASE);
 //}
 

   //cout << "seed: " << seed <<endl;
   
  // recorded_items = readFilePositions(infile);
    

   //shuffle_items(recorded_items.first,recorded_items.second,infile,seed,nucleotide);
  // sequence_ordering(recorded_items.first,recorded_items.second,infile,outfile,nucleotide);
   
  return 0;
}
