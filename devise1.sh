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


git add -A # Add all files and commit them
git commit -m "add devise 1"
  
   
# add auth requirement in controller..  
#     sed -i '/CLIENTSCRIPT="foo"/a CLIENTSCRIPT2="hello"' file  # add line after pattern
sed -i '/ApplicationController/a  before_filter :authenticate_user!' app/controllers/application_controller.rb
  

cat << 'HEREDOC' >> db/seeds.rb

User.create! email: 'a@e',  password: 'a', password_confirmation: 'a'
User.create! email: 'a', name: 'admin' , password: 'a', password_confirmation: 'a'
# u1 = User.create({name: "reg", email: "r", password: "a", password_confirmation: "a"})

HEREDOC
  

ruby ../bashrail/devisethor2.rb gsub1 a

 
git add -A # Add all files and commit them
git commit -m "add devise 2"
  