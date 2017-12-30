import os


const soc = readFile("input.txt")
var
  groups = 0
  garbage = 0

  stack = 0
  isGarbage = false
  ignore = false

for ch in soc:
  if ignore:
    ignore = false
    continue
  ignore = ch == '!'
  
  if isGarbage:
    isGarbage = ch != '>'
    if (isGarbage and not ignore):
      garbage.inc
  else:
    case ch:
      of '<':
        isGarbage = true
      of '{':
        stack.inc
      of '}':
        groups += stack
        stack.dec
      else:
        continue

echo groups
echo garbage