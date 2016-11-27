#!/usr/bin/env bash
 
### add devise .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 
echo 'gem "devise"' >> Gemfile

# https://github.com/hisea/devise-bootstrap-views
echo 'gem "devise-bootstrap-views"' >> Gemfile

#echo 'gem "devise_ldap_authenticatable", :git => "git://github.com/cschiewek/devise_ldap_authenticatable.git"' >> Gemfile


bundle


rails generate devise:install
rails generate devise user
rake db:migrate

#rails g devise_ldap_authenticatable:install


# rails generate devise:views 

# for bootstrap views..
rails g devise:views:locale en


git add -A # Add all files and commit them
git commit -m "add devise 1"
  
   
# add auth requirement in controller..  
#     sed -i '/CLIENTSCRIPT="foo"/a CLIENTSCRIPT2="hello"' file  # add line after pattern
sed -i '/ApplicationController/a  before_filter :authenticate_user!' app/controllers/application_controller.rb
  

  
  
#  error.. this puts in line1 in many many lines...

# add line after match...  sed -i '/CLIENTSCRIPT="foo"/a CLIENTSCRIPT2="hello"' file
#
# file1='app/assets/stylesheets/application.scss'
# pattern1='require_self'
# line1=' \*= require devise_bootstrap_views'
# sed  -i "0,/$pattern1/a $line1" $file1
  
# use ruby..
  
file1='app/assets/stylesheets/application.scss'
# ruby -pi.bak.txt -e "gsub(/require_self/ , 'require_self\n *= require devise_bootstrap_views')" $file1
ruby -pi.baktxt -e 'gsub(/require_self/ , "require_self\n *= require devise_bootstrap_views")' $file1
mkdir -p _offline
cp "$file1".baktxt _offline/application.scss."$(date +"__%Y.%m.%d_%H.%M.%S")".baktxt
rm $file1.baktxt


  
cat << 'HEREDOC' >> db/seeds.rb

User.create! email: 'a@e',  password: 'a', password_confirmation: 'a'
User.create! email: 'a', name: 'admin' , password: 'a', password_confirmation: 'a'
# u1 = User.create({name: "reg", email: "r", password: "a", password_confirmation: "a"})

HEREDOC
  

ruby ../bashrail/devisethor2.rb gsub1 a

 
git add -A # Add all files and commit them
git commit -m "add devise 2"
  