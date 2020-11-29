class RnaTranscript {
  
  // Fields
  String[] templateSequence; // The nucleotide sequence of the DNA
  String[] transcriptSequence; // The nucleotide sequence of the RNA transcript, transcribed from the template sequence
  int sequenceLength; // Length of the sequence
  
  // Constructor
  RnaTranscript(String[] nucleotideSequence) {
    
    this.templateSequence = nucleotideSequence;
    this.sequenceLength = nucleotideSequence.length;
    this.transcriptSequence = new String[sequenceLength];
    
  }
  
  // Methods
  
  void transcribeDNA() {
    
    for (int i=0; i<sequenceLength; i++) {
     
      if (templateSequence[i].equals("A"))
        transcriptSequence[i] = "U";
      else if (templateSequence[i].equals("T"))
        transcriptSequence[i] = "A";
      else if (templateSequence[i].equals("C"))
        transcriptSequence[i] = "G";
      else if (templateSequence[i].equals("G"))
        transcriptSequence[i] = "C";
    }
  
  }
    
    
    
  }
  
  
  
  
  
  
  
  
  
  
