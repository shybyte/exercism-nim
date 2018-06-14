import sequtils

proc charToBin(c: char): int =
  case c:
    of '0': return 0
    of '1': return 1
    else: raise newException(ValueError, "Binary numbers should only contain 0 and 1")

proc binary*(input: string): int =
  input.map(charToBin).foldl(a*2 + b)