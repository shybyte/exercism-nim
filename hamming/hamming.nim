import sequtils, future

proc distance*(s1, s2: string): int =
  zip(@s1, @s2)
    .filter(pair => pair.a != pair.b )
    .len()