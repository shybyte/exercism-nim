from strutils import strip, isNilOrEmpty, endsWith
from unicode import toUpper, toLower

proc isUpperCaseAndHasAlphabeticChars(s: string): auto =
  s.toUpper() == s and s != s.toLower()

proc hey*(inputRaw: string): string =
  let input = inputRaw.strip()
  if input.isNilOrEmpty:
    "Fine. Be that way!"
  elif isUpperCaseAndHasAlphabeticChars(input):
    if input.endsWith("?"):
      "Calm down, I know what I'm doing!"
    else:
      "Whoa, chill out!"
  elif input.endsWith("?"):
    "Sure."
  else:
    "Whatever."
