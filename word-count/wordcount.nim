import strutils, critbits, pegs

type TWordCount* = CritBitTree[int]

proc wordCount*(text: string): TWordCount = 
  result = TWordCount()
  for word in text.toLowerAscii().findAll(peg"[a-z0-9]+"):
    discard result.containsOrIncl(word, 0)
    result[word] = result[word] + 1