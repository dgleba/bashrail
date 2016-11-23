#!/usr/bin/env bash
 # set -e will exit on first error. so set -vxe..
date ; set +vx  ; set -vx ; # echo off, then echo on

# this
#    bootstrap simple_form select2 rails_admin testing platform
#

# usage:  see readme.md..       bashrail/rail308mk.sh


### settings .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
# name for the new application..

export appn='d308rail'

# Location of creator files beside the parent folder of the application..

export sfil='bashrail'

# Location modified for use after cd into the new app folder..

export sfil2='../'$sfil

  
  

### start.... ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


source $sfil/new1.sh
pwd
 source $sfil2/gemfile1.sh
pwd
 source $sfil2/home1.sh  # 
pwd
 source $sfil2/bootstrap1.sh 
pwd
 source $sfil2/applayout1.sh  # requires home1
pwd
# source $sfil2/paginate1.sh  # optional
pwd
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
pwd


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
echo  '----------------------------------------> Successfully Reached end of file!!!'
echo  run rails s
echo  then visit localhost:3000/
echo  then visit localhost:3000/products
set +vx 
date
#

