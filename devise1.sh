#!/usr/bin/env bash
echo ~----------~----------Startingd $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")

 
### add devise .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 
echo 'gem "devise"' >> Gemfile

#echo 'gem "devise_ldap_authenticatable", :git => "git://github.com/cschiewek/devise_ldap_authenticatable.git"' >> Gemfile

bundle

git add -A # Add all files and commit them
git commit -m "add devise start"

# Create user and roles tables..

# rails g scaffold Role name description active_status:integer sort:integer
# rails g scaffold User name role:belongs_to 
# rake db:migrate

rails generate devise:install

git add -A # Add all files and commit them
git commit -m "add devise 1a"
 
rails generate devise user

git add -A # Add all files and commit them
git commit -m "add devise 1b"
  
# copy ability and user model..
mkdir -p  backup/app/models
cp -a app/models/ backup/app/
cp -a $sfil2/app/models/user.rb app/models/

cp -a $sfil2/db/migrate/30170101010101_add_devise2_to_users.rb db/migrate/


git add -A # Add all files and commit them
git commit -m "add devise 1c"
  

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
git commit -m "add devise 1d"
  
  
 
# add auth requirement in controller..  
#     sed -i  '/CLIENTSCRIPT="foo"/a CLIENTSCRIPT2="hello"' file  # add line after pattern
#sed -i  "/ApplicationController/a  before_filter :authenticate_user!" app/controllers/application_controller.rb
sed -i  "/ApplicationController/a  before_action :authenticate_user!" lib/templates/rails/scaffold_controller/controller.rb


 
### edit devise config .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   
ruby $sfil2/devise2thor.rb gsub1 a
  
  
###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# uncomment key


# config.secret_key

# uncomment line containing pattern...
#
filetarg='config/initializers/devise.rb'
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
  repl2 = %Q{
  notused here
  }
  ARGF.each do |line|
    line.sub!('#','') if line =~ /config\.secret_key/
    puts line
  end
HEREDOC
ruby $r1tmp $filetarg > $filetarg.tmp
cp $filetarg.tmp $filetarg; rm $filetarg.tmp



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


### edit seeds .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   
source $sfil2/seeds1.sh 
 
 
###  ~~~~~~~~~ .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
# add logout link to home page..

ruby $sfil2/devise2thor.rb gsub3 a
 

 
# Add Name to user
rails g migration AddNameToUser name
   
   
###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# copy ability and user model..
cp -a $sfil2/config/environments/development.rb config/environments/



# edit the login page to show how to login..

# sftp://10.4.1.228/srv/share/test/brails/brail484b46/app/views/devise/sessions/new.html.erb

# after 
# <h2>Log in</h2>

# <br> <div> Username (enter into the email box below) = a ,  Password = a </div> <br>



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   
git add -A # Add all files and commit them
git commit -m "add devise 2"
  
