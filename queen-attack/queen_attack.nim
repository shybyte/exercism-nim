import  sequtils, strutils

const BOARD_SIZE = 8

type Pos = tuple[rank, file :int]

proc assertValidPos(pos: Pos) =  
  if not (pos.rank in (0..<BOARD_SIZE) and pos.file in (0..<BOARD_SIZE)):
    raise newException(ValueError, "Position is outside of board")

proc assertValidInput(white, black: Pos) =
  assertValidPos(white)
  assertValidPos(black)
  if white == black:
    raise newException(ValueError, "Queens in same position")

proc board*(white, black: Pos): seq[string] = 
  assertValidInput(white, black)
  result = newSeqWith(BOARD_SIZE, repeat('_', BOARD_SIZE))
  result[white.rank][white.file] = 'W'
  result[black.rank][black.file] = 'B'

proc canAttackHorizontalOrVertical(white, black: Pos): bool =
  white[0] == black[0] or white[1] == black[1]

proc canAttackDiagonal(white, black: Pos): bool =
  abs((white[0] - black[0]) / (white[1] - black[1])) == 1

proc canAttack*(white, black: Pos): bool = 
  assertValidInput(white, black)
  canAttackHorizontalOrVertical(white, black) or canAttackDiagonal(white, black)