import strutils, sequtils, tables, sets


var village: Table[int, seq[int]] = initTable[int, seq[int]]() # village = id: connections
for line in splitLines strip readFile"input.txt":
  let connections = map( split(replace(replace(line,",")," <->")), parseInt )
  village[connections[0]] = connections[1..^1]
let maxId = village.len - 1 # need to keep the maxId because village is going to be changed 

proc add( s: var HashSet[int], x: int ) =
  s.incl x
  for y in village[x]:
    if y notin s:
      add s, y
  village.del x

var s = initSet[int]()
add s, 0
echo s.len # part 1
var groups = 1
for i in 0..maxId:
  if i in village:
    groups += 1
    var s = initSet[int]()
    add s, i
echo groups # part 2