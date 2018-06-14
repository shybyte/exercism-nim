import sequtils, algorithm, future, unicode

proc sortedChars(word: string): seq[char] = word.sorted(system.cmp[char])

proc detectAnagrams*(word: string, candidates: seq[string]): seq[string] =
  let wordLowerCase = word.toLower()
  let sortedLowerWordChars = sortedChars(wordLowerCase)
  candidates.filter(c  =>
      sortedLowerWordChars == sortedChars(c.toLower) and c.toLower != wordLowerCase
    )