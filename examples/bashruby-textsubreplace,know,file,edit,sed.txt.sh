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

# sub...  if line contains pattern, sub in place.

filetarg='app/views/pets/_form.html.erb'
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
  ARGF.each do |line|
    if line =~ /image,/
      line.sub! /f.text_field/, "f.file_field" 
    end  
    puts line
  end
HEREDOC
ruby $r1tmp $filetarg > $filetarg.tmp
cat $filetarg.tmp
cp $filetarg.tmp $filetarg; rm $filetarg.tmp

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# add whole line after line containing patrn... I get error file busy,  maybe due to virtualbox windows share.



# http://stackoverflow.com/questions/28119359/how-do-i-add-a-line-after-another-line-in-a-file-in-ruby
#
# insert_line.rb
#   run with command "ruby insert_line.rb myinputfile.txt", where you
#   replace "myinputfile.txt" with the actual name of your input file
$-i = ".orig"
ARGF.each do |line|
  puts line
  puts "four" if line =~ /^three$/
end


****       or        ****



#  add new lines of text after patrn...

r1tmp='/tmp/$USER_temprubyrunner.rb'
filetarg='lib/templates/rails/scaffold_controller/controller.rb'
cat << 'HEREDOC' > $r1tmp
  #$-i = ".origtxt" # make backup and appear to edit in place. | #file busy error, maybe due to virtualbox windows share.
  repl2 = %Q{
  #cancancan
  load_and_authorize_resource}
  ARGF.each do |line|
    puts line
    puts repl2 if line =~ /before_action/
  end  
HEREDOC
#
ruby $r1tmp $filetarg > $filetarg.tmp
cp $filetarg.tmp $filetarg; rm $filetarg.tmp



****       or        ****


 # add lines to roles_controller after..
 
r1tmp='/tmp/$USER_temprubyrunner.rb'
cat << 'HEREDOC' > $r1tmp
  repl2 = %Q{
  #cancancan
  load_and_authorize_resource}
  ARGF.each  { |line|  puts line ;  puts repl2 if line =~ /before_action/ }
HEREDOC
filetarg='app/controllers/roles_controller.rb'
ruby $r1tmp $filetarg > $filetarg.tmp ; cp $filetarg.tmp $filetarg ; rm $filetarg.tmp


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# add new lines of text before patrn...
#

# cat 'app/views/pets/_form.html.erb'
# grep end 'app/views/pets/_form.html.erb'

filetarg='app/views/layouts/application.html.erb'
cat $filetarg
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
patrn='csrf_meta'
  repl2 = %Q{
          <%= javascript_include_tag "autocomplete-rails.js" %>
  }
  ARGF.each do |line|
    puts repl2 if line =~ /#{Regexp.escape(patrn)}/
    puts line
  end
HEREDOC
ruby $r1tmp $filetarg > $filetarg.tmp
cat $filetarg.tmp
cp $filetarg.tmp $filetarg; rm $filetarg.tmp


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# uncomment line containing pattern...
#
filetarg='config/initializers/rails_admin.rb'
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
  repl2 = %Q{
  notused
  }
  ARGF.each do |line|
    line.sub!('#','') if line =~ /config\.audit.*paper_trail/
    puts line
  end
HEREDOC
ruby $r1tmp $filetarg > $filetarg.tmp
cp $filetarg.tmp $filetarg; rm $filetarg.tmp


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

