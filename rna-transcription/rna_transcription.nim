import sequtils, future, strutils

proc translateNucleotide(c: char): char =
  case c:
    of 'G': return 'C'
    of 'C': return 'G'
    of 'T': return 'A'
    of 'A': return 'U'
    else: raise newException(ValueError, "Invalid Nucleotide" & c)

proc toRna*(dna: string): string = 
  dna.map(translateNucleotide).join()