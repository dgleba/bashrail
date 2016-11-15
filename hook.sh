#!/bin/bash

# copy git hooks into place...

  cp -rfp util/hooks/* .git/hooks
 
  mtimestore -s
    sleep 2

  cat .mtimes |  ruby util/mtimeh.rb  > mtimeh.txt
  sort -r mtimeh.txt   > mtimehs.txt
    sleep 1

  # git add .mtimes mtimeh.txt mtimehs.txt
 
 