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
export mhome=$HOME


# Save commandline parameters so they can be used to run one subscript later.
mkdir -p /tmp
echo $appn $sfil $sfil2 $mpwd $0 $mhome>/tmp/"_brvar1202_${USER}".txt
chmod 777 /tmp/"_brvar1202_${USER}".txt

# create the tmp ruby runner file...
touch "/tmp/_temprubyrunner_${USER}.rb"
chmod 777 "/tmp/_temprubyrunner_${USER}.rb"

echo 
echo
echo Press ctrl-c now if you want to stop and edit settings in /tmp/_brvar1202_${USER}.txt
echo 

timeout1=20 ; read -t "${timeout1}" -p "Press ENTER or wait $timeout1 seconds..." || true ;  echo ;


### setup.... ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

date ; set +vx  ; set -vx ; # echo off, then echo on

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# for mac osx install gnu-sed,  brew install gnu-sed
# alias gsed to sed..
# http://apple.stackexchange.com/questions/236177/using-alias-in-bash-script-in-osx

# uncomment next lines for osx..

# alias sed=gsed
# shopt -s expand_aliases


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

  source $sfil2/applayout1.sh  # requires home1.sh

  source $sfil2/paginate1.sh  # optional, but you may need to edit to overcome some errors since it may include some code that depends on other features.

  
  
  # use only devisetokenauth1.sh  or devisejwt.sh   NOT both..

  source $sfil2/devise1.sh   # optional, but will modify home page, so.. some edits to overcome missing items may be necessary
  source $sfil2/devisejwt.sh   # optional. requires devise1.sh
# or
  # source $sfil2/devisetokenauth1.sh   # optional

  

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


 

###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# Copy migration files over..

path1='db/migrate'
mkdir -p $path1/
# rm -r $path1/
# rsync.. -a - rltpgoD  preserve almost all. -u update don't copy older source files.
rsync -av --ignore-times  $sfil2/$path1/ $path1/

  


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 

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


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# Copy files over..


path1='empty'
pathtmp='/tmp/bashrail'
rm -rf $pathtmp
mkdir -p $pathtmp/
pathtarget='docs/generatedby'
mkdir -p $pathtarget/
# rsync.. -a - rltpgoD  preserve almost all. -u update don't copy older source files.
rsync -av --ignore-times  $sfil2/ $pathtmp/
rm -rf $pathtmp/.git
zip -r  /tmp/bashrail_copy.zip $pathtmp/*
cp /tmp/bashrail_copy.zip $pathtarget
cp -av $sfil2/version* $pathtarget

cp -av $sfil2/root/.gitignore .

# cleanup
rm -rf $pathtmp
rm /tmp/bashrail_copy.zip


cat << HEREDOC > README.md

## $appn

This project was generated by bashrail. See the files in docs/generatedby for more info.

HEREDOC



sleep 1
git add -A # Add all files and commit them
  git commit -m "add sqlite db and docs"


  

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
