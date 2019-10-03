#!/usr/bin/env bash
echo ~----------~----------Startingd $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")

 
 
# purpose.. 
# autocomplete  countryoforigin - name with pfeature name...
 
# copied from..  C:\n\Dropbox\csd\dg2\knowledge-csd-dg\computer\rails-know\_rails-numbered-files,like-kdgrail274\rail281-yuiautocomplete\rail281j\rail281j-mk.sh 

# rails jquery autocomplete bigtunacan
 
 ###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# read settings..

read  appn  sfil  sfil2  mpwd  parm0</tmp/"_brvar1202_${USER}".txt
echo settings..
echo $appn $sfil $sfil2 $mpwd $parm0

# timeout1=5 ; read -t "${timeout1}" -p "Press ENTER or wait $timeout1 seconds..." || true ;  echo ;


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# set -e will exit on first error. so set -vxe..
date ; set +vx  ; set -vx ; # echo off, then echo on

# this works.
# 
# jquery-autocomplete  autocomplete for rails 4

# usage: 
# copy ..../rail281file/* var/share203/rail281file
# input files will be in var/share203/rail281file folder.
# cd /home/albe/share203
#       rail281file/rail281j-mk.sh
# The output will be that it creates  var/share203/rail281e/*
#
#   rail281file/rail281b2-mk.sh



# gemfile.. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


  
echo "# https://github.com/bigtunacan/rails-jquery-autocomplete" >> Gemfile
echo "# https://github.com/yifeiwu/rails4-autocomplete-demo" >> Gemfile
echo "gem 'rails-jquery-autocomplete'" >> Gemfile
echo "gem 'jquery-ui-rails'" >> Gemfile

bundle


pwd

### install .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

rails generate autocomplete:install

 
# git add -A # Add all files and commit them
# git commit -m "three"
 
# scaffold... ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 
 
# git add -A # Add all files and commit them
# git commit -m "scaffold"



# db ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



rake db:migrate  

# cp $sfil/populate.rake lib/tasks
# rake db:populate

###

# app...js  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#eg:  sed -i '/CLIENTSCRIPT/i \ \ CLIENTSCRIPT2' file  # add line before pattern - include leading spaces like so - escape them.. '\ '  
sed -i '/require_tree/i  \ //= require jquery-ui/autocomplete \n //= require autocomplete-rails'  app/assets/javascripts/application.js

# todo
# 2019-10-02 changes.
# //= require jquery
# //= require jquery_ujs
# //= require jquery-ui/widgets/autocomplete
# //= require autocomplete-rails



# git add -A # Add all files and commit them
  # git commit -m "four"

###
  


# Asset was not declared to be precompiled in production.
# Add `Rails.application.config.assets.precompile += %w( autocomplete-rails.js )` to `config/initializers/assets.rb` and restart your server
echo 'Rails.application.config.assets.precompile += %w( autocomplete-rails.js )'>> config/initializers/assets.rb
  

# git add -A # Add all files and commit them
  # git commit -m "five"


###
# style the autocomplete.. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  

cat $sfil2/rails-jquery-autocomplete/dgautocomplete.scss>>app/assets/stylesheets/application.scss

# git add -A # Add all files and commit them
  # git commit -m "six"
  

  

# application.html.erb  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#    just before /head. ...
#    add...  <%= javascript_include_tag "autocomplete-rails.js" %>



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# add new lines of text before patrn...
#

# cat 'app/views/pets/_form.html.erb'
# grep end 'app/views/pets/_form.html.erb'

filetarg='app/views/layouts/application.html.erb'
cat $filetarg
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
patrn='csrf_meta'
  repl2 = %Q{
          <%= javascript_include_tag "autocomplete-rails.js" %>
  }
  ARGF.each do |line|
    puts repl2 if line =~ /#{Regexp.escape(patrn)}/
    puts line
  end
HEREDOC
ruby $r1tmp $filetarg > $filetarg.tmp
cat $filetarg.tmp
cp $filetarg.tmp $filetarg; rm $filetarg.tmp


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# end  application.html.erb  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


  
  

  
  
  
#app specific .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#app specific .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#app specific .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



  
cp $sfil2/rails-jquery-autocomplete/countryoforigin_jq_ac.js app/assets/javascripts

 
  
  
  
#controller.. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



# add this lines after match in controller....
  # class ProductsController < Admin::BaseController
    # ..this line..  autocomplete :type, :name
  # end  
#
  #eg:  sed -i '/CLIENTSCRIPT/i \ \ CLIENTSCRIPT2' file  # add line before pattern - include leading spaces like so - escape them.. '\ '  
  
line1='  autocomplete :pfeature, :name, :full => true'
sed -i "/before_action/a  \  #\n$line1\n"  app/controllers/country_of_origins_controller.rb 
  

  
#routes.. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



  # resources :products do
    # get :autocomplete_type_name, :on => :collection
  # end  

  pattern1='resources :country_of_origins'
line1='  resources :country_of_origins do'
line2='    get :autocomplete_pfeature_name, :on => :collection'
line3='  end'
offline__line4='  root "country_of_origins#index"'
#  stackoverflow.com/questions/148451/how-to-use-sed-to-replace-only-the-first-occurrence-in-a-file
# replace the entire line matching pattern1...
  # sed  -i "0,/$pattern1/s/.*$pattern1.*/#\n$line1\n$line2\n$line3\n$line4\n/" config/routes.rb 
  sed  -i "0,/$pattern1/s/.*$pattern1.*/#\n$line1\n$line2\n$line3\n/" config/routes.rb 
 
 
# view.. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



  # f.autocomplete_field :type_name, autocomplete_type_name_products_path 
    # was.. <%= f.text_field :type1 %>
#
# multiple autocomplete... use this option... 'data-delimiter' => ','
#
pattern1='f.text_field :name'
# for multiple autocomplete..
# line1='   <%= f.autocomplete_field :name, autocomplete_country_of_origin_products_path, \"data-delimiter\" => \", \" %>'  
#
line1="   <%= f.autocomplete_field :name, autocomplete_pfeature_name_country_of_origins_path , \'min-length\' => 1 , \'data-auto-focus\' => true %>"
  sed  -i "0,/$pattern1/s/.*$pattern1.*/$line1\n/" app/views/country_of_origins/_form.html.erb




# finish up.. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
pwd   
echo  '----------------------------------------> Successfully Reached end of file!!!'
echo  run rails s
echo  then visit localhost:3000/products
date
#

