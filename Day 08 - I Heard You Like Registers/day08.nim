import os, strutils, sequtils, tables


var hashMap = initTable[string, int]()
var runMax = 0

for line in lines "input.txt":
  let 
    splitLine = line.split(' ')
    reg = splitLine[0]
    op = splitLine[1]
    number = splitLine[2].parseInt
    regIf = splitLine[4]
    cmpOp = splitLine[5]
    cmpNum = splitLine[6].parseInt

  if not hashMap.contains(reg):
    hashMap[reg] = 0
  if not hashMap.contains(regIf):
    hashMap[regIf] = 0
    
  case cmpOp:
    of "==":
      if hashMap[regIf] != cmpNum:
        continue
    of "!=":
      if hashMap[regIf] == cmpNum:
        continue
    of "<":
      if hashMap[regIf] >= cmpNum:
        continue
    of "<=":
      if hashMap[regIf] > cmpNum:
        continue
    of ">":
      if hashMap[regIf] <= cmpNum:
        continue
    of ">=":
      if hashMap[regIf] < cmpNum:
        continue

  case op:
    of "inc":
      hashMap[reg] += number
    of "dec":
      hashMap[reg] -= number
  
  if hashMap[reg] > runMax:
    runMax = hashMap[reg]

var max = 0
for val in hashMap.values:
  if val > max:
    max = val

echo "Final max: ", max
echo "Runtime max: ", runMax