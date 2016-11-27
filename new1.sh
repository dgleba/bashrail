#!/usr/bin/env bash



# new rails app  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
pwd

ruby -v ; rails -v


if [  -d "$appn" ]; then
  # Control will enter here if DIRECTORY  exists.
  set +vx 
  echo 'Error 8!  - app name folder already exists.'
  #seco=110 ; read -t $seco -p "Hit ENTER or wait $seco seconds"
  exit 8
fi


rails _4.2.7.1_ new $appn --skip-bundle


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
git add -A # Add all files and commit them
  git commit -m "New, Before any changes"

