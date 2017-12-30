import os, sequtils, strutils, tables, future


type
  Node = object
    weight: int
    children: seq[string]

proc nodeWeight(hashMap: Table[string, Node], name: string): int =
  let node = hashMap[name]
  result = node.weight
  for ch in node.children:
    result += hashMap.nodeWeight(ch)

proc walkNode(hashMap: Table[string, Node], name: string) =
  let node = hashMap[name]
  var weights: seq[int] = @[]
  for ch in node.children:
    weights.add(hashMap.nodeWeight(ch))
  for w in weights:
    if w != weights[0]:
      echo("Mismatch! ", name, ": ", weights[0], " != ", w)
      break

  if node.children.len > 0:
    echo(name, " (", node.weight, ") -> ", node.children.zip(weights))
  else:
    echo(name, " (", node.weight, ")")

  for c in node.children:
    hashMap.walkNode(c)


var hashTable = initTable[string, Node]()

for line in lines "input.txt":
  let
    splitLine = line.split({' ', '(', ')', '-', '>', ','}).filter(proc(x: string): bool = x.len > 0)
    name = splitLine[0]
    weight = splitLine[1].parseInt

  var children: seq[string] = @[]
  for cIndex in 2..<splitLine.len:
    children.add(splitLine[cIndex])

  hashTable[name] = Node(weight: weight, children: children)


var rootFinder = hashTable
for disk in hashTable.values:
  for ch in disk.children:
    rootFinder.del(ch)

var root: string
for r in rootFinder.keys: # how to get stuff from table in a better way
  root = r
echo "Root: ", root # part1

hashTable.walkNode(root)