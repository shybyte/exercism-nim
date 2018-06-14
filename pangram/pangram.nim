import strutils, sequtils

const ALPHABET_SIZE = 26

proc isPangram*(s: string): bool =
  let letters = s.toLowerAscii.filter(isAlphaAscii)
  letters.deduplicate.len == ALPHABET_SIZE
