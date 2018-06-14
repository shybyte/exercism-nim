import strutils, sequtils, pegs, unicode

proc abbreviate*(s: string): string =
    s.findAll(peg"\letter+")
      .mapIt(it.runeAt(0).toUpper)
      .join("")