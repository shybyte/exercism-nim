import sequtils

proc sum*(n: int, factors: seq[int]): int = 
  for i in 1..<n:
    if (factors.anyIt(i mod it == 0)):
        result += i
