#!/usr/bin/env bash
#cd ; 
date ; set +vx  ; set -vx ; # echo off, then echo on
#

# works!  2016-07-27

# usage: ldap265mk/ldap265.sh  
#
# or Paste these commmands in to terminal from share203 folder in ubuntu vbox vm..
# files to copy are in $sfiles

# example paths...
# app will be created in..
# share203/ldap265c
# config files to copy are in...
# share203/ldap265mk


sfiles='../ldap265mk'
appn='ldap265h'
#path1='ldap265x'
#path1="../$appn"

echo $appn
echo $path1
echo $sfiles

rails _4.2.6_ new  $appn
cd $appn

# add table global prefix.. 
#sed -i '/CLIENTSCRIPT/a \ \ CLIENTSCRIPT2' file  # add line after pattern - include leading spaces like so - escape them.. '\ '  
sed -i "/class Application/a\ \ \ \ config.active_record.table_name_prefix = 'rr4_'" config/application.rb


rails g scaffold post title body:text
bundle
rake db:migrate

echo 'gem "devise"' >> Gemfile
echo 'gem "devise_ldap_authenticatable", :git => "git://github.com/cschiewek/devise_ldap_authenticatable.git"' >> Gemfile
bundle

rails generate devise:install
rails generate devise user
rake db:migrate
rails g devise_ldap_authenticatable:install
rails generate devise:views 

rm -rf .git
git init
git add -A # Add all files and commit them
git commit -m "first"

# add auth requirement in controller..  
#sed -i '/CLIENTSCRIPT="foo"/a CLIENTSCRIPT2="hello"' file  # add line after pattern
sed -i '/ApplicationController/a  before_filter :authenticate_user!' app/controllers/application_controller.rb

# change email field to text field on login page..
#replace foo with bar once per line...
#sed -i -e 's/foo/bar/' filename
#sed -i -e 's/email_field/text_field/' app/views/devise/sessions/new.html.erb

#replace only the first occurrence  --  sed -i -e '0,/foo/s/foo/bar/' filename -  http://stackoverflow.com/questions/148451/how-to-use-sed-to-replace-only-the-first-occurrence-in-a-file
sed -i -e '0,/email_field/s/email_field/text_field/' app/views/devise/sessions/new.html.erb

# copy in config files..
cp -f $sfiles/devise.rb config/initializers
cp  $sfiles/ldap.yml  config

echo  run rails s
echo  Now visit localhost:3000/posts
#

