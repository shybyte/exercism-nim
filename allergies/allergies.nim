import sequtils

# Sorted ascending by corresponding bit
const ALLERGEN = [
    "eggs",
    "peanuts",
    "shellfish",
    "strawberries",
    "tomatoes",
    "chocolate",
    "pollen",
    "cats"
]

proc isBitTrue*(bitSet: Natural, bitPos: Natural): bool =
  (bitSet and (1 shl bitPos)) != 0

type
  Allergies* = object
    score*: int

proc isAllergicTo*(this: Allergies, item: string): bool =
  isBitTrue(this.score, ALLERGEN.find(item))

proc lst*(this: Allergies): seq[string] =
  ALLERGEN.filterIt(this.isAllergicTo(it))
