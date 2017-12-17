import strutils, sequtils


proc strToInt(x: string): int =
  try: x.parseInt
  except ValueError: 0

var
  input: seq[int] = map("11	11	13	7	0	15	5	5	4	4	1	1	7	1	15	11".splitWhitespace(), strToInt)
  prevStates: seq[seq[int]] = newSeq[seq[int]]()
  cycles: int = 0

  # part2
  looped: int = 0
  loopSize:int = 0
  loopedInput: seq[int]

let cycleSize = input.len


while looped != 2:
  echo input
  prevStates.add(input)

  var mIndex: int = 0
  for i in 1..<cycleSize:
    if input[i] > input[mIndex]:
      mIndex = i

  var toSpread = input[mIndex]
  var penalty = 0
  while toSpread mod cycleSize != 0:
    toSpread.inc
    penalty.inc
  toSpread = toSpread div cycleSize

  input[mIndex] = 0
  for bIndex in 0..<cycleSize-penalty:
    input[(mIndex + bIndex + 1) mod cycleSize] += toSpread

  if prevStates.contains(input):
    loopedInput = input
    looped.inc
  if looped > 0:
    loopSize.inc
  else:
    cycles.inc

echo input
echo "Cycles till loop: ", cycles   # part1
echo "Loop size: ", loopSize        # part2