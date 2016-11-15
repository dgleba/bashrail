#!/usr/bin/env bash



# new rails app  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
pwd

ruby -v ; rails -v
rails _4.2.7.1_ new $appn


if [ ! -d "$appn" ]; then
  # Control will enter here if DIRECTORY doesn't exist.
  echo 'Error! app not created. folder doesn`t exit.'
  #seco=110 ; read -t $seco -p "Hit ENTER or wait $seco seconds"
  exit 9
fi

cd $appn ; pwd

rm -rf .git
git init
git add -A # Add all files and commit them
  git commit -m "New, Before any changes"

