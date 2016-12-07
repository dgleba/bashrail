#!/usr/bin/env bash


function abort()
{
    # set -e will exit on first error. so set -vxe..
    # http://stackoverflow.com/questions/2870992/automatic-exit-from-bash-shell-script-on-error
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
# ===> Your script goes here.........................



### settings .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
# http://how-to.wikia.com/wiki/How_to_read_command_line_arguments_in_a_bash_script
# $0 is scripts name.
# http://stackoverflow.com/questions/6121091/get-file-directory-path-from-filepath
# http://stackoverflow.com/questions/1464253/global-environment-variables-in-a-shell-script 
# http://stackoverflow.com/questions/29270289/bash-read-from-file-and-store-to-variables

 
if [ -z "$1" ] ; then
set +vx
  echo ;
  echo 'Invalid parameters.'
  echo '  Usage: eg:  bashrail/1mk.sh project_name'
  echo '      bashrail contains the app creator scripts.'
  echo '      project_name is the name you want to give the generated rails app.'
  echo ;
  exit 7
else
  # set app name as first pramater on commandline
  export appn=$1
  #  get the command that invoked this..
  inscript=$0
  # extract the path from that command..
  bpath=$(dirname "${inscript}")
  # Location of creator files beside the new folder of the application..
  export sfil=$bpath  # ex: bashrail
  # Location modified for use after cd into the new app folder..
  export sfil2='../'$sfil  # ex: ../bashrail
fi 
export mpwd=$PWD


# Save commandline parameters so they can be used to run one subscript later.
mkdir -p /tmp
echo $appn $sfil $sfil2 $mpwd $0 > /tmp/brvar1202.txt


timeout1=5 ; read -t "${timeout1}" -p "Press ENTER or wait $timeout1 seconds..." || true ;  echo ;
  

### setup.... ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

date ; set +vx  ; set -vx ; # echo off, then echo on



### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# thor error in version 0.19.2
 
# See error listed in gemfile1.sh 
# gem uninstall thor -v 0.19.2
# gem install thor -v 0.19.1 
  

  
### start.... ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

pwd
  source $sfil/new1.sh

  # everything after this is done from within the project folder $appn
 
  source $sfil2/gemfile1.sh
 
  source $sfil2/tableprefix1.sh  # optional
  
  source $sfil2/home1.sh  # 
 
  source $sfil2/bootstrap1.sh 
 
  source $sfil2/applayout1.sh  # requires home1
 
  source $sfil2/paginate1.sh  # optional, but you may need to edit to overcome some errors since it may included some code that depends on other features.

  source $sfil2/devise1.sh   # optional, but will modify home page, so  
# or
  # source $sfil2/devisetokenauth1.sh   # optional,  
   
  source $sfil2/cancan1.sh   # optional, but ..  optional may require some further edits.
  

  source $sfil2/admin1.sh  # optional

  

### scaffold... ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


rails g scaffold Product name  pdate:datetime active_status:integer sort:integer -f 

rails g scaffold Pfeature name fdate:datetime active_status:integer sort:integer -f 

rails g scaffold ProductFeature name  product:references pfeature:references active_status:integer sort:integer -f 


sleep 1
git add -A # Add all files and commit them
git commit -m "scaffold"  


### select2 for product pfeature.... ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


  source $sfil2/select2.sh  # optional
 


### db seed .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# if you want to seed specific pre-planned data...

# echo 'Product.create({name: "furniture"}) '>> db/seeds.rb

# rake db:reset
# rake db:drop
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
# echo  '----------------------------------------> !!! Reached end of file !!!'
echo  run rails s
echo  then visit localhost:3000/
echo  then visit localhost:3000/products
set +vx 
date
#


# Done!....................
trap : 0
echo >&2 '
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!   DONE    !!!**
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
'
