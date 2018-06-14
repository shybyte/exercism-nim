import sequtils, math

iterator getDigits(x: Natural): Natural =
  var temp = x
  while temp > 0:
      yield temp mod 10
      temp = temp div 10;

proc isArmstrongNumber*(x: Natural): bool = 
  let digits = toSeq(getDigits(x))
  x == digits.mapIt(it ^ digits.len).sum
