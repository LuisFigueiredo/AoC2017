import os, strutils


const inputStr = readFile("input.txt")
var
  cmpChar: char
  sum: int = 0

if inputStr.len > 0:
  let offset = inputStr.len div 2

  for ci in 0..<inputStr.len:
    cmpChar = inputStr[(ci + offset) mod inputStr.len]
    if cmpChar == inputStr[ci]:
      sum += ($cmpChar).parseInt # $ (toString) because parseInt needs string

echo sum
