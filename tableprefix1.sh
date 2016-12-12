#!/usr/bin/env bash

###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 # add table prefix and timezone
 
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
#   add lines after line matching..
cat << 'HEREDOC' > $r1tmp
  replc = %Q{
    config.active_record.table_name_prefix = "rr4_"
    config.time_zone = 'Eastern Time (US & Canada)'
    }
  ARGF.each  { |line|  puts line ;  puts replc if line =~ /Rails::Application/ }
HEREDOC
filetarg='config/application.rb'
ruby $r1tmp $filetarg > $filetarg.tmp && cp $filetarg.tmp $filetarg && rm $filetarg.tmp



###  git. .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

git add -A # Add all files and commit them
git commit -m "change application.rb table prefix and timezone"
  
  
