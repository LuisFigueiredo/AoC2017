# Package

version       = "0.1.0"
author        = "Lu\xC3\xADs Figueiredo"
description   = "Day 01"
license       = "MIT"

# Dependencies

requires "nim >= 0.17.3"

task run, "builds and runs the day 01 application":
  exec "nim c -r -d:release day01.nim"