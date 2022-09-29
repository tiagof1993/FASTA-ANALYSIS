#include <stdio.h> 
#include <stdlib.h>
#include "fasta_analysis.hpp"
#include "msg.hpp"
#include <sstream>


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

void shuffle_items(std::vector<item> item_vec, std::vector<item> sequence_vec,std::string input_filename, unsigned seed_numb){
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

    std::vector<long int> aux_int={};
    std::vector<long int> final_int={};
   // std::ofstream shuffle_file("shuflle_file.txt");
   // assert(shuffle_file.is_open());
    //shuffle_file << "item_vec.final" << endl;
    for(long int i=0;i<item_vec.size();i++){
      aux_int.push_back(item_vec[i].final_position-2);
      final_int.push_back(item_vec[i].final_position-1);
     // shuffle_file << item_vec[i-1].final_position+1 << endl;
    }
    //aux_int.push_back(item_vec[item_vec.size()-1].final_position-1);
    
      std::vector<item> aux_seq={};
      item seq={1,1,0,0,0};
      /*shuffle_file << "sequence_vec.final" << endl;
      for(long int j=0;j<sequence_vec.size();j++){
        shuffle_file << sequence_vec[j].final_position << endl;
      }*/
    for(long int i=0;i<aux_int.size();i++){
      for(long int j=0;j<sequence_vec.size();j++){
        //shuffle_file << sequence_vec[j].final_position << endl;
      if(aux_int[i]==sequence_vec[j].final_position){
        //seq = {sequence_vec[j]};
         aux_seq.push_back(sequence_vec[j]);
      }
      else if(final_int[i]==sequence_vec[j].final_position){
        aux_seq.push_back(sequence_vec[j]);
      }
    }
  }

   /* shuffle_file << "aux_seq.final" << endl;
    shuffle_file << aux_seq.size() << endl;
    for(long int j=0;j<aux_seq.size();j++){
      shuffle_file << aux_seq[j].final_position << endl;
    }*/
  
  


 std::vector<long int> item_final_position={};

 

/*for(long int i=0; i< item_vec.size();i++){
  for(long int j=item_vec[i].initial_position; j< item_vec[i].final_position;j++){
    shuffle_file << buffer[j-1];
  }
}
shuffle_file << endl;
shuffle_file << "Second" << endl;
for(long int i=0; i< aux_seq.size();i++){
  for(long int j=aux_seq[i].initial_position; j<= aux_seq[i].final_position;j++){
    shuffle_file << buffer[j-1];
    if(j==aux_seq[i].final_position){
    shuffle_file << endl;
    }
  }
}*/

free(buffer);
 sequence_ordering(item_vec,Shuffle,aux_seq,input_filename,"shuffled.fasta");

 //shuffle_file.close();
   
    
}



