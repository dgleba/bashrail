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



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




#              this depends on the first jqueryautocomplete.sh




# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





  
  
#app specific .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#app specific .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#app specific .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




r1="app/assets/javascripts/products_ac.js"
cat << 'HEREDOC' > $r1
$(function() {
  
  // run when eventlistener is triggered
  // http://stackoverflow.com/questions/6431459/jquery-autocomplete-trigger-change-event
  //
  $("#product_pcolor").on( "autocompletechange", function(event,data) {
     // post value to console for validation
     console.log("Item is: ", $(this).val());

    // if item user typed in the input box is not in the list of suggestions, it will be cleared out. The user must select an item.
    if (!data.item) {
        this.value = '';
        console.log('> Item selected is:', data.item);
        }
        
    });   
    console.log ("msg.. 1012")  
});
HEREDOC


  
  
  
#controller.. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



# add this lines after match in controller....
  # class ProductsController < Admin::BaseController
    # ..this line..  autocomplete :type, :name
  # end  
  #eg:  sed -i '/CLIENTSCRIPT/i \ \ CLIENTSCRIPT2' file  # add line before pattern - include leading spaces like so - escape them.. '\ '  
  

line1='  autocomplete :pfeature, :name, :full => true'
sed -i "/before_action/a  \  #\n$line1\n"  app/controllers/products_controller.rb 
  


  
#routes.. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

  # resources :products do
    # get :autocomplete_type_name, :on => :collection
  # end  
pattern1='resources :products'
line1='  resources :products do'
line2='    get :autocomplete_pfeature_name, :on => :collection'
line3='  end'
line4='  root "products#index"'
# x x sed -i "/resources :products/a  \  #\n$line1\n$line2\n$line3\n"  config/routes.rb
# sed '0,/pattern/s/pattern/replacement/' filename  ##  stackoverflow.com/questions/148451/how-to-use-sed-to-replace-only-the-first-occurrence-in-a-file
# replace the entire line matching pattern1...
# sed  -i "0,/$pattern1/s/.*$pattern1.*/#\n$line1\n$line2\n$line3\n$line4\n/" config/routes.rb 
  sed  -i "0,/$pattern1/s/.*$pattern1.*/#\n$line1\n$line2\n$line3\n/" config/routes.rb 
 



# view.. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



  # f.autocomplete_field :type_name, autocomplete_type_name_products_path 
    # was.. <%= f.text_field :type1 %>
#
# multiple autocomplete... use this option... 'data-delimiter' => ','
#
pattern1='f.text_field :pcolor'
file21=app/views/products/_form.html.erb
if ! grep -q "${pattern1}" $file21 ; then 
  echo nogrep ~164 ; sleep 9 ; exit 9 ; 
fi
#line1='   <%= form.autocomplete_field :type_name, autocomplete_type_name_products_path , \'min-length\' => 1 , \'data-auto-focus\' => true %>'  
line1="   <%= f.autocomplete_field :pcolor, autocomplete_pfeature_name_products_path , \'min-length\' => 1 , \'data-auto-focus\' => true %>"
  sed  -i "0,/$pattern1/s/.*$pattern1.*/$line1\n/" $file21








# finish up.. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
pwd   
echo  '----------------------------------------> Successfully Reached end of file!!!'
echo  run rails s
echo  then visit localhost:3000/products
date
#

