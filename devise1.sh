#!/usr/bin/env bash
 
### add devise .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 
echo 'gem "devise"' >> Gemfile

#echo 'gem "devise_ldap_authenticatable", :git => "git://github.com/cschiewek/devise_ldap_authenticatable.git"' >> Gemfile

bundle

# Create user and roles tables..

rails g scaffold role name description active_status:integer sort:integer
rails g scaffold user name role:belongs_to 
rake db:migrate


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

 r1 = Role.create({name: "lr_minimal", description: "Can't do much"})
 r2 = Role.create({name: "lr_future1", description: ""})
 r3 = Role.create({name: "lr_readonly", description: ""})
 r4 = Role.create({name: "lr_future2", description: ""})
 r5 = Role.create({name: "lr_create", description: ""})
 r6 = Role.create({name: "lr_future3", description: ""})
 r7 = Role.create({name: "lr_regular", description: "Can edit data, readonly lookup tables"})
 r8 = Role.create({name: "lr_future4", description: ""})
 r9 = Role.create({name: "lr_supervisor", description: "Can edit lookup tables"})
r10 = Role.create({name: "lr_future5", description: ""})
r11 = Role.create({name: "lr_delete", description: ""})
r12 = Role.create({name: "lr_future6", description: ""})
r13 = Role.create({name: "lr_vip", description: ""})
r14 = Role.create({name: "lr_future7", description: ""})
r15 = Role.create({name: "lr_special1", description: ""})
r16 = Role.create({name: "lr_seller", description: ""})
r17 = Role.create({name: "lr_future8", description: ""})
r18 = Role.create({name: "lr_admin", description: "Can perform any CRUD operation on any resource"})
 

User.create! email: 'a@e', name: "admin", password: 'a', password_confirmation: 'a', role_id: r18.id
User.create! email: 'a', name: "admin", password: 'a', password_confirmation: 'a', role_id: r18.id
u1 = User.create({name: "reg", email: "r", password: "a", password_confirmation: "a", role_id: r7.id})

HEREDOC
  
  
###  ~~~~~~~~~ .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
# add logout link to home page..

ruby ../bashrail/devise2thor.rb gsub3 a
 

git add -A # Add all files and commit them
git commit -m "add devise 2"
  