std::pair< std::vector<item>,std::vector<item> > readFilePositions(std::string file_name){
  //items contain label+sequence positions
   std::vector<item> items={{1,1,0,0,0,0}};
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
   
   //line_items contain all line contents
   //std::vector<label> labels={{1,1,0}};
   std::vector<item> line_items={{1,1,0,0,0,0}};
   std::fstream fasta_file(file_name.c_str());

  FILE* pfile;
  FILE* ofile;
  size_t result;
  long l_size;
  char* buffer;
  long int d=0;
  pfile = fopen (file_name.c_str(),"r");

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

/*while (fin)
{
    // Try to read next chunk of data
    fin.read(buff, buffer_size);
    // Get the number of bytes actually read
    size_t count = fin.gcount();
    // If nothing has been read, break
    if (!count) 
        break;    
        
}

while(d<buffer_size){
 switch(buffer[d]){
    	case '>': label=1; 
                  if(current_position>1){
                  seq={items[items.size()-1].final_position,current_position, current_position-items[items.size()-1].final_position,0,0,0};
                   //cout << current_position << endl;
                  items.push_back(seq);
                   //break;
                  }
                  continue;
                  //label_size++; continue;
                  //reads_file << ; 
        case '\n' : label=0; 
                   if(current_position>1){
                   seq={line_items[line_items.size()-1].final_position,current_position, current_position-line_items[line_items.size()-1].final_position,0,0,0}; 
                   line_items.push_back(seq);
                  }
                  continue;
                    
                   // label_size=0;
       // case 'A' : //reads_file << " ";
    //    case 'C' : //reads_file << " ";
      //  case 'T' : //reads_file << " ";
    //    case 'G' : //reads_file << value;
        default: 
        	continue;
    }
       d++;    
 }

  
    // Do whatever you need with first count bytes in the buffer
    // ...


delete[] buffer;*/


    //cout << items.max_size() << endl;
    
    //ifstream in_file(file_name);
   
    
    
    //char value = in_file.get();
    //std::string line="";
/*std::ifstream fin(file_name);

 fin.seekg (0, fin.end);
 long int length = fin.tellg();*/
 /*char * buff = new char[length/20];
 
   std::cout <<"Reading " << length/20 << " characters... ";
   
 fin.read (buff,length);*/ 
 
 //fin.close();

 
  //delete[] buff;
  
  long int sequences_number =0;
//items.reserve(400000000000);
// cout << "length: " << length << endl;

  std::ifstream infile_stream (file_name, std::ifstream::binary);
    infile_stream.seekg (0, infile_stream.end);
    int file_length = -(infile_stream.tellg());
    infile_stream.seekg (0, infile_stream.beg);
    
    long int chunk_selected=1;
    
  do{
    char * buff = new char [file_length/20];
    infile_stream.seekg ((file_length/20)*chunk_selected, infile_stream.beg);
    infile_stream.read (buff,(file_length/20));
    long int counter=0;
    
    cout << file_length/20 << endl;
    //cout << buff[(file_length/20)] << endl;

    //char * buff_adjusted = new char[file_length/20];
    
    long int file_lower_limit_adjusted=0;
    long int file_upper_limit_adjusted=0;
    long int file_length_adjusted=0;
   // cout << chunk_selected << endl;
    
    if(chunk_selected=1){
    for(long int p=((file_length/20)-1);p>=0;p--){
       //cout << buff[p];
       if(buff[p]=='>'){
       //file_length_adjusted=p;
       file_lower_limit_adjusted=p;
       break;
       }
       
    }
    for(long int p=((file_length/20)-1);p<file_length;p++){
       //cout << buff[p];
       if(buff[p]=='>'){
       //file_length_adjusted=p;
       file_upper_limit_adjusted=p;
       break;
       }
       
    }
    
   
    
   }
   else{
   //cout << chunk_selected << endl;
    for(long int p=((file_length/20)*chunk_selected)-1;p>=((file_length/20)*(chunk_selected-1))-1;p--){
    counter++;
       if(buff[p]=='>'){
       	//file_length_adjusted=(((file_length/20)*chunk_selected)-1)-p;
       	file_lower_limit_adjusted=(((file_length/20)*chunk_selected)-1)-counter;
       	//file_lower_limit_adjusted=(((file_length/20)*chunk_selected)-1)-p;
       	//cout << file_length_adjusted << endl;
       	break;
       }
       
    }
    cout << "Lower Limit: " << file_lower_limit_adjusted << endl;
    
    for(long int p=((file_length/20)*chunk_selected)-1;p<file_length;p++){
      if(buff[p]=='>'){
       	//file_length_adjusted=(((file_length/20)*chunk_selected)-1)-p;
       	file_upper_limit_adjusted=p;
       	//cout << file_length_adjusted << endl;
       	break;
       }
    }
   }
   
   file_length_adjusted=file_upper_limit_adjusted - file_lower_limit_adjusted;
   
    counter=0;
    cout << "File lenght Adjusted: " << file_length_adjusted << endl;
    char * buff_adjusted = new char[file_length_adjusted];
    if(chunk_selected=1){
   for(long int p=0; p<file_length_adjusted;p++){
    //cout << buff[p];
    buff_adjusted[p]=buff[p];
    }
   }
   else{
   
   //for(long int p=0; p<file_length_adjusted;p++){
     for(long int p=((file_length/20)*(chunk_selected-1))-1 ;p<((file_length/20)*chunk_selected);p++){
    //cout << buff[p];
    buff_adjusted[counter]=buff[p];
     counter++;
    }
   
   }
    
  
  
  
  
  infile_stream.close();
//try{
 for(long int p=0;p<file_length_adjusted;p++){
   switch(buff_adjusted[p]){
   	case '>': label=1; 
                  if(p>1){ //&& sequences_number < 536870911){
                  seq={items[items.size()-1].final_position,p, p-items[items.size()-1].final_position,0,0,0};
            
                  items.push_back(seq);
                   //break;
                  }
                  continue;
                  //label_size++; continue;
                  //reads_file << ; 
         case '\n' : label=0; 
                   if(p>1){
                   seq={line_items[line_items.size()-1].final_position,p, p-line_items[line_items.size()-1].final_position,0,0,0}; 
                   /*if(sequences_number > length/100){
                    cout<< sequences_number << endl;
                   }*/
                   //items.reserve(seq);
                   sequences_number++;
                   //cout << sequences_number << endl;
                   line_items.push_back(seq);
                  }
                  continue;
                    
                   // label_size=0;
       // case 'A' : //reads_file << " ";
    //    case 'C' : //reads_file << " ";
      //  case 'T' : //reads_file << " ";
    //    case 'G' : //reads_file << value;
        default: 
        	continue;
    }
  }
  //}catch(std::bad_alloc & exception){
   //   std::cerr << "Bad Alloc Exception" << exception.what();
   // }
    
    
    
    delete[] buff;
    
    chunk_selected++;
    cout << "chunk_selected: " << chunk_selected << endl;
 }while(chunk_selected<20);
    
   // cout << items[1].final_position << endl;
  
  
  
  /*
    try{
     while((value = fgetc(pfile))!= EOF ){
    // while(std::getline(in_file,line)){
    //while(in_file.good()){
    //value=in_file.get();
     current_position++;
      // if(current_position < length/20){
        //switch(line[0]){
        //if(current_position=743424460){
         // cout << current_position << endl;
       // }
        
        switch(value){
         case '>': label=1; 
                  if(current_position>1){ //&& sequences_number < 536870911){
                  seq={items[items.size()-1].final_position,current_position, current_position-items[items.size()-1].final_position,0,0,0};
            
                  items.push_back(seq);
                   //break;
                  }
                  continue;
                  //label_size++; continue;
                  //reads_file << ; 
         case '\n' : label=0; 
                   if(current_position>1 ){
                   seq={line_items[line_items.size()-1].final_position,current_position, current_position-line_items[line_items.size()-1].final_position,0,0,0}; 
                   /*if(sequences_number > length/100){
                    cout<< sequences_number << endl;
                   }*/
                   //items.reserve(seq);
                  /* sequences_number++;
                   //cout << sequences_number << endl;
                   line_items.push_back(seq);
                  }
                  continue;
                    
                   // label_size=0;
       // case 'A' : //reads_file << " ";
    //    case 'C' : //reads_file << " ";
      //  case 'T' : //reads_file << " ";
    //    case 'G' : //reads_file << value;
        default: 
        	continue;
               //if(label==1){
               //  reads_file << value;
              // }
        }
       // cout << sequences_number << endl;
       
     //}
     

      
        //while(label==1){
        //  reads_file << value;
       // }
    }
    }catch(std::bad_alloc & exception){
      std::cerr << "Bad Alloc Exception" << exception.what();
    }*/
    string item_str="";
   // in_file.close();
    
    //max_size = 32212254720
   /* try{
    while((value = fgetc(pfile))!= EOF ){
    // while(item_str.size() < 32212254720){
      item_str +=value;
      //cout << item_str.size() << endl;
     }
    }catch(std::bad_alloc & exception){
      std::cerr << "Bad Alloc Exception" << exception.what();
      std::cout << item_str.size() << std::endl;
    }
    // cout << item_str.size() << endl;
     
    for(long int i=2;i<item_str.size();i++){
      if(item_str[i]=='>'){
      //cout << item_str[i] << endl;
        seq={items[items.size()-1].final_position,current_position, current_position-items[items.size()-1].final_position,0,0,0};
        items.push_back(seq);
      }
      else if(item_str[i]=='\n'){
        seq={line_items[line_items.size()-1].final_position,current_position, current_position-line_items[line_items.size()-1].final_position,0,0,0}; 
        line_items.push_back(seq);
      }
    }*/
    
    seq={items[items.size()-1].final_position,current_position, current_position-items[items.size()-1].final_position,0,0,0}; 
    items.push_back(seq);
    items.erase(items.begin());

 seq = {line_items[1].initial_position,line_items[1].final_position,line_items[1].size,0,0,0};
std::vector<item> labels = {seq};


for(long int i=0; i< items.size();i++ ){
  for(long int j=1; j< line_items.size();j++){
   if(line_items[j].initial_position+1==items[i].final_position){
       seq={line_items[j].initial_position,line_items[j].final_position,line_items[j].size,0,0,0};
       labels.push_back(seq);
   }
 }
}
   //cout << "Label records:" << endl;
  //for(long int i=0; i< labels.size(); i++){
    //cout << labels[i].size << ", " << labels[i].initial_position << ", " << labels[i].final_position << endl;
    //labels_file << labels[i].size << ", " << labels[i].initial_position << ", " << labels[i].final_position << endl;
   // for(long int j=labels[i].initial_position; j< labels[i].final_position;j++){
  //j=items[i].initial_position;
 //do{
     // labels_file << buffer[j-1];
  //  j++;
 //} while(j=items[i].final_position);
 // }
 //}

  std::vector<item> sequence = {};
 long int sequence_size=0;
 for(long int i=1; i<labels.size();i++){
   sequence_size=(labels[i].initial_position-1)-(labels[i-1].final_position+1);
   seq={labels[i-1].final_position+1,labels[i].initial_position-1,sequence_size,0,0,0};
   sequence.push_back(seq);
 }
 
 cout << sequence[0].initial_position << endl;
 //sequence_size=(items[items.size()-1].final_position)-(labels[labels.size()-1].final_position);
 
// seq = {labels[labels.size()-1].final_position+1,items[items.size()-1].final_position-1,sequence_size,0,0,0};
 //seq = {labels[labels.size()-1].final_position-1,items[items.size()-1].final_position+1,sequence_size,0,0,0};
 //sequence.push_back(seq);

  //cout << "Sequence records:" << endl;
  //for(long int i=0; i< sequence.size(); i++){
    // cout << sequence[i].size << ", " << sequence[i].initial_position << ", " << sequence[i].final_position << endl;
     
   //  for(long int j=sequence[i].initial_position; j<= sequence[i].final_position;j++){
  //j=items[i].initial_position;
 //do{
  //if(j==sequence[i].final_position && i< sequence.size()-1){
    //  sequences_file << endl;
   // }
  //else if(j== sequence[sequence.size()-1].final_position){
  //  sequences_file << "\n";
  // }
  // else{
   // sequences_file << buffer[j];
  // }
  //}
//}

//free(buffer);
fclose(ofile);

  //return items;
  //return sequence;
  return std::make_pair(items,sequence);

}


