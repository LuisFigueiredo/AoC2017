import math


const input: int = 347991

# finds the next odd square (= width)
var width = input.float.sqrt.ceil.int
if width mod 2 == 0:
  width.inc

let
  radius = width div 2
  # calculates the relative position (how far from the center) it is
  relPos = (input - (width - 2).float.pow(2).int + radius) mod (width - 1)

echo relPos + radius