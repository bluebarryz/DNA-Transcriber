class Dna {
 
  // Fields
  String[] dnaSequence;
  String headingType; 
  
  int mutationLocation;
  String replacementNucleotide;
  String dnaLabel; // Indicates if the object is an "original" DNA strand or a "mutant" one
  
  // Constructor
  Dna(String ns, String ht) {
   
    this.dnaSequence = ns.split("");
    this.headingType = ht;

  }
  
  
  // Methods
  
  // Methods for creating DNA Mutations
  
  void nucleotideSubstitution(int index, String replacementNucleotide) {
    
    this.mutationLocation = index;
    this.replacementNucleotide = replacementNucleotide;    

    dnaSequence[index] = replacementNucleotide;
        
  }
  
  
  
  void nucleotideDeletion(int index) {
    
    this.mutationLocation = index;

    
    String[] newDnaSequence = new String[dnaSequence.length-1];
    
    for (int i=0; i<newDnaSequence.length;i++) {
     
      if (i<index)
        newDnaSequence[i] = dnaSequence[i];
      else
        newDnaSequence[i] = dnaSequence[i+1];
      
    }
    
    dnaSequence = newDnaSequence;

  }
  
  
  void nucleotideAddition(int index, String newNucleotide) {
    
    this.mutationLocation = index;
    this.replacementNucleotide = newNucleotide;

    
    String[] newDnaSequence = new String[dnaSequence.length+1];
    
    for (int i=0; i<newDnaSequence.length;i++) {
     
      if (i<index)
        newDnaSequence[i] = dnaSequence[i];
      else if (i==index)
        newDnaSequence[i] = newNucleotide;
      else
        newDnaSequence[i] = dnaSequence[i-1];
      
    }
    
    
    dnaSequence = newDnaSequence;
  }
  
  
  
  
  // Methods for printing the DNA, RNA, and amino acid sequences 
  
  
  void printDna() {  

    print(dnaLabel);
    
    NucleotideSequence ns = new NucleotideSequence(dnaSequence);
    ns.printSequence();
    println();
    
  }
  
  void printTranscriptSequence() {

    print("RNA transcript:         ");
    
    RnaTranscript r = new RnaTranscript(dnaSequence); 
    r.transcribeDNA(); 
    NucleotideSequence ns = new NucleotideSequence(r.transcriptSequence);
    ns.printSequence();
    println();
     
  }
  
  void printAminoAcidChain() {

    RnaTranscript r = new RnaTranscript(dnaSequence);
    r.transcribeDNA(); 
    
    AminoAcidChain a = new AminoAcidChain(r.transcriptSequence);

    a.translateRNA();
    a.printAminoAcidChain();
    println();
    println();
    println();
    println();
    
  }
  
  
  
  // Helper methods
    
  // Method for printing a heading for each Dna object
  
  void printHeading() {
    
    String heading = getHeading(headingType);
    println(heading);
    println(headingUnderline(heading));
    println();   
    
  }
  
  // Method for assigning the appropriate heading based on the type of mutation.
  
  String getHeading(String headingType) {
    
    String heading;
    String aOrAn;
  
    
    if (headingType.equals("noMutation")) {
      heading = "Original DNA sequence with no mutations.";
      this.dnaLabel = "Original DNA sequence:  ";
    }
    else if (headingType.equals("nucSubstitution")) {
      
      if (replacementNucleotide.equals("A"))
        aOrAn = "an";
      else
        aOrAn = "a";        
        
      heading = "Nucleotide substitution mutation:  The nucleotide at index " + str(mutationLocation) + " has been replaced with " + aOrAn + " \"" + replacementNucleotide + "\" nucleotide."; 
      this.dnaLabel = "Mutant DNA sequence:    "; 
      
    }
    else if (headingType.equals("nucDeletion")) {
      heading = "Nucleotide deletion mutation:  The nucleotide at index " + str(mutationLocation) + " has been deleted."; 
      this.dnaLabel = "Mutant DNA sequence:    ";
    }
    else {
      
      if (replacementNucleotide.equals("A"))
        aOrAn = "An";
      else
        aOrAn = "A";  
      
      heading = "Nucleotide addition mutation:  " + aOrAn  + " \"" + replacementNucleotide + "\" nucleotide has been inserted at index " + str(mutationLocation) + "."; 
      this.dnaLabel = "Mutant DNA sequence:    ";
    }
    return heading;

  }
  
  
  // Method for getting an underline that matches the length of the heading
  String headingUnderline(String heading) {
   
    String output = "";
    
    for (int i=0; i<heading.length(); i++) {
     
      output += "-";
    }
    
    return output;
  }
  
}
