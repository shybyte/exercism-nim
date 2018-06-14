import sequtils

const RULES = [
    ("M", 1000), ("CM", 900),
    ("D", 500), ("CD", 400),
    ("C", 100), ("XC", 90),
    ("L", 50), ("XL", 40),
    ("X", 10), ("IX", 9),
    ("V", 5), ("IV", 4),
    ("I", 1)
]

proc numeral*(x: Natural): string = 
  let rulesSmallerOrEqual = RULES.filterIt(x >= it[1])
  if rulesSmallerOrEqual.len > 0:
    let rule = rulesSmallerOrEqual[0]
    return rule[0] & numeral(x - rule[1])
  else:
    return ""