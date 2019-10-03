#!/usr/bin/env bash
echo ~----------~----------Startingd $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 # read settings..

read  appn  sfil  sfil2  mpwd  parm0</tmp/"_brvar1202_${USER}".txt
echo $appn $sfil $sfil2 $mpwd $parm0

# timeout1=5 ; read -t "${timeout1}" -p "Press ENTER or wait $timeout1 seconds..." || true ;  echo ;


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# should already be there..
#echo "gem 'devise'" >> Gemfile

echo "gem 'devise_token_auth'" >> Gemfile
echo "gem 'omniauth'" >> Gemfile

bundle


rails g devise_token_auth:install User auth

# NoMethodError: undefined method []' for ActiveRecord::Migration:...   db/migrate/ _devise_token_auth_create_users.rb
# NoMethodError: undefined method `[]' for ActiveRecord Migration db/migrate/ devise_token_auth_create_users.rb [4.2]


# remove 4.2
# class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[4.2]

r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
  path='db/migrate/'
  # get the filename of the newest file in the folder..
  filep1=Dir[File.join(path, '*')].max_by(&File.method(:ctime))
  puts filep1
  #edit the file to remove [4.2]
  File.write(filep1,File.open(filep1,&:read).sub("[4.2]",""))
HEREDOC
ruby $r1tmp


rake db:migrate


git add -A # Add all files and commit them
git commit -m "devise token auth1"



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 # add roles and tie it to users.

# http://danielstrunk.me/blog/2014/08/19/references-vs-belongs_to-activerecord-migrations/
# http://stackoverflow.com/questions/15385087/add-associations-to-exisiting-models

# see cancan... rails g scaffold Role name description active_status:integer sort:integer

# git add -A # Add all files and commit them
# git commit -m "devise token auth2"





### edit seeds .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


source $sfil2/seeds2.sh



 # http://stackoverflow.com/questions/30496770/devise-token-auth-cant-create-user-account-after-installing-devise-token-auth




### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



# add auth requirement in controller..
#     sed -i  '/CLIENTSCRIPT="foo"/a CLIENTSCRIPT2="hello"' file  # add line after pattern
sed -i  '/ApplicationController/a  before_filter :authenticate_user!' app/controllers/application_controller.rb




### edit devise config .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ruby $sfil2/devise2thor.rb gsub1 a




###  git. .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

git add -A # Add all files and commit them
git commit -m "devise token auth3"


