#!/usr/bin/env bash

 
  
### gemfile.. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
pwd

echo "# " >> Gemfile
note1='# https://github.com/twbs/bootstrap-sass'
echo "# $note1" >> Gemfile
echo "# " >> Gemfile

# echo "gem 'bootstrap-sass', '~> 3.3.6'" >> Gemfile
echo "gem 'bootstrap-sass'" >> Gemfile
# already there, no need to repeat.... echo "gem 'sass-rails'" >> Gemfile
echo "gem 'faker'" >> Gemfile
echo "gem 'populator'" >> Gemfile

gem1="gem 'simple_form'"
echo "$gem1" >> Gemfile

gem1="gem 'select2-rails'"
echo "$gem1" >> Gemfile

# gem1="gem 'activeadmin', github: 'activeadmin'"
# echo "$gem1" >> Gemfile

echo "gem 'rails_admin'" >> Gemfile

echo "gem 'kaminari'" >> Gemfile
echo "gem 'ransack'" >> Gemfile

#echo "gem 'administrate'" >> Gemfile
#echo "gem 'bourbon'" >> Gemfile

echo "# " >> Gemfile

bundle

sleep 1
git add -A # Add all files and commit them
git commit -m "gemfile"


