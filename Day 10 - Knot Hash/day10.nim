import strutils, sequtils, algorithm


proc strToInt(x: string): int =
  try: x.parseInt
  except ValueError: 0


const append: seq[int] = "17,31,73,47,23".split(',').map(strToInt)

# ""          ->  a2582a3a0e66e6e86e3812dcb672a272
# "AoC 2017"  ->  33efeb34ea91902bb2f59c9920caa6cd
# "1,2,3"     ->  3efbe78a8d82f29979031a4aa0b16a9d
# "1,2,4"     ->  63960835bcdc130f0b66d7ff4f6a5a8e
let input = "120,93,0,90,5,80,129,74,1,165,204,255,254,2,50,113".map(proc(x: char): int = int(x)).concat(append)
# let input: seq[int] = "1,2,3".map(proc(x: char): int = int(x)).concat(append)
# let input = "3,4,1,5".split(',').map(strToInt)

var
  list {.noinit.}: array[0..255, int]
  # list {.noinit.}: array[0..4, int]
  skip = 1
  curr = 0
  hash = ""

for i in countup(0, list.len - 1):
  list[i] = i


for n in countup(1, 64):
  for length in input:
    let limit = curr + length - 1
    # echo "New reversal from ", curr, " to ", limit
    for i in countup(curr, ((curr + limit) div 2)):
      # echo "Swapping indexes: ", i mod list.len, " <-> ", ((curr + limit - i) mod list.len)
      swap(list[i mod list.len], list[(curr + limit - i) mod list.len])

    curr = (limit + skip) mod list.len
    skip.inc

for i in countup(0, list.len - 1, 16):
  hash.add(list[i..i + 15].foldl(a xor b).toHex(2))


echo hash
