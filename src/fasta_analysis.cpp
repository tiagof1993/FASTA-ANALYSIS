#include <stdio.h> 
#include <stdlib.h>
#include "fasta_analysis.hpp"
#include "msg.hpp"
#include <sstream>

#define DEF_VERBOSE            0

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


std::pair< std::vector<item>,std::vector<item> > readFilePositions(std::string file_name){
  //items contain label+sequence positions
  //cout << file_name << endl;
   std::vector<item> items={{1,1,0,0,0}};
   std::ofstream reads_file("reads.txt");
   assert(reads_file.is_open()); 
   std::ofstream items_read("items.txt");
   assert(items_read.is_open()); 
   std::ofstream line_items_file("line_items_file.txt");
   assert(line_items_file.is_open()); 
   std::ofstream labels_file("labels_file.txt");
   assert(labels_file.is_open()); 
   std::ofstream sequences_file("sequences_file.txt");
   assert(sequences_file.is_open()); 
   
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
 
 buffer = (char*) malloc (sizeof(char)*l_size);
 if(buffer == NULL) {fputs("Memory error",stderr); exit(2);}
 
 result = fread(buffer,1,l_size,ofile);


 item seq;
    char value;
    int label=0;
    long int label_size=0;
    long int current_position=0;
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
               if(label==1){
                 reads_file << value;
               }
        }

      
        //while(label==1){
        //  reads_file << value;
       // }
    }
    seq={items[items.size()-1].final_position,current_position, current_position-items[items.size()-1].final_position,0,0,0}; 
    items.push_back(seq);
    items.erase(items.begin());

    cout << "Item records:" << endl;
  for(long int i=0; i< items.size(); i++){
    cout << items[i].size << ", " << items[i].initial_position << ", " << items[i].final_position << endl;
    //items_read << items[i].size << ", " << items[i].initial_position << ", " << items[i].final_position << endl;
  for(long int j=items[i].initial_position; j< items[i].final_position;j++){
    items_read << buffer[j-1];
  }
 }
 items_read << "\n";

 cout << "Line Item records:" << endl;
  for(long int i=0; i< line_items.size(); i++){
    cout << line_items[i].size << ", " << line_items[i].initial_position << ", " << line_items[i].final_position << endl;
    //items_read << items[i].size << ", " << items[i].initial_position << ", " << items[i].final_position << endl;
  for(long int j=line_items[i].initial_position; j< line_items[i].final_position;j++){
    line_items_file << buffer[j-1];
  }
 }
 line_items_file << "\n";

 seq = {line_items[1].initial_position,line_items[1].final_position,line_items[1].size,0,0,0};
//std::vector<item> labels={line_items[1].initial_position,line_items[1].final_position,line_items[1].size};
std::vector<item> labels = {seq};


for(long int i=0; i< items.size();i++ ){
  for(long int j=1; j< line_items.size();j++){
   if(line_items[j].initial_position+1==items[i].final_position){
       seq={line_items[j].initial_position,line_items[j].final_position,line_items[j].size,0,0,0};
       labels.push_back(seq);
   }
 }
}
   cout << "Label records:" << endl;
  for(long int i=0; i< labels.size(); i++){
    cout << labels[i].size << ", " << labels[i].initial_position << ", " << labels[i].final_position << endl;
    //labels_file << labels[i].size << ", " << labels[i].initial_position << ", " << labels[i].final_position << endl;
    for(long int j=labels[i].initial_position; j< labels[i].final_position;j++){
  //j=items[i].initial_position;
 //do{
      labels_file << buffer[j-1];
  //  j++;
 //} while(j=items[i].final_position);
  }
 }

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

  cout << "Sequence records:" << endl;
  for(long int i=0; i< sequence.size(); i++){
     cout << sequence[i].size << ", " << sequence[i].initial_position << ", " << sequence[i].final_position << endl;
     
     for(long int j=sequence[i].initial_position; j<= sequence[i].final_position;j++){
  //j=items[i].initial_position;
 //do{
  if(j==sequence[i].final_position && i< sequence.size()-1){
      sequences_file << endl;
    }
  //else if(j== sequence[sequence.size()-1].final_position){
  //  sequences_file << "\n";
  // }
   else{
    sequences_file << buffer[j];
   }
  }
}

  //return items;
  //return sequence;
  return std::make_pair(items,sequence);

}

