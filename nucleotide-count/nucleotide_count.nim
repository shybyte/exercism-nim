import strutils, tables

proc count*(c: char, s: string): int = s.count(c)
  
proc countDna*(dna: string): auto = toCountTable(dna)