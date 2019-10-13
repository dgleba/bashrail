#!/usr/bin/env bash
echo ~----------~----------Startingd $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")



# new rails app  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
pwd

# change for rails 5
# gem install rails -v 5.2.3 --no-ri --no-rdoc

ruby -v ; rails -v 


if [  -d "$appn" ]; then
  # Control will enter here if DIRECTORY  exists.
  set +vx
  echo 'Error 8!  - app name folder already exists.'
  #seco=110 ; read -t $seco -p "Hit ENTER or wait $seco seconds"
  exit 8
fi


# change for rails 5
# rails _4.2.7.1_ new $appn --skip-bundle
rails  _5.2.3_  new $appn --skip-bundle --no-document


if [ ! -d "$appn" ]; then
  # Control will enter here if DIRECTORY doesn't exist.
  set +vx
  echo 'Error 9!  - app not created. folder doesn`t exist after attempting to create it.'
  #seco=110 ; read -t $seco -p "Hit ENTER or wait $seco seconds"
  exit 9
fi

cd $appn ; pwd





rm -rf .git
git init

echo '/config/puma.rb' >> .gitignore
echo '/config/ldap.yml' >> .gitignore
echo '/config/database.yml' >> .gitignore
echo '/config/secrets.yml' >> .gitignore

git add -A # Add all files and commit them
  git commit -m "New, Before any changes. Created using github.com/dgleba/bashrail."

