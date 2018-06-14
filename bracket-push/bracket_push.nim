import sequtils

const OpeningBrackets = "{[("
const ClosingBrackets = "}])"
const AllBrackets = OpeningBrackets & ClosingBrackets

proc isPaired*(input: string): bool =
  let inputBrackets = toSeq(input.items)
    .filterIt(AllBrackets.contains(it))
  var stack: seq[char] = @[]
  for bracket in inputBrackets:
      let bracketIndex = OpeningBrackets.find(bracket)
      if (bracketIndex >= 0):
        stack.add(ClosingBrackets[bracketIndex])
      elif stack.len == 0 or stack.pop() != bracket:
          return false
  stack.len == 0