void sequence_ordering(std::vector<item> items_vec,std::vector<item> sequences_vec,std::string infile_name, std::string outfile_name, std::string nucleotide){
 //std::fstream infile(infile_name.c_str());
 std::ofstream ordered_fasta_file(outfile_name.c_str());
 assert(ordered_fasta_file.is_open());
 std::ofstream ordered_file_pos("ordered_file.txt");
 assert(ordered_file_pos.is_open());
 std::ofstream nucleotide_records("nucleotide_records.txt");
 assert(nucleotide_records.is_open());
 std::ofstream sequences_read_file("sequence_reads.txt");
 assert(sequences_read_file.is_open());
 
//std::pair<std::vector,std::vector> items_data = std::make_pair(items_vec,sequences_vec);
 //std::vector<label> labels={};
  FILE* pfile;
  size_t result;
  long l_size;
  char* buffer;
  pfile = fopen (infile_name.c_str(),"r");
  
 fseek(pfile,1, SEEK_END);
 l_size = ftell(pfile);
 rewind(pfile);
 
 buffer = (char*) malloc (sizeof(char)*l_size);
 if(buffer == NULL) {fputs("Memory error",stderr); exit(2);}
 
 result = fread(buffer,1,l_size,pfile);
 
 //std::sort(items_data.begin(), items_data.end() , compareByData);
 
 long int j=0;
 long int k=0;
 //std::string seq="";
 /*long int A_count=0;
 long int C_count=0;
 long int G_count=0;
 long int T_count=0;*/
 long int AT_count=0;
 long int CG_count=0;
 long int N_count=0;
   //for(long int i=0;i<items_data.size();i++){
      do{
     //j=items_data.second[k].initial_position;
     j=sequences_vec[k].initial_position-1;
     while(j<sequences_vec[k].final_position){
     assert(j>0);
       // ordered_fasta_file << buffer[j-1];
        //cout << j-1 << " , " << buffer[j-1] << endl;
        //sequences_read_file << j-2 << " , " << buffer[j-2] << endl;
        j++;
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
      items_vec[k].AT_nucleotides=AT_count;
      items_vec[k].CG_nucleotides=CG_count;
      items_vec[k].N_nucleotides=N_count;
      //items_data.first[k].G_nucleotides=G_count;
      //items_data.first[k].T_nucleotides=T_count;
      AT_count=0;
      CG_count=0;
      N_count=0;
      //G_count=0;
     // T_count=0;
      k++;
     // seq="";
     }while(k<sequences_vec.size()); 
     //for(long int i=0;i<items_data.first.size();i++){
       for(long int i=0;i<items_vec.size();i++){
       nucleotide_records << i << " AT: " << items_vec[i].AT_nucleotides << "," << " CG: "  << items_vec[i].CG_nucleotides << " N: " << items_vec[i].N_nucleotides << endl;     
      // cout << i << " A: " << items_data.first[i].A_nucleotides << "," << " C: "  << items_data.first[i].C_nucleotides << "," << " G: " << items_data.first[i].G_nucleotides << "," << " T:" << items_data.first[i].T_nucleotides << endl;
     }
     long int final_pos = items_vec[items_vec.size()-1].final_position-1;
     cout << "Final Pos: " << final_pos << endl;
     std::sort(items_vec.begin(), items_vec.end() , compareByData);
//std::sort(items_data.first.begin(), items_data.first.end() ,compareByCNucleotide);
if(nucleotide=="AT" || nucleotide=="TA"){
  std::sort(items_vec.begin(), items_vec.end() , compareByATNucleotide);
 }
else if(nucleotide=="CG" || nucleotide=="GC"){
  std::sort(items_vec.begin(), items_vec.end() ,compareByCGNucleotide);
 }
else if(nucleotide=="N"){
  std::sort(items_vec.begin(), items_vec.end() ,compareByUnknownNucleotides);
}
 cout << buffer[42885] << endl;
//for(long int i=41140;i<41170;i++)
//{
// cout << buffer[i] << endl;
//}
 for(long int i=0;i<items_vec.size();i++){
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
        ordered_file_pos << j-1 << " : " << buffer[j-1] << endl;
       /* if(i==0){
        cout << j-1 << endl;
        }*/
        //cout << j-1 << " , " << buffer[j-1] << endl;
        j++;
      }
     }
     

     
    fclose(pfile);
    free(buffer);
   //infile.close();
  // fasta_file_2.close();
   ordered_fasta_file.close();
   nucleotide_records.close();
}

