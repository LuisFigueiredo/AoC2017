import os, strutils, sequtils


var checksum = 0

for line in lines "input.txt":
  var max = low(int)
  var min = high(int)

  # convert the seq[string] -> line.splitWhitespace()
  # to seq[int] with map -> proc(x: string): int = x.parseInt
  for num in map(line.splitWhitespace(), proc(x: string): int = x.parseInt):
    if num > max:
      max = num
    if num < min:
      min = num

  checksum += max - min

echo checksum