void sequence_ordering(std::vector<item> items_vec,Options option, std::vector<item> sequences_vec,std::string infile_name,std::string outfile_name){
 //std::fstream infile(infile_name.c_str());
 std::ofstream ordered_fasta_file(outfile_name.c_str());
 std::vector<std::string> file_reads={};
 std::vector<std::string> file_reads_lines={};
 std::vector<std::string> file_reads_labels={};
 std::vector<std::string> file_writes={};
   std::vector<std::string> file_reads_sequences={};
 
 long int j=0;
 long int k=0;
 long int final_pos=0;
 assert(ordered_fasta_file.is_open());
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
    long int current_position=0;
      rewind(pfile);      
       fseek(pfile,sequences_vec[l].initial_position , SEEK_SET);
      rewind(pfile);
      l_size_chunk=sequences_vec[l].final_position-sequences_vec[l].initial_position;   
 cout << "sequences_vec initial_position:" << sequences_vec[l].initial_position << endl;
 cout << "l_size_chunk: " << l_size_chunk << endl;
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
   while(current_position < items_vec[items_vec.size()-1].final_position){
  // sequence_str="";
  value=fgetc(pfile);
       sequence_str+=value;
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
                  
        case '\n': 
          if(current_position>1){
        	   file_reads_lines.push_back(sequence_str);
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
  /* for(long int p=0;p<file_reads_lines.size();p++){
   cout << "Size: " << file_reads_lines.size() << endl;
   cout << file_reads_lines[p];
   } */
   
   //for(long int i=0; i< items.size();i++ ){
   std::string labels_string="";
   long int index=0;
  for(long int j=0; j< file_reads_lines.size();j++){
  c=file_reads_lines[j].at(0);
  //cout << j << endl;
     index=0;
     do{
     
     if(c.compare(">") == 0){
        labels_string+=file_reads_lines[j].at(index);
        //cout << labels_string << endl;
       // cout << index << endl;
        // cout << file_reads_lines[j].size() << endl;
        //index++;
      }  
      index++;
        
     }while(index<file_reads_lines[j].size()-1);
         
     if(labels_string!=""){
      file_reads_labels.push_back(labels_string);
      }
      labels_string="";
   /*if(line_items[j].initial_position+1==items[i].final_position){
       seq={line_items[j].initial_position,line_items[j].final_position,line_items[j].size,0,0,0};
       labels.push_back(seq);
   }*/
 }
 
 
 
 
 
 for(long int p=0;p<file_reads_labels.size();p++){
   cout  << "Size: " << file_reads_labels.size() << endl;
   cout << file_reads_labels[p];
   }
   
   
   
   std::string sequences_string="";
   fclose(pfile);
   // fclose(pfile); 
    cout << "file closed" << endl;
   
   FILE* zfile;
   zfile = fopen (infile_name.c_str(),"r");
  cout << "file opened" << endl;
  
  current_position=sequences_vec[0].initial_position;
  for(long int i=0;i<sequences_vec.size();i++){
    if(sequences_vec[i].initial_position == 56011){
      cout << i << endl;
    }
  }
  
  value=' ';
 // while((value = fgetc(zfile))!= EOF){
   while(current_position < sequences_vec[sequences_vec.size()-1].final_position){
  // sequence_str="";
  cout << current_position;
  value=fgetc(zfile);
    sequence_str +=value;
    current_position++;
}
//cout << sequence_str << endl;

 long int seq_size=0;
 
for(long int r=0;r<sequences_vec.size();r++){
    seq_size=sequences_vec[r].final_position-sequences_vec[r].initial_position;
    // cout << "sequence_Str_size:" << sequence_str.size() << endl;
    //cout << sequence_str.substr(sequences_vec[r].initial_position-1,seq_size) << endl;
     file_reads_sequences.push_back(sequence_str.substr(sequences_vec[r].initial_position-1,seq_size));
//cout << file_reads_sequences.empty() << endl;     
}
cout << file_reads_sequences.size() << endl;

fclose(zfile);
  
  /*for(long int j=0; j< file_reads_lines.size();j++){
   
   index=0;
   c=file_reads_lines[j].at(index);
  //cout << j << endl;
    // index=0;
    do{
     
      if(c.compare(">") != 0){
        sequences_string+=file_reads_lines[j].at(index);
       cout << sequences_string << endl;
       // cout << index << endl;
        //cout << file_reads_lines[j].size() << endl;
        //index++; 
       index++;
       
     }
     else{
        file_reads_sequences.push_back(sequences_string);
        sequences_string="";
        index=file_reads_lines[j].size()-1;
     }
     
      
     
    }while(index<file_reads_lines[j].size()-1);
        
     
 }
 file_reads_sequences.push_back(sequences_string);
 sequences_string="";
 index=0;
 
 file_reads_sequences.erase(file_reads_sequences.begin());*/
 
  for(long int p=0;p<file_reads_sequences.size();p++){
   //cout << "Size: " << file_reads_sequences.size() << endl;
  cout << file_reads_sequences[p] << endl;
   }
   //cout << sequences_vec.size() << endl;
 
 
 /* for(long int j=0; j< file_reads_sequences.size();j++){
   cout << file_reads_labels[j] << endl;
   cout << file_reads_sequences[j] << endl;
   if(j<file_reads_sequences.size()-1){
   sequences_string+=file_reads_labels[j]+"\n"+file_reads_sequences[j]+"\n";
   }
   else{
   sequences_string+=file_reads_labels[j]+"\n"+file_reads_sequences[j];
   }
   cout << "item: " << sequences_string << endl;
   file_reads.push_back(sequences_string);
}  */
   
   /*index=0;
   c=file_reads_lines[j].at(index);
  cout << index << endl;
    // index=0;
    do{
      //cout << index<< endl;
     if(c.compare(">") != 0){
       sequences_string+=file_reads_lines[j].at(index);
       //cout << sequences_string << endl;
       // cout << index << endl;
        //cout << file_reads_lines[j].size() << endl;
        index++; 
       //index++;
       
     }
     else if(c.compare(">") == 0 && index>0){
        file_reads.push_back(sequences_string);
        sequences_string=">";
        index++;
        //index=file_reads_lines[j].size()-1;
     }
     else if(c.compare(">") == 0 && index==0){
        sequences_string=">";
        index++;
     }
      /*else if(c.compare(">") == 0 && index>1 ){
        file_reads_sequences.push_back(sequences_string);
        sequences_string="";
        index=file_reads_lines[j].size()-1;
     }
     else if(c.compare(">") == 0 && index==0){
        file_
     }
     
    }while(index<file_reads_lines[j].size()-1);*/
        
     

 //file_reads.push_back(sequences_string);
 //sequences_string="";
 //index=0;
//}

/*for(long int p=0;p<file_reads.size();p++){
   cout << "Size: " << file_reads.size() << endl;
   cout << file_reads[p] << endl;
   } */

 
  // cout << sequences_vec.size() << endl;
// std::pair< std::vector<item>,std::vector<std::string> > pair_string_item = std::make_pair(items_vec,file_reads);
std::vector<item> item_vec_second = items_vec;
l=0;
      do{
      
  
  cout << endl;
     //j=items_data.second[k].initial_position;
     //j=sequences_vec[l].initial_position;
    l_size_chunk = sequences_vec[l].final_position-sequences_vec[l].initial_position;
    cout << "l_size_chunk: " << l_size_chunk << endl;
    cout << l << endl;
    //cout << sequences_vec[1208].size << endl;
     j=0;
     //cout << j << endl;
   //  while(j<sequences_vec[l].final_position){
     while(j<l_size_chunk){
     //assert(j>0);
       // ordered_fasta_file << buffer[j-1];
        //cout << j-1 << " , " << buffer[j-1] << endl;
        //sequences_read_file << j-2 << " , " << buffer[j-2] << endl;
        //cout << buffer[j-1] << endl;
      //  sequences_read_file << j-2 << " , " << buffer[j-2] << endl;
       // cout << buffer[j] << endl;
        //if(buffer[j-1]=='A' || buffer[j-1]=='T'){
        //cout << c << endl;
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
        }
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
     }while(l<sequences_vec.size()-1); 
     cout << "buffer" << endl;
     //for(long int i=0;i<items_data.first.size();i++){
   //    for(long int i=0;i<items_vec.size();i++){
    //   nucleotide_records << i << " AT: " << items_vec[i].AT_nucleotides << "," << " CG: "  << items_vec[i].CG_nucleotides << " N: " << items_vec[i].N_nucleotides << endl;     
      // cout << i << " A: " << items_data.first[i].A_nucleotides << "," << " C: "  << items_data.first[i].C_nucleotides << "," << " G: " << items_data.first[i].G_nucleotides << "," << " T:" << items_data.first[i].T_nucleotides << endl;
     //}
     final_pos = items_vec[items_vec.size()-1].final_position-1;
  //   cout << "Final Pos: " << final_pos << endl;
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
 
 //file_reads[order(items)];
 
        
 /*for(int k=0;k<items_vec.size();k++){
  for(int p=0;p<item_vec_second.size();p++){
   if(std::equal(items_vec[k],item_vec_second[p]) ){
    file_reads[p]=file_reads[k];
   }
  }
 }*/
 
 k++;
 //cout << "buffer" << endl;
 //l_size_chunk+=chunk_read;
  
   
  
     //std::sort(items_vec.begin(), items_vec.end() , compareByData);
//std::sort(items_data.first.begin(), items_data.first.end() ,compareByCNucleotide);
 //cout << buffer[42885] << endl;
//for(long int i=41140;i<41170;i++)
//{
// cout << buffer[i] << endl;
//}
FILE* wfile;
wfile = fopen (infile_name.c_str(),"r");
  cout << "file opened" << endl;
 //fseek(pfile,1, SEEK_BEG);
 //l_size = ftell(pfile);
 //l_size_chunk=chunk_read;
 //rewind(pfile);
j=0;
long int position =0;
sequence_str = "";
//while((value = fgetc(pfile))!= EOF){

//while((value = fgetc(wfile))!= EOF){
current_position=0;

//while(current_position < items_vec[items_vec.size()-1].final_position ){
  for(long int i=0;i<items_vec.size();i++){
  do{
    value = fgetc(pfile);
    sequence_str +=value;
    current_position++;
   }while(current_position<items_vec[i].size);
   current_position=0;
}
//cout << items_vec[0].initial_position << endl;
//cout << items_vec[0].final_position << endl;
//cout << sequence_str.substr(74,104) << endl;


for(long int r=0;r<items_vec.size();r++){
    long int item_size=items_vec[r].final_position-items_vec[r].initial_position;
    //cout << items_vec[0].final_position << endl;
    file_reads.push_back(sequence_str.substr(items_vec[r].initial_position-1,item_size));
}


for(long int p=0;p<file_reads.size();p++){
 cout << "Size: " << file_reads.size() << endl;
 cout << "file_reads: " <<  file_reads[p] << endl;
   } 

 for(long int i=0;i<items_vec.size();i++){
     //rewind(wfile);      
     //fseek(wfile,items_vec[i].initial_position , SEEK_SET);
     cout << items_vec.size() << endl;
     l_size_chunk=items_vec[i].final_position-items_vec[i].initial_position; 
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
        //ordered_fasta_file << buffer[j];
        //cout << file_reads[i].at(j);
        ordered_fasta_file << file_reads[i].at(j);
       // ordered_fasta_file << file_reads_sequences[i].at(j);
        //cout << "write: " << file_reads[i].at(j) << endl;
        //cout << j << endl;
        //cout << file_reads[i].size() << endl;
        //cout << items_vec[i].final_position << endl;
        //cout << buffer[j-1] << endl;
        if(j==l_size_chunk){
          //ordered_fasta_file << file_reads_labels[i].at(j);
          ordered_fasta_file << file_reads[i].at(j) << endl;
          //ordered_fasta_file <<"\n"<< endl;
         // cout << j-1 << endl;
          //ordered_fasta_file << buffer[j];
       }
          
     //}
        //cout << sizeof(buffer) << endl;
        // ordered_file_pos << j-1 << " : " << buffer[j-1] << endl;
       /* if(i==0){
        cout << j-1 << endl;
        }*/
        //cout << j-1 << " , " << buffer[j-1] << endl;
        
        j++;
      }
   //fclose(pfile);
    //free(buffer);
     }
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
   ordered_fasta_file.close();
  // nucleotide_records.close();
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
 std::pair<std::vector<item>,std::vector<item>> recorded_items;
 std::vector<label> recorded_labels={};
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
      sequence_ordering(recorded_items.first,Sort_size,recorded_items.second,infile,outfile);
                
                break;
      
      case Sort_nucleotide_AT:
       		recorded_items = readFilePositions(infile);
  sequence_ordering(recorded_items.first,Sort_nucleotide_AT,recorded_items.second,infile,outfile);
                
                break;
     case Sort_nucleotide_CG:
       		recorded_items = readFilePositions(infile);
      sequence_ordering(recorded_items.first,Sort_nucleotide_CG,recorded_items.second,infile,outfile);
                
                break;
                
      case Sort_alphabetically:
       		recorded_items = readFilePositions(infile);
      sequence_ordering(recorded_items.first,Sort_alphabetically,recorded_items.second,infile,outfile);
                
                break;
       
       case Shuffle:
       		recorded_items = readFilePositions(infile);
       	     shuffle_items(recorded_items.first,recorded_items.second,infile,seed);
      	     
      	     break;
       
       default:
       
       recorded_items = readFilePositions(infile);
      sequence_ordering(recorded_items.first,Sort_size,recorded_items.second,infile,outfile);
      
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
