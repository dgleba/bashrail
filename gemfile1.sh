#!/usr/bin/env bash

 
  
### gemfile.. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
pwd


echo "gem 'faker'" >> Gemfile
echo "gem 'populator'" >> Gemfile


echo "# " >> Gemfile

bundle

sleep 1
git add -A # Add all files and commit them
git commit -m "gemfile"


