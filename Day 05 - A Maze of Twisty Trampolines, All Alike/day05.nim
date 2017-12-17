import os, strutils, sequtils


proc strToInt(x: string): int =
  try: x.parseInt
  except ValueError: 0

var 
  mem: seq[int] = map(readFile("input.txt").splitLines(), strToInt)
  steps = 0
  offset = 0

while offset < mem.len:
  let tempOffset = offset;
  offset += mem[offset];
  mem[tempOffset] = if (mem[tempOffset] >= 3): mem[tempOffset] - 1 # part2
                    else: mem[tempOffset] + 1; # part1
  steps.inc

echo steps