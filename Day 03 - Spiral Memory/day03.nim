import math, tables


const input: int = 347991

# part 1
# finds the next odd square (= width)
# var width = input.float.sqrt.ceil.int
# if width mod 2 == 0:
#   width.inc

# let
#   radius = width div 2
#   # calculates the relative position (how far from the center) it is
#   relPos = (input - (width - 2).float.pow(2).int + radius) mod (width - 1)

# echo "part 1: ", relPos + radius

# part 2
proc sumNear(table: Table, x: int, y: int): int =
  result = 0

  var key = $(x+1) & $y
  if table.hasKey(key): result += table[key]

  key = $(x+1) & $(y+1)
  if table.hasKey(key): result += table[key]

  key = $(x) & $(y+1)
  if table.hasKey(key): result += table[key]

  key = $(x-1) & $(y+1)
  if table.hasKey(key): result += table[key]

  key = $(x-1) & $y
  if table.hasKey(key): result += table[key]

  key = $(x-1) & $(y-1)
  if table.hasKey(key): result += table[key]

  key = $(x) & $(y-1)
  if table.hasKey(key): result += table[key]

  key = $(x+1) & $(y-1)
  if table.hasKey(key): result += table[key]


var
  x = 0
  y = 0
  table = {"00": 1}.toTable
  step = 0

while true:
  echo $x & ", " & $y & ":\t", table[$x & $y]

  for i in 0..step:
    x.inc
    table[$x & $y] = sumNear(table, x, y)
    echo $x & ", " & $y & ":\t", table[$x & $y]
    if table[$x & $y] > input:
      quit()

  for i in 0..step:
    y.inc
    table[$x & $y] = sumNear(table, x, y)
    echo $x & ", " & $y & ":\t", table[$x & $y]
    if table[$x & $y] > input:
      quit()

  step.inc

  for i in 0..step:
    x.dec
    table[$x & $y] = sumNear(table, x, y)
    echo $x & ", " & $y & ":\t", table[$x & $y]
    if table[$x & $y] > input:
      quit()

  for i in 0..step:
    y.dec
    table[$x & $y] = sumNear(table, x, y)
    echo $x & ", " & $y & ":\t", table[$x & $y]
    if table[$x & $y] > input:
      quit()

  step.inc