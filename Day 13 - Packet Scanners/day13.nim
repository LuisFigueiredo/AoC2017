import strutils, sequtils, tables


var
  offset: int = 0
  caught: bool = true
  fw: OrderedTable[int, int] = initOrderedTable[int, int]()
  severity: int = 0

for line in splitLines strip readFile("input.txt"):
  let token = map( split(replace(line,":")), parseInt )
  fw[token[0]] = ((token[1] - 1) * 2)

# *
for key, val in fw.pairs:
  if ((key mod val) == 0):
    severity += key * (val / 2 + 1).int
echo severity

# **
while caught:
  caught = false
  for key, val in fw.pairs:
    if (((key + offset) mod val) == 0):
      caught = true
      break
  offset += 2
echo offset - 2 # - 2 because it incremented when it wasn't caught (better than comparisson each loop)
