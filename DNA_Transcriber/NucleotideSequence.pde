// A class that represents a nucleotide sequence (can be either a DNA sequence or an RNA sequence)


class NucleotideSequence {
 
  //Field
  String[] DnaOrRnaSequence;
  int sequenceLength;
  //Constructor
  NucleotideSequence(String[] sequence) {
   
    this.DnaOrRnaSequence = sequence;
    this.sequenceLength = DnaOrRnaSequence.length;
    
  }
  
  //Methods
  
  // Prints out the nucleotide sequences of Dna an RnaTranscript
  // Prints the nucleotides three bases at a time to represent a codon (a triplet of nucleotides)
  // The reason for this format is because the ribosomes read the transcript sequence in non-overlapping frames of three nucleotides when they're translating the sequence into amino acids (i.e. "AAUUTGCCA" is read as "AAU", "UTG", "CCA" during translation) 
  // Each triplet of nucleotides is called a codon. Each codon is translated into one amino acid (i.e. when the ribosomes read the "AUG" codon, it translates it to the methionine (Met) amino acid, adding it to the amino acid chain).
  
  void printSequence() {
    String output =  "";
    
    for (int i=0; i<DnaOrRnaSequence.length; i+=3) {
      
      try {
        String n1 =  DnaOrRnaSequence[i];
        String n2 = DnaOrRnaSequence[i+1];
        String n3 = DnaOrRnaSequence[i+2];
        
        String codon =  n1 + n2 + n3 + " ";
        output += codon;

      }
      catch(Exception e) {
       
        for (int j=0; j<sequenceLength%3; j++){
         
          output+=   DnaOrRnaSequence[i+j];

        }
        
      }
      
    }
    
    println(output);
    
    }
    
  
  
}
