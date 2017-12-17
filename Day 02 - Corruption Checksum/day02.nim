import os, strutils, sequtils


proc strToInt(x: string): int =
  try: x.parseInt
  except ValueError: 0

var checksum: int = 0

for line in lines "input.txt":
  var
    maxDiv: int = 0
    minDiv: int  = 0

  let intLine = map(line.splitWhitespace(), strToInt)
  block found:
    for i in 0..<intLine.len:
      for j in 0..<intLine.len:
        if i != j:
          if intLine[i] > intLine[j]:
            if intLine[i] mod intLine[j] == 0:
              maxDiv = intLine[i]
              minDiv = intLine[j]
              break found
          else:
            if intLine[j] mod intLine[i] == 0:
              maxDiv = intLine[j]
              minDiv = intLine[i]
              break found

  checksum += maxDiv div minDiv

echo checksum