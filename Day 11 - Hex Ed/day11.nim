import os, strutils, sequtils, tables, math


const input: seq[string] = readFile("input.txt").split(',')
var 
  dirCount = initTable[string, int]()
  maxDistance = 0

dirCount["n"] = 0
dirCount["nw"] = 0
dirCount["ne"] = 0
dirCount["s"] = 0
dirCount["sw"] = 0
dirCount["se"] = 0

for dir in input:
  case dir:
    of "n":
      if dirCount["s"] > 0:
        dirCount["s"].dec
      elif dirCount["sw"] > 0:
        dirCount["sw"].dec
        dirCount["nw"].inc
      elif dirCount["se"] > 0:
        dirCount["se"].dec
        dirCount["ne"].inc
      else:
        dirCount[dir].inc

    of "ne":
      if dirCount["sw"] > 0:
        dirCount["sw"].dec
      elif dirCount["nw"] > 0:
        dirCount["nw"].dec
        dirCount["n"].inc
      elif dirCount["s"] > 0:
        dirCount["s"].dec
        dirCount["se"].inc
      else:
        dirCount[dir].inc

    of "se":
      if dirCount["nw"] > 0:
        dirCount["nw"].dec
      elif dirCount["n"] > 0:
        dirCount["n"].dec
        dirCount["ne"].inc
      elif dirCount["sw"] > 0:
        dirCount["sw"].dec
        dirCount["s"].inc
      else:
        dirCount[dir].inc

    of "s":
      if dirCount["n"] > 0:
        dirCount["n"].dec
      elif dirCount["ne"] > 0:
        dirCount["ne"].dec
        dirCount["se"].inc
      elif dirCount["nw"] > 0:
        dirCount["nw"].dec
        dirCount["sw"].inc
      else:
        dirCount[dir].inc

    of "sw":
      if dirCount["ne"] > 0:
        dirCount["ne"].dec
      elif dirCount["se"] > 0:
        dirCount["se"].dec
        dirCount["s"].inc
      elif dirCount["n"] > 0:
        dirCount["n"].dec
        dirCount["nw"].inc
      else:
        dirCount[dir].inc

    of "nw":
      if dirCount["se"] > 0:
        dirCount["se"].dec
      elif dirCount["s"] > 0:
        dirCount["s"].dec
        dirCount["sw"].inc
      elif dirCount["ne"] > 0:
        dirCount["ne"].dec
        dirCount["n"].inc
      else:
        dirCount[dir].inc

  var distance = 0
  for dist in dirCount.values:
    distance += dist
  if distance > maxDistance:
    maxDistance = distance


echo maxDistance
echo dirCount