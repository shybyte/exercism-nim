import sequtils, tables

type
  Reactor* = object
  Cell* = ref object of RootObj
    valueIntern*: int
    outputs: seq[Compute]
  Input* = ref object of Cell
  Compute* = ref object of Cell
    inputs: seq[Cell]
    computation: Computation
    callbacks: Table[RegisteredCallback, Callback]
    nextRegisterdCallback: int
    valueOld*: int
  Computation* = proc(vals: seq[int]): int
  Callback* = proc(val: int)
  RegisteredCallback* = int


proc value*(this: Cell): int = this.valueIntern

proc recalc(this: Compute)

proc forwardChange(this: Cell) =
  for output in this.outputs:
    output.recalc()

proc getDependentComputeCells(this: Cell): seq[Compute] =
  result = this.outputs
  for output in this.outputs:
    result.add(output.getDependentComputeCells())
  

proc recalc(this: Compute) =
  let newValue = this.computation(this.inputs.map(value));
  if newValue != this.valueIntern:
    this.valueIntern = newValue
    this.forwardChange()

proc onAllComputationsFinished(this: Compute) =
  if this.valueIntern != this.valueOld:
    this.valueOld = this.valueIntern
    for callback in this.callbacks.values:
      callback(this.valueIntern)

proc addCallback*(this: Compute, callback: Callback): RegisteredCallback =
  result = this.nextRegisterdCallback
  this.nextRegisterdCallback += 1
  this.callbacks.add(result, callback)

proc removeCallback*(this: Compute, registeredCallback: RegisteredCallback) =
  this.callbacks.del(registeredCallback)


proc `value=`*(this: Input, value: int) =
  this.valueIntern = value
  this.forwardChange()
  for dependentComputeCells in this.getDependentComputeCells().deduplicate:
    dependentComputeCells.onAllComputationsFinished()


proc newReactor*(): Reactor = Reactor()

proc createInput*(reactor: Reactor, value: int): Input =
 Input(valueIntern: value, outputs: @[])

proc createCompute*(reactor: Reactor, inputs: seq[Cell], computation: Computation): Compute =
  result = Compute(
    inputs: inputs, 
    computation: computation, 
    callbacks: initTable[RegisteredCallback, Callback](),
    outputs: @[]
  )
  result.recalc()
  result.onAllComputationsFinished()
  for input in inputs:
    input.outputs.add(result)
