// Background info:

// A DNA sequence is made up of four possible nucleotides (A,T,C,G)
// In order to produce proteins, the DNA sequence is transcribed into RNA, which is then translated into amino acids, the building blocks of proteins ( DNA --> RNA transcript (aka mRNA) --> Amino acids ).
// The nucleotide sequence of the RNA transcript is complementary to that of the DNA sequence:  
  // the complement of "A" in DNA is "U" in RNA.
  // the complement of "T" in DNA is "A" in RNA.  
  // the complement of "C" in DNA is "G" in RNA.
  // the complement of "G" in DNA is "C" in RNA.
  // ex. the DNA sequence "C,T,A,G,G" is transcribed into its complementary sequence "G,A,U,C,C".
  
// A non-overlapping triplet of nucleotides in the RNA transcript is called a codon (ex. "A,T,C,C,C,G" is made up of the codons "A,T,C" and "C,C,G").
// The ribosomes read the RNA transcript one codon at a time, translating each codon into an amino acid. The amino acid encoded by a particular codon is given by this table: https://bit.ly/31m33ZR . Each new amino acid is linked to the previous one, forming an amino acid chain. In the output line, the amino acids are printed so that they align with the codon they were translated from.
// When translating the codons, the ribosomes always start at the "start codon" ("A,U,G") of the RNA transcript. Translation terminates when the ribosome reaches the last codon of the RNA transcript, or when it encounters one of three "stop codons" ("U,A,A", "U,A,G", or "U,G,A").

// This program explores how different DNA mutations can alter the resulting amino acid sequence.



void setup() {

  // Original DNA with no mutations
  Dna d1 = new Dna("CTGAGCTACTGAGCTGAGCTGCAGAGCCGAGCTCCTGTGTAAACTTG","noMutation");
  
  d1.printHeading();
  d1.printDna();
  d1.printTranscriptSequence();
  d1.printAminoAcidChain();
  
  // Nucleotide substitution: one of the nucleotides of the original DNA sequence is substituted for a different nucleotide.
  Dna d2 = new Dna(join(d1.dnaSequence,""),"nucSubstitution"); 
  
  d2.nucleotideSubstitution(12,"A");
  d2.printHeading();
  d1.printDna();
  d2.printDna();
  d2.printTranscriptSequence();
  d2.printAminoAcidChain();

  // Nucleotide deletion: one of the nucleotides of the original DNA sequence is deleted.
  Dna d3 = new Dna(join(d1.dnaSequence,""),"nucDeletion");
  
  d3.nucleotideDeletion(9);
  d3.printHeading();
  d1.printDna();  
  d3.printDna();
  d3.printTranscriptSequence();
  d3.printAminoAcidChain();  

  // Nucleotide addition: A nucleotide is added to the original DNA sequence. 
  Dna d4 = new Dna(join(d1.dnaSequence,""),"nucAddition");  
  d4.nucleotideAddition(36,"A");
  d4.printHeading();
  d1.printDna();  
  d4.printDna();  
  d4.printTranscriptSequence();
  d4.printAminoAcidChain();
  
}
