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
   std::vector<item> items={{1,1,0,0,0}};
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
  pfile = fopen (file_name.c_str(),"r");

  ofile = fopen(file_name.c_str(),"r");
 fseek(ofile,1, SEEK_END);
 l_size = ftell(ofile);
 rewind(ofile);
 
 //buffer = (char*) malloc (sizeof(char)*l_size);
 //if(buffer == NULL) {fputs("Memory error",stderr); exit(2);}
 
 //result = fread(buffer,1,l_size,ofile);


 item seq;
    char value;
    int label=0;
    long int label_size=0;
    long int current_position=0;
    try{
    while((value = fgetc(pfile))!= EOF){
     current_position++;
        switch(value){
        case '>': label=1; 
                  if(current_position>1){
                   seq={items[items.size()-1].final_position,current_position, current_position-items[items.size()-1].final_position,0,0,0}; 
                   items.push_back(seq);
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
        case 'A' : //reads_file << " ";
        case 'C' : //reads_file << " ";
        case 'T' : //reads_file << " ";
        case 'G' : //reads_file << value;
        default: 
        	continue;
               //if(label==1){
               //  reads_file << value;
              // }
        }

      
        //while(label==1){
        //  reads_file << value;
       // }
    }
    }catch(std::bad_alloc & exception){
      std::cerr << "Bad Alloc Exception" << exception.what();
    }
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
 
 long int j=0;
 long int k=0;
 long int final_pos=0;
 assert(ordered_fasta_file.is_open());
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
  
 fseek(pfile,1, SEEK_END);
 l_size = ftell(pfile);
 //l_size_chunk=chunk_read;
 //l_size_chunk=sequences_vec[0].final_position;
 rewind(pfile);
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
   
      do{
      cout << fseek(pfile,sequences_vec[l].initial_position , sequences_vec[l].final_position) << endl;
      //rewind(pfile);
      l_size_chunk=sequences_vec[l].final_position-sequences_vec[l].initial_position;   
 cout << sequences_vec[l].initial_position << endl;
 buffer = (char*) malloc (sizeof(char)*l_size_chunk);
 if(buffer == NULL) {fputs("Memory error",stderr); exit(2);}
 result = fread(buffer,sequences_vec[l].initial_position,sequences_vec[l].final_position,pfile); 
//cout << sizeof(buffer) << endl;

cout << sizeof(char)*l_size_chunk << endl;
for(long int i=0; i< sizeof(char)*l_size_chunk ;i++){
    cout << buffer[i-1] << endl;
  }
     //j=items_data.second[k].initial_position;
     j=sequences_vec[l].initial_position;
     //cout << j << endl;
     while(j<sequences_vec[l].final_position){
     assert(j>0);
       // ordered_fasta_file << buffer[j-1];
        //cout << j-1 << " , " << buffer[j-1] << endl;
        //sequences_read_file << j-2 << " , " << buffer[j-2] << endl;
        j++;
        //cout << buffer[j-1] << endl;
      //  sequences_read_file << j-2 << " , " << buffer[j-2] << endl;
       // cout << buffer[j] << endl;
        if(buffer[j-1]=='A' || buffer[j-1]=='T'){
          AT_count++;
        }
        else if(buffer[j-1]=='C' || buffer[j-1]=='G'){
          CG_count++;
        }
        else if(buffer[j-1]=='N'){
          N_count++;
        }
        /*else if(buffer[j-2]=='G'){
          G_count++;
        }
         else if(buffer[j-2]=='T'){
          T_count++;
        }*/
        //seq+=buffer[j-1];
      }
      //char seq[data[k].size] = buffer[data[k].initial_position-data[k].final_position];
      items_vec[l].AT_nucleotides=AT_count;
      items_vec[l].CG_nucleotides=CG_count;
      items_vec[l].N_nucleotides=N_count;
      //cout << items_vec[k].AT_nucleotides << endl;
      //items_data.first[k].G_nucleotides=G_count;
      //items_data.first[k].T_nucleotides=T_count;
      AT_count=0;
      CG_count=0;
      N_count=0;
      //G_count=0;
     // T_count=0;
      l++;
     // seq="";
     }while(l<sequences_vec.size()); 
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
 
 k++;
 //cout << "buffer" << endl;
 //l_size_chunk+=chunk_read;
  //fclose(pfile);
    fclose(pfile); 
   
  
     //std::sort(items_vec.begin(), items_vec.end() , compareByData);
//std::sort(items_data.first.begin(), items_data.first.end() ,compareByCNucleotide);
 //cout << buffer[42885] << endl;
//for(long int i=41140;i<41170;i++)
//{
// cout << buffer[i] << endl;
//}
FILE* wfile;
wfile = fopen (infile_name.c_str(),"r");
  
 //fseek(pfile,1, SEEK_BEG);
 //l_size = ftell(pfile);
 //l_size_chunk=chunk_read;
 //rewind(pfile);

 for(long int i=0;i<items_vec.size();i++){
      buffer = (char*) malloc (sizeof(char)*(items_vec[i].initial_position-items_vec[i].final_position));
      rewind(wfile);
 if(buffer == NULL) {fputs("Memory error",stderr); exit(2);}
 
 result = fread(buffer,items_vec[i].initial_position,items_vec[i].final_position,pfile); 
 
     j=items_vec[i].initial_position;
     while(j<items_vec[i].final_position){
        ordered_fasta_file << buffer[j-1];
        //cout << j-1 << endl;
        if(j==final_pos){
          ordered_fasta_file << buffer[j-1] << endl;
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
    free(buffer);
    fclose(wfile);
    
     }
     

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
