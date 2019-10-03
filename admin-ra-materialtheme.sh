#!/usr/bin/env bash
echo ~----------~----------Startingd $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")


#cd ;
 # set -e will exit on first error. so set -vxe..
date ; set +vx  ; set -vx ; # echo off, then echo on

# this
#   add rails_admin  material theme 
#

#  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# usage:
# if appn = rail281j then..
# input files will be in var/share203/rail281file folder.
# cd /home/albe/share203
#       rail347a4mksh/rail347a4-mk.sh
# The output will be that it creates  var/share203/rail281j/*
#
#   rail347a4mksh/rail347a6-mk.sh


#  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


     
  
### gemfile.. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

echo "# " >> Gemfile

# gem1="gem 'simple_form'"
# echo "$gem1" >> Gemfile

# rails_admin must already be installed..
# echo "gem 'rails_admin'" >> Gemfile
# or
# echo "gem 'rails_admin', :git =>  'https://github.com/dgleba/rails_admin.git'" >> Gemfile

echo "gem 'rails_admin_material'" >> Gemfile
echo "gem 'rails_admin_mydash'" >> Gemfile


echo "# " >> Gemfile

bundle

sleep 2
git add -A # Add all files and commit them
git commit -m "gemfile for rails_admin material theme"


#  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    
# material theme..

 
#
# add line after match...  sed -i '/CLIENTSCRIPT="foo"/a CLIENTSCRIPT2="hello"' file
# i think 0, means only do it for the first match..
#
pattern1='Bundler.require'
line1="  ENV['RAILS_ADMIN_THEME'] = 'material'"
# replace the entire line matching pattern1...
# sed  -i "0,/$pattern1/a \ \n$line1\n\n" config/application.rb 
sed  -i "/$pattern1/a \ \n$line1\n\n" config/application.rb 
 
 
mkdir -p app/assets/javascripts/rails_admin/custom
#
# add text to beginning of file..
sed -i '1i//= require rails_admin/themes/material/ui.js' app/assets/javascripts/rails_admin/custom/ui.js
# echo '//= require rails_admin/themes/material/ui.js' >> app/assets/javascripts/rails_admin/custom/ui.js
   

# bump version to get custom layout to load...
#  
# remove line containing  '[global]'  and replace the line completely with the new text...
#      sed -i  's/.*global].*/[global]\n\nunix extensions = no/g' /etc/samba/smb.conf 
patrn1='Rails.application.config.assets.version'
# patrn1='version'
patrn2='Rails.application.config.assets.version = \"1.3\"'
# patrn2='Railsxxxxx'
sed -i  -e "s/.*$patrn1.*/$patrn2/" config/initializers/assets.rb


#  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   

#  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function notusedcomments() {
: <<'BLOCKCOMMENT1'


  
  
BLOCKCOMMENT1
} 

#  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


