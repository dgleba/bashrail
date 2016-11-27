#!/usr/bin/env bash

# set -e will exit on first error. so set -vxe..
# http://stackoverflow.com/questions/2870992/automatic-exit-from-bash-shell-script-on-error

function abort()
{
    echo >&2 '
***************
*** ABORTED ***
***************
'
    echo "An error occurred. Exiting..." >&2
    exit 1
}

trap 'abort' 0

set -e

# Add your script below.... If an error occurs, the abort() function will be called.
#----------------------------------------------------------
# ===> Your script goes here

### setup.... ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

date ; set +vx  ; set -vx ; # echo off, then echo on


# this
#    bootstrap simple_form select2 rails_admin devise -  testing platform
#


# usage:  see readme.md..       bashrail/1mk.sh


# or if need be..  rm -rf c308rail ;  bashrail/1mk.sh


### settings .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
# name for the new application..

export appn='c308rail'

# Location of creator files beside the parent folder of the application..

export sfil='bashrail'

# Location modified for use after cd into the new app folder..

export sfil2='../'$sfil

 
 
# See error listed in gemfile1.sh 
# gem uninstall thor -v 0.19.2
gem install thor -v 0.19.1 
  

### start.... ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

pwd
  source $sfil/new1.sh
 
  source $sfil2/gemfile1.sh
 
  source $sfil2/home1.sh  # 
 
  source $sfil2/bootstrap1.sh 
 
  source $sfil2/applayout1.sh  # requires home1
 
  source $sfil2/paginate1.sh  # optional

  source $sfil2/devise1.sh  # optional
 
  # source $sfil2/admin1.sh  # optional, but home1 refers to this.

  

### scaffold... ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


rails g scaffold Product name  pdate:datetime active_status:integer sort:integer -f 


rails g scaffold Pfeature name fdate:datetime active_status:integer sort:integer -f 

rails g scaffold ProductFeature name  product:references pfeature:references active_status:integer sort:integer -f 


sleep 1
git add -A # Add all files and commit them
git commit -m "scaffold"  


### select2 for product pfeature.... ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# source $sfil2/select2.sh  # optional
 


### db seed .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# if you want to seed specific pre-planned data...

# echo 'Product.create({name: "furniture"}) '>> db/seeds.rb

#rake db:reset
rake db:drop
rake db:migrate
rake db:seed


sleep 1
git add -A # Add all files and commit them
  git commit -m "seed"


### populate .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


cat << HEREDOC > lib/tasks/populate.rake
namespace :db do
  desc "fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    Product.populate 11 do |a12|
      a12.name     = Faker::Commerce.product_name
    end
    Pfeature.populate 9 do |a12|
      a12.name     = Faker::Commerce.color
    end
  end
end
HEREDOC

rake db:populate

sleep 1
git add -A # Add all files and commit them
  git commit -m "populate"


 

### finish up.. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


set +vx
pwd
echo  '----------------------------------------> !!! Reached end of file !!!'
echo  run rails s
echo  then visit localhost:3000/
echo  then visit localhost:3000/products
set +vx 
date
#

# Done!
trap : 0

echo >&2 '
************
*** DONE *** 
************
'
