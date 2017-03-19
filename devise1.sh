#!/usr/bin/env bash
 
### add devise .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 
echo 'gem "devise"' >> Gemfile

#echo 'gem "devise_ldap_authenticatable", :git => "git://github.com/cschiewek/devise_ldap_authenticatable.git"' >> Gemfile

bundle

# Create user and roles tables..

# rails g scaffold Role name description active_status:integer sort:integer
# rails g scaffold User name role:belongs_to 
# rake db:migrate


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
 
#ruby $sfil2/devise2thor.rb gsub2 a

# for devise-bootstrap-views..
# rails g devise:views:locale en



###  git. .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

git add -A # Add all files and commit them
git commit -m "add devise 1"
  
  
 
# add auth requirement in controller..  
#     sed -i  '/CLIENTSCRIPT="foo"/a CLIENTSCRIPT2="hello"' file  # add line after pattern
#sed -i  "/ApplicationController/a  before_filter :authenticate_user!" app/controllers/application_controller.rb
sed -i  "/ApplicationController/a  before_filter :authenticate_user!" lib/templates/rails/scaffold_controller/controller.rb


 
### edit devise config .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   
ruby $sfil2/devise2thor.rb gsub1 a
  
  

### edit seeds .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   
source $sfil2/seeds1.sh 
 
 
###  ~~~~~~~~~ .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
# add logout link to home page..

ruby $sfil2/devise2thor.rb gsub3 a
 

 
# Add Name to user
rails g migration AddNameToUser name
   

   
git add -A # Add all files and commit them
git commit -m "add devise 2"
  
