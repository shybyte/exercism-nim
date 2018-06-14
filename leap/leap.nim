proc isLeapYear*(year: int): bool {.noSideEffect, procvar.} =
  proc isDivisibleBy(d: int): bool = year mod d == 0
  (isDivisibleBy(4) and not isDivisibleBy(100)) or isDivisibleBy(400)
  