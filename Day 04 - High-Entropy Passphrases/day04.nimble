# Package

version       = "0.1.0"
author        = "Lu\xC3\xADs Figueiredo"
description   = "Day 04"
license       = "MIT"

# Dependencies

requires "nim >= 0.17.2"

# Task runners
task run, "builds and runs the day 04 application":
  exec "nim c -r -d:release day04.nim"