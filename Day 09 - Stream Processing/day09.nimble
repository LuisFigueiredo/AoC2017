# Package

version       = "0.1.0"
author        = "Lu\xC3\xADs Figueiredo"
description   = "Day 09"
license       = "MIT"

# Dependencies

requires "nim >= 0.17.2"

# Task runners
task run, "builds and runs the day 09 application":
  exec "nim c -r -d:release day09.nim"