#!/usr/bin/env bash

#usage: bashrail/examples/bashruby-textsubreplace.sh

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# prep..

filep1='./tmpfile12.txt'

cat << 'HEREDOC' > $filep1
 ("hello.txt",&:read).gsub("install","latest"))
  ("install","latest"))

HEREDOC



### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# sub..

r1tmp='./temprubyrunner.rb'
cat << HEREDOC > $r1tmp
  File.write("$filep1",File.open("$filep1",&:read).gsub("install","latest"))
HEREDOC
#
ruby $r1tmp

cat $filep1



### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# sub 2, add new text above patrn...

echo '2..'

r1tmp='./temprubyrunner.rb'
cat << 'HEREDOC' > $r1tmp
  filep2='./tmpfile12.txt'
  
  patrn = '("hello.txt"'
  
  repl2 = %Q{
  Second
  (\"hello.txt\"}
  
  File.write(filep2, File.open( filep2, &:read).gsub( patrn, repl2 ) )
HEREDOC
#
ruby $r1tmp

cat $filep1


### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# replace whole line containing patrn...

echo '3..'

r1tmp='./temprubyrunner.rb'
cat << 'HEREDOC' > $r1tmp
  filep2='./tmpfile12.txt'
  
  patrn = '\(\"hello.txt\"'
  
  repl2 = %Q{  third line }
  
  File.write(filep2, File.open( filep2, &:read).gsub( /.*\(\"hello.txt\".*/, repl2 ) )
HEREDOC
#
ruby $r1tmp

cat $filep1
