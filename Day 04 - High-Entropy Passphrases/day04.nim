import os, strutils, sequtils, algorithm


var passed = 0
for line in lines "input.txt":
  let token = line.split(" ")
  let unique = token.deduplicate()

  if token.len == unique.len:
    var hasAnagram = false
    for word in unique:
      for word2 in unique:
        if word != word2:
          if word.sorted(cmp) == word2.sorted(cmp):
            hasAnagram = true
            continue
    if not hasAnagram:
      passed.inc

echo passed