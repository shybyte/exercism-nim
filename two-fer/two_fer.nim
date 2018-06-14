import strutils

proc twoFer*(name = "you"): string =
  "One for $#, one for me." % name