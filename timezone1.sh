#!/usr/bin/env bash
echo ~----------~----------Startingd $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 # add table prefix and timezone
 
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
#   add lines after line matching..
cat << 'HEREDOC' > $r1tmp
  replc = %Q{
    
    config.time_zone = 'Eastern Time (US & Canada)'
    }
  ARGF.each  { |line|  puts line ;  puts replc if line =~ /Rails::Application/ }
HEREDOC
filetarg='config/application.rb'
ruby $r1tmp $filetarg > $filetarg.tmp && cp $filetarg.tmp $filetarg && rm $filetarg.tmp



###  git. .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

git add -A # Add all files and commit them
git commit -m "change application.rb timezone"
  
  
