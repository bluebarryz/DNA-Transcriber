class AminoAcidChain {

  // Fields

  String[] transcriptSequence;
  int transcriptLength;
  String[] aminoAcidSequence;

  // Constructor

  AminoAcidChain(String[] transcriptSequence) {

    this.transcriptSequence = transcriptSequence;
    this.transcriptLength = transcriptSequence.length;
    this.aminoAcidSequence = new String[aminoAcidChainLength()];
  }

  // Function for calculating how many amino acids are going to be in the amino acid chain
  int aminoAcidChainLength() {
    
    int chainLength = (transcriptLength-transcriptLength%3)/3;

    for (int i=0; i<transcriptLength-transcriptLength%3; i+=3){
      
     
      // Searches for the index of the stop codon ("UAA", "UAG", "UGA").
      
      if (transcriptSequence[i].equals("U") && transcriptSequence[i+1].equals("A") && transcriptSequence[i+2].equals("A") ) {
        chainLength = i/3;
        break;
      }  
      else if (transcriptSequence[i].equals("U") && transcriptSequence[i+1].equals("A") && transcriptSequence[i+2].equals("G") ) {
        chainLength = i/3;
        break;
      }  
      else if (transcriptSequence[i].equals("U") && transcriptSequence[i+1].equals("G") && transcriptSequence[i+2].equals("A") ) {
        chainLength = i/3;
        break;
      }      
    
    }
    return chainLength;
  
  }
  

  
  
  // Methods
  
  int counter = 0;

  void translateRNA() {
    
    Boolean foundStartCodon = false;

    for (int i=0; i<aminoAcidChainLength()*3; i+=3) {
      
      // The following series of if-statements translates each codon to its corresponding amino acid
      // it is based on this table:  https://bit.ly/31m33ZR  
      
      if (foundStartCodon == false) {

        if ( transcriptSequence[i].equals("A") && transcriptSequence[i+1].equals("U") && transcriptSequence[i+2].equals("G") ) {
         
          foundStartCodon = true;
          aminoAcidSequence[counter] = "Met ";
         
          
        }
        
        else {
         
          aminoAcidSequence[counter] = "    ";
          
        }
      
      }


      else {
        
        if (transcriptSequence[i].equals("U")) {     // First letter of codon
  
              if (transcriptSequence[i+1].equals("U")) {     // Second letter of codon 
      
                    if (transcriptSequence[i+2].equals("U") || transcriptSequence[i+2].equals("C") ) {     // Third letter of codon
                      aminoAcidSequence[counter] = "Phe ";
                    } 
                    else if (transcriptSequence[i+2].equals("A") || transcriptSequence[i+2].equals("G") ) {   
                      aminoAcidSequence[counter] = "Leu ";
                  }
                  
              }
              
              else if (transcriptSequence[i+1].equals("C")) {   
                aminoAcidSequence[counter] = "Ser ";
              } 
              
              else if (transcriptSequence[i+1].equals("A")) {
      
                    if (transcriptSequence[i+2].equals("U") || transcriptSequence[i+2].equals("C") ) {
                      aminoAcidSequence[counter] = "Tyr ";
                    } 
       
              } 
              
              else if (transcriptSequence[i+1].equals("G")) {
      
                    if (transcriptSequence[i+2].equals("U") || transcriptSequence[i+2].equals("C") ) {
                      aminoAcidSequence[counter] = "Cys ";
                    } 
        
                    else if (transcriptSequence[i+2].equals("G") ) {
                      aminoAcidSequence[counter] = "Trp ";
                    }
                    
              }
          
        } // closes if (transcriptSequence[i].equals("U")) {
  
  
        else if (transcriptSequence[i].equals("C")) {  
  
              if (transcriptSequence[i+1].equals("U")) {
      
                aminoAcidSequence[counter] = "Leu ";
              } 
              
              else if (transcriptSequence[i+1].equals("C")) { 
      
                aminoAcidSequence[counter] = "Pro ";
              } 
              
              else if (transcriptSequence[i+1].equals("A")) {
      
                    if (transcriptSequence[i+2].equals("U") || transcriptSequence[i+2].equals("C") ) {
                      aminoAcidSequence[counter] = "His ";
                    } 
                    else if (transcriptSequence[i+2].equals("A") || transcriptSequence[i+2].equals("G") ) {
                      aminoAcidSequence[counter] = "Gin ";
                    }
                    
              }
              
              else if (transcriptSequence[i+1].equals("G")) {
      
                aminoAcidSequence[counter] = "Arg ";
              }
              
        } // closes  else if (transcriptSequence[i].equals("C")) {
          
          
          
        else if (transcriptSequence[i].equals("A")) {  
  
              if (transcriptSequence[i+1].equals("U")) {
                
                    if (transcriptSequence[i+2].equals("U") || transcriptSequence[i+2].equals("C") || transcriptSequence[i+2].equals("A") ) {
                      aminoAcidSequence[counter] = "Ile "; 
                    } 
                    else if (transcriptSequence[i+2].equals("G") ){
                      aminoAcidSequence[counter] = "Met ";
                    }
                  
              }
              
            
              else if (transcriptSequence[i+1].equals("C")) { 
                
                aminoAcidSequence[counter] = "Thr ";
    
              }
              
              
              else if (transcriptSequence[i+1].equals("A")) {
              
                    if (transcriptSequence[i+2].equals("U") || transcriptSequence[i+2].equals("C") ) {
                      aminoAcidSequence[counter] = "Asn ";
                    }
                    else if (transcriptSequence[i+2].equals("A") || transcriptSequence[i+2].equals("G") ) {
                      aminoAcidSequence[counter] = "Lys ";
                    }
                    
              }
              
              else if (transcriptSequence[i+1].equals("G")) {
              
                    if (transcriptSequence[i+2].equals("U") || transcriptSequence[i+2].equals("C") ) {
                      aminoAcidSequence[counter] = "Ser ";
                    }
                    else if (transcriptSequence[i+2].equals("A") || transcriptSequence[i+2].equals("G") ) {
                      aminoAcidSequence[counter] = "Arg ";
                    }
                  
              }
          
        } // closes  else if (transcriptSequence[i].equals("A")) {    
  
          
        else if (transcriptSequence[i].equals("G")) {  
  
              if (transcriptSequence[i+1].equals("U")) {
        
                aminoAcidSequence[counter] = "Val ";
                
              } 
              
              else if (transcriptSequence[i+1].equals("C")) { 
        
                aminoAcidSequence[counter] = "Ala ";
                
              } 
              
              else if (transcriptSequence[i+1].equals("A")) {
        
                    if (transcriptSequence[i+2].equals("U") || transcriptSequence[i+2].equals("C") ) {
                      aminoAcidSequence[counter] = "Asp ";
                    } 
                    else if (transcriptSequence[i+2].equals("A") || transcriptSequence[i+2].equals("G") ) {
                      aminoAcidSequence[counter] = "Glu ";
                    }
                
              }
              
              else if (transcriptSequence[i+1].equals("G")) {
        
                aminoAcidSequence[counter] = "Gly ";
                
              }
              
        } // closes  else if (transcriptSequence[i].equals("G")) {
        
        
      } // closes else {
              
        counter ++;

    } // closes   for (int i=0; i<aminoAcidChainLength()*3; i+=3) {
  
   } // closes method


  void printAminoAcidChain() {
    
    String str = join(aminoAcidSequence,"");
    print("Amino Acid Chain:       ");
    println(str);

    
  }



} 
