#!/usr/bin/env bash
 
### add devise .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 
echo 'gem "devise"' >> Gemfile

#echo 'gem "devise_ldap_authenticatable", :git => "git://github.com/cschiewek/devise_ldap_authenticatable.git"' >> Gemfile

bundle


rails generate devise:install
rails generate devise user
rake db:migrate

#rails g devise_ldap_authenticatable:install


rails generate devise:views 

###  devise-bootstrap-views. .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# https://github.com/hisea/devise-bootstrap-views
# echo 'gem "devise-bootstrap-views"' >> Gemfile
# bundle

### edit stylesheet for devise-bootstrap-views. 
 
#ruby ../bashrail/devise2thor.rb gsub2 a

# for devise-bootstrap-views..
# rails g devise:views:locale en



###  git. .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

git add -A # Add all files and commit them
git commit -m "add devise 1"
  
  
 
# add auth requirement in controller..  
#     sed -i '/CLIENTSCRIPT="foo"/a CLIENTSCRIPT2="hello"' file  # add line after pattern
sed -i '/ApplicationController/a  before_filter :authenticate_user!' app/controllers/application_controller.rb
 
 
 
 
### edit devise config .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   
ruby ../bashrail/devise2thor.rb gsub1 a
  
  


### edit seeds .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   
  
cat << 'HEREDOC' >> db/seeds.rb

User.create! email: 'a@e',  password: 'a', password_confirmation: 'a'
User.create! email: 'a',  password: 'a', password_confirmation: 'a'
# u1 = User.create({name: "reg", email: "r", password: "a", password_confirmation: "a"})

HEREDOC
  
  
###  ~~~~~~~~~ .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
# add logout link to home page..

ruby ../bashrail/devise2thor.rb gsub3 a
 

git add -A # Add all files and commit them
git commit -m "add devise 2"
  