void shuffle_items(std::vector<item> item_vec, std::vector<item> sequence_vec,std::string input_filename, unsigned seed_numb, std::string nucleotide){
     unsigned seed=0;
     cout << "seed_numb: " << seed_numb << endl;
     //std::ofstream ("shuflle_file.txt");
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
    std::ofstream shuffle_file("shuflle_file.txt");
    assert(shuffle_file.is_open());
    shuffle_file << "item_vec.final" << endl;
    for(long int i=0;i<item_vec.size();i++){
      aux_int.push_back(item_vec[i].final_position-2);
      final_int.push_back(item_vec[i].final_position-1);
      shuffle_file << item_vec[i].final_position << endl;
      
    }
    //aux_int.push_back(item_vec[item_vec.size()-1].final_position-1);
    
      std::vector<item> aux_seq={};
      item seq={1,1,0,0,0};
      shuffle_file << "sequence_vec.final" << endl;
      for(long int j=0;j<sequence_vec.size();j++){
        shuffle_file << sequence_vec[j].final_position << endl;
      }
    for(long int i=0;i<aux_int.size();i++){
      for(long int j=0;j<sequence_vec.size();j++){
        //shuffle_file << sequence_vec[j].final_position << endl;
      if(aux_int[i]==sequence_vec[j].final_position){
        //seq = {sequence_vec[j]};
         aux_seq.push_back(sequence_vec[j]);
      }
      //else if(final_int[i]==sequence_vec[j].final_position){
       // aux_seq.push_back(sequence_vec[j]);
       // cout << final_int[i] << endl;
      //}
    }
  }

    shuffle_file << "aux_seq.final" << endl;
    shuffle_file << aux_seq.size() << endl;
    for(long int j=0;j<aux_seq.size();j++){
      shuffle_file << aux_seq[j].final_position << endl;
    }
  
  


 std::vector<long int> item_final_position={};

 

for(long int i=0; i< item_vec.size();i++){
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
}

 sequence_ordering(item_vec,aux_seq,input_filename,"shuffled_v2.fasta",nucleotide);

 shuffle_file.close();
   
    
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
 //PrintVersion();
 PrintMenuCompression();

 uint32_t verbose    = ArgsState (DEF_VERBOSE, p, argc, "-v", "--verbose");
  if(verbose){
    fprintf(stderr, "[>] Running FASTA_ANALYSIS v%u.%u ...\n", VERSION, RELEASE);
 }
 if(ArgsState(0, p, argc, "-V", "--version") ){
    PrintVersion();
    return EXIT_SUCCESS;
  }
  

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

   //std::string labels_file1="";
   
  //std::vector<int> positions={}; 
 // std::vector<std::string> labels_vector={};
 // std::vector<std::string> ordered_labels_vector={};
  // if(argc == 5){
   // if(CheckFileisFasta(argv[argc-1])){
     assert(CheckFileisFasta(argv[argc-1])); 
      infile= argv[argc-1];
    //}
     outfile = argv[argc-2];
     //seed_str = argv[3];
     seed = (unsigned)atoi(argv[argc-3]);
     nucleotide = argv[argc-4];
     //}
     
   //assert(infile.substr(infile.size()-6)==".fasta");
   //std::cout << infile.substr(infile.size()-6) << endl;
   assert(outfile.substr(outfile.size()-6)==".fasta" || outfile.substr(outfile.size()-3)==".fna");
   // assert(seed_str!="");
   assert(nucleotide!="");
   //assert (nucleotide=="A" || nucleotide=="C" || nucleotide== "G" || nucleotide == "T");
   assert (nucleotide=="AT" || nucleotide=="CG" || nucleotide=="TA" || nucleotide=="GC" || nucleotide=="N");
   //s << seed_str;
   //s >> seed;

   cout << "seed: " << seed <<endl;
   
   recorded_items = readFilePositions(infile);
    

   shuffle_items(recorded_items.first,recorded_items.second,infile,seed,nucleotide);
   sequence_ordering(recorded_items.first,recorded_items.second,infile,outfile,nucleotide);
   
  return 0;
}
