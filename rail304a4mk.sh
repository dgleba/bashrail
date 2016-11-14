#!/usr/bin/env bash
#cd ;
 # set -e will exit on first error. so set -vxe..
date ; set +vx  ; set -vx ; # echo off, then echo on

# this
#   rails_admin bootstrap simple_form tests
#

# usage:
# if appn = rail281j then..
# copy ..../rail281file/* var/share203/rail281file
# input files will be in var/share203/rail281file folder.
# cd /home/albe/share203
#       rail281file/rail281j-mk.sh
# The output will be that it creates  var/share203/rail281j/*
#
#   rail281file/rail281b2-mk.sh


appn='b-rail308ra4'

sfil='../rail308file'



# new rails app  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
  git commit -m "Before any changes"

  
  
  
  
### gemfile.. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

#echo "gem 'administrate'" >> Gemfile
#echo "gem 'bourbon'" >> Gemfile

echo "# " >> Gemfile

bundle

sleep 2
git add -A # Add all files and commit them
git commit -m "gemfile"




### setup bootstrap assets .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#  css

#\\10.4.1.227\rt\srv\share\test\rail304x2\app\assets\stylesheets\application.css
mkdir -p backup
file1='application.css'
cp -a app/assets/stylesheets/$file1  backup/$file1$(date +"__%Y.%m.%d_%H.%M.%S").bak.txt
mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss
file1='application.scss'
cp -a app/assets/stylesheets/$file1  backup/$file1$(date +"__%Y.%m.%d_%H.%M.%S").bak.txt

echo  '@import "bootstrap-sprockets";'>> app/assets/stylesheets/application.scss
echo  '@import "bootstrap";'>> app/assets/stylesheets/application.scss

# js

# already there.. '//= require jquery'
# \\10.4.1.227\rt\srv\share\test\rail304x2\app\assets\javascripts\application.js 
echo '//= require bootstrap-sprockets' >> app/assets/javascripts/application.js 




### install 1 .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

rails generate simple_form:install --bootstrap

sleep 2
git add -A # Add all files and commit them
git commit -m "install 1"





### modify scaffold templates... ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Change index to boostrap styling..

# http://stackoverflow.com/questions/32384713/override-rails-scaffold-generator
# http://daniel.fone.net.nz/blog/2014/02/01/customising-scaffold-views-in-ruby-on-rails/

railt1="$(bundle show railties)"
echo "${railt1}"
path1='lib/rails/generators/erb/scaffold/templates'
echo "${railt1}/${path1}"
ls -la "${railt1}/${path1}"

mkdir -p lib/templates/erb/scaffold/
rsync -auv "${railt1}/${path1}/" lib/templates/erb/scaffold/

# edit template index...
#
file1='index.html.erb'
path1='lib/templates/erb/scaffold/'
cp -a $path1$file1  $path1$file1$(date +"__%Y.%m.%d_%H.%M.%S").bak.txt
#
#replace foo with bar once per line... #sed -i -e 's/foo/bar/' filename
pattern1='<table>'
pattern2='<table class="table table-striped">'
sed -i -e "s/$pattern1/$pattern2/" $path1$file1



  

### scaffold... ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


rails g scaffold Product name  pdate:datetime active_status:integer sort:integer -f \

rails g scaffold Pfeature name fdate:datetime active_status:integer sort:integer -f \

rails g scaffold ProductFeature name  product:references pfeature:references active_status:integer sort:integer -f \


sleep 2
git add -A # Add all files and commit them
git commit -m "scaffold"






### db .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# echo 'Type.create({name: "Three Cities"}) '>> db/seeds.rb
# echo 'Type.create({name: "Carob Charob"}) '>> db/seeds.rb

#rake db:reset
rake db:drop
rake db:migrate
#rake db:seed





### populate .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


cat << HEREDOC > lib/tasks/populate.rake
namespace :db do
  desc "fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    Product.populate 3 do |a12|
      a12.name     = Faker::Commerce.product_name
    end
    Pfeature.populate 9 do |a12|
      a12.name     = Faker::Commerce.color
    end
  end
end
HEREDOC

rake db:populate

sleep 2
git add -A # Add all files and commit them
  git commit -m "populate"


  
  

### app...js .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#eg:  sed -i '/CLIENTSCRIPT/i \ \ CLIENTSCRIPT2' file  # add line before pattern - include leading spaces like so - escape them.. '\ '
# sed -i '/require_tree/i  \ //= require jquery-ui/autocomplete \n //= require autocomplete-rails'  app/assets/javascripts/application.js

###

# git add -A # Add all files and commit them
  # git commit -m "four"


  


### controller.. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



# add this lines after match in controller....
  # class ProductsController < Admin::BaseController
    # ..this line..  autocomplete :type, :name
  # end
#
  #eg:  sed -i '/CLIENTSCRIPT/i \ \ CLIENTSCRIPT2' file  # add line before pattern - include leading spaces like so - escape them.. '\ '

# line1='  autocomplete :type, :name, :full => true'
# sed -i "/before_action/a  \  #\n$line1\n"  app/controllers/products_controller.rb



### routes.. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



  # resources :products do
    # get :autocomplete_type_name, :on => :collection
  # end

# pattern1='resources :products'
# line1='  resources :products do'
# line2='    get :autocomplete_type_name, :on => :collection'
# line3='  end'
# line4='  root "products#index"'
# x x sed -i "/resources :products/a  \  #\n$line1\n$line2\n$line3\n"  config/routes.rb
# sed '0,/pattern/s/pattern/replacement/' filename  ##  stackoverflow.com/questions/148451/how-to-use-sed-to-replace-only-the-first-occurrence-in-a-file
# replace the entire line matching pattern1...
# sed  -i "0,/$pattern1/s/.*$pattern1.*/#\n$line1\n$line2\n$line3\n$line4\n/" config/routes.rb


### view.. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



  # f.autocomplete_field :type_name, autocomplete_type_name_products_path
    # was.. <%= f.text_field :type1 %>
#
# multiple autocomplete... use this option... 'data-delimiter' => ','
#
# pattern1='f.text_field :type_name'
# # for multiple autocomplete..
# # line1='   <%= f.autocomplete_field :type_name, autocomplete_type_name_products_path, \"data-delimiter\" => \", \" %>'
# #
# line1="   <%= f.autocomplete_field :type_name, autocomplete_type_name_products_path , \'min-length\' => 1 , \'data-auto-focus\' => true %>"
  # sed  -i "0,/$pattern1/s/.*$pattern1.*/$line1\n/" app/views/products/_form.html.erb



  
  
### application.html.erb .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#    just before /head. ...
#    add...  <%= javascript_include_tag "autocomplete-rails.js" %>'
# pattern1='/head>'
# # some characters are escaped below... \<  \" \>
# line1='  \<%= javascript_include_tag \"autocomplete-rails.js\" %\>'
# sed  -i "/$pattern1/i \ \  $line1\n"  app/views/layouts/application.html.erb


# # Asset was not declared to be precompiled in production.
# # Add `Rails.application.config.assets.precompile += %w( autocomplete-rails.js )` to `config/initializers/assets.rb` and restart your server
# echo 'Rails.application.config.assets.precompile += %w( autocomplete-rails.js )'>> config/initializers/assets.rb


# git add -A # Add all files and commit them
  # git commit -m "five"



  
  
### style the autocomplete.. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# cp $sfil/dgautocomplete.scss app/assets/stylesheets
# cp $sfil/product1.js app/assets/javascripts

# git add -A # Add all files and commit them
  # git commit -m "six"


  
  
  
### admin1 .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# active admin..

# rails g active_admin:install --skip-users
# rake db:migrate
# rake db:seed
# rails generate active_admin:resource Product
#rails destroy active_admin:resource Products

# administrate by thoughtbot

#rails generate administrate:install


# error..
# /Users/dg/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/railties-4.2.7.1/lib/rails/generators/named_base.rb:102:in
#  `block in class_name': undefined method `camelize' for nil:NilClass (NoMethodError)
#
# named_base.rb`block in class_name': undefined method `camelize' for nil:NilClass (NoMethodError)
#
#  ans..  must add administrate after data is added.
  
git add -A # Add all files and commit them
git commit -m "install  admin1"
  
  
  
  
 
### home page .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  

rails g controller Home index about 
 
#
# add line after match...  sed -i '/CLIENTSCRIPT="foo"/a CLIENTSCRIPT2="hello"' file
# i think 0, means only do it for the first match..
#
pattern1='application.routes'
line1='  root "home#index"'
#line2='  about "home#about"'
replace the entire line matching pattern1...
#sed  -i "0,/$pattern1/a \ \n$line1\n$line2\n\n" config/routes.rb
sed  -i "0,/$pattern1/a \ \n$line1\n\n" config/routes.rb

 
cat << 'HEREDOC' >> app/views/home/index.html.erb

<h3> 1.   </h3>
<%= link_to 'Products', products_path %>
<h3> 2.   </h3>
<%= link_to 'Rails admin', rails_admin.index_path('') %>
<br><br><br>
<hr>
<%= Rails.env %> 

HEREDOC


git add -A # Add all files and commit them
git commit -m "add home page"
  
   
   
   
   
### admin2 .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
# rails_admin..


# + expect
# spawn rails g rails_admin:install
# couldn't execute "rails g rails_admin:install": no such file or directory
    # while executing
# "spawn "rails g rails_admin:install""
# ---
# question for ..   rails g rails_admin:install
#   ?  Where do you want to mount rails_admin? Press <enter> for [admin] > 
#
# prog='rails g rails_admin:install'
# expect <<EOF
# spawn "$prog"
# expect "[admin] >"
# send "radmin\n"
# expect eof
# exit
# EOF


# works..
 printf 'radmin\n' | rails g rails_admin:install



sleep 1
git add -A # Add all files and commit them
git commit -m "install  admin"
  
 
# _____________  custom layout for rails_admin list

mkdir -p app/assets/javascripts/rails_admin/custom

# $ not working...  single quote the heredoc label to prevent and expansion...

cat << 'HEREDOC' > app/assets/javascripts/rails_admin/custom/ui.js
$(document).on('rails_admin.dom_ready', function(){
  var $table = $('#bulk_form').find('table');
  var table = $table[0];

  // Abort if there's nothing to do. Don't repeat ourselves, either.
  if (!table || $table.hasClass('js-horiz-scroll')) { return; }

  // Add our indicator class. Also some enhancements.
  $table.addClass('js-horiz-scroll table-hover');

  ////
  // Make the table horizontally scrollable.
  // Inspiration from bootstrap's table-responsive.
  ////
  var tableWrapper = document.createElement('DIV');
  //tableWrapper.className = 'table-responsive';
  //tableWrapper.style.width = '100%';
  tableWrapper.style.overflowX = 'auto';
  tableWrapper.style.marginBottom = table.style.marginBottom;
  table.style.marginBottom = '0';
  //tableWrapper.style.overflowY = 'hidden';
  table.parentElement.insertBefore(tableWrapper, table);
  tableWrapper.appendChild(table);
  $table.find('th.last,td.last').each(function(index, td){
    var tr = td.parentElement;
    tr.insertBefore(td, tr.children[1]);
  });

  ////
  // Freeze the left columns.
  // Inspiration from http://stackoverflow.com/questions/1312236/how-do-i-create-an-html-table-with-fixed-frozen-left-column-and-scrollable-body
  ////
  var $trs = $table.find('tr');
  var $headerTr = $trs.first();
  var $headerTds = $headerTr.children('th,td');
  var i, $td, pos;
  var offsets = [];
  var widths = [];
  for (i = 0; i < 3; i++) {
    $td = $($headerTds[i]);
    pos = $td.position();
    offsets.push(pos.left);
    widths.push($td.outerWidth());
  }
  $trs.each(function(index, tr){
    for (i = 0; i < 3; i++) {
      tr.children[i].style.position = 'absolute';
      tr.children[i].style.left = offsets[i]+'px';
      tr.children[i].style.width = widths[i]+'px';
    }
  });
  $td = $($headerTds[2]);
  var margin = $td.position().left + $td.outerWidth() - $(tableWrapper).position().left;
  tableWrapper.style.marginLeft = margin+'px';
  tableWrapper.style.borderLeft = '1px solid black';

  // Bottom-align the headers.
  var trHeight = $headerTr.height();
  for (i = 0; i < 3; i++) {
    $td = $($headerTr[0].children[i]);
    $td.css('padding-top', (trHeight - $td.height() - 4)+'px');
  }

  // Remove main browser window's horizontal scrollbar.
  $('body').css('overflow-x', 'hidden');
});
HEREDOC


  
# remove line containing  '[global]'  and replace the line completely with the new text...
#      sed -i 's/.*global].*/[global]\n\nunix extensions = no/g' /etc/samba/smb.conf 
patrn1='Rails.application.config.assets.version'
# patrn1='version'
patrn2='Rails.application.config.assets.version = \"1.1\"'
# patrn2='Railsxxxxx'
sed -i -e "s/.*$patrn1.*/$patrn2/" config/initializers/assets.rb

# add configs... 
#   sed -i '/CLIENTSCRIPT/a \ \ CLIENTSCRIPT2' file  # add line after pattern - include leading spaces like so - escape them.. '\ '  
patrn='RailsAdmin.config'
addln='\ \ config.total_columns_width = 9999999'
sed -i "/$patrn/a$addln" config/initializers/rails_admin.rb


sleep 1
git add -A # Add all files and commit them
git commit -m "configure customized  admin"
  
  
  
  
  
 
### disable turbolinks .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# comment out line with BBB ..  sed -i '/![^#]/ s/\(^.*BBB.*$\)/#\ \1/' file
sed -i '/![^#]/ s/\(^.*turbolinks.*$\)/#\ \1/' Gemfile

file1='application.js'
cp -a app/assets/javascripts/$file1  backup/$file1$(date +"__%Y.%m.%d_%H.%M.%S").bak.txt
#
# delete line containing..
# no,  sed -i '/turbolinks/d' app/assets/javascripts/$file1
 
 
# originally... 
  # <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>
  # <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
 
# now using the heredoc below this...
file2='application.html.erb'
cp -a app/views/layouts/$file2  backup/$file2$(date +"__%Y.%m.%d_%H.%M.%S").bak.txt
#remove turbolinks reference from $file2
patrn=", 'data-turbolinks-track' => true"
sed -i "s/$patrn/ /" app/views/layouts/$file2
 
 
 
file2='application.html.erb'
cat << 'HEREDOC' > app/views/layouts/$file2
<!DOCTYPE html >
<html>
  <head>
    <meta charset="utf-8">
      <meta content="IE=edge" http-equiv="X-UA-Compatible">
        <meta content="width=device-width, initial-scale=1" name="viewport">
          <title>rail263</title>
          <%= stylesheet_link_tag    'application', media: 'all' %>
          <%= javascript_include_tag 'application' %>
          <%= csrf_meta_tags %>
        </meta>
      </meta>
    </meta>
  </head>
  <body class="<%= controller.controller_name %>">
    <nav class="navbar navbar-inverse navbar-static-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <button aria-controls="navbar" aria-expanded="false" class="navbar-toggle collapsed" data-target="#navbar" data-toggle="collapse" type="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <%= link_to 'Home', root_path, class: 'navbar-brand' %>
        </div>

        <div class="collapse navbar-collapse" id="navbar">
          <ul class="nav navbar-nav">
            <li>
              <!-- <%= link_to 'Products', products_path %> -->
            </li>
          </ul>
        </div>

      </div>
    </nav>
    
    <div class="container-fluid">
      <%= yield %>
    </div>
  </body>
</html>
HEREDOC
  
  
sleep 1
git add -A # Add all files and commit them
git commit -m "disable turbolinks"



 
 
### enable select2 .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#
# add line after match...  sed -i '/CLIENTSCRIPT="foo"/a CLIENTSCRIPT2="hello"' file
# i think 0, means only do it for the first match..
#
pattern1='ActiveRecord::Base'
line1='  has_many :product_feature\n  has_many :pfeature, through: :product_feature\n'
file1='app/models/product.rb'
sed  -i "0,/$pattern1/a $line1" $file1
#
sleep 1

#
pattern1='ActiveRecord::Base'
line1='   has_many :product_feature\n   has_many :product, through: :product_feature\n'
file1='app/models/pfeature.rb'
sed  -i "0,/$pattern1/a $line1" $file1



line1='<%= f.association :pfeature %>'
patrn='f.input :name'
sed -i "/.*$patrn.*/a $line1" app/views/products/_form.html.erb

      
sleep 1
      
# add this.. :ptype_ids => [] ... Edit line to look like this..  params.require(:product).permit(:name, :ptype_ids => [])
# http://unix.stackexchange.com/questions/155331/sed-replace-a-character-in-a-matched-line-in-place  /ipsum/{s/#//g;s/@/-at-/g;}
# add a space before the last character in the line...   sed 's/.$/ &/' file
#
# find lines with $patrn and replace last characater with $str1)
patrn='params.require'
patrn='require'
str1=', :pfeature_ids=> []'
file1='app/controllers/products_controller.rb'
echo $patrn,  $str1,  $file1
sed -i  "/$patrn/{s/.$/$str1\)/}" $file1 

# rev $file1 | sed "s/)/ZaZ@Z/" | rev


sleep 1

# insert lines before line matching patrn...
ln1='<p>'
ln2='<% @product.pfeature.each do |v1| %>'
ln3='    <%= link_to v1.name, v1 %>'
ln4='<% end %>'
ln5='</p>'
patrn='edit_product_path'
sed -i "/.*$patrn.*/i $ln1\n$ln2\n$ln3\n$ln4\n$ln5\n" app/views/products/show.html.erb

sleep 1

mkdir -p app/inputs
cat << 'HEREDOC' > app/inputs/collection_select_input.rb
# app/inputs/collection_select_input.rb
class CollectionSelectInput < SimpleForm::Inputs::CollectionSelectInput
  def input_html_classes
    super.push('dgselect2')
  end
end
HEREDOC


cat << 'HEREDOC' > app/assets/javascripts/dgselect2.js
#app/assets/javascripts/dgselect2.js
$(function() {
  $(".dgselect2").select2({
   });	
});
HEREDOC

echo '//= require select2' >> app/assets/javascripts/application.js
 
# this gave error.. echo  '*= require select2'>> app/assets/stylesheets/application.scss
# echo  '*= require select2-bootstrap'>> app/assets/stylesheets/application.scss
#
# insert lines after line matching patrn...
ln1='\ \ \*= require select2'
ln2='  \*= require select2-bootstrap'
# got error.. patrn='self'
# sed -i "/self/a "$ln1"\n"$ln2"\n" app/assets/stylesheets/application.scss
  sed -i "/require_self/a $ln1\n$ln2" app/assets/stylesheets/application.scss


sleep 1
git add -A # Add all files and commit them
git commit -m "enable select2"
 
 
function notusedcomments() {
# begin block comment =============================
: <<'END'

Models product pfeature:

# app/model/product.rb
class Product < ActiveRecord::Base
  has_many :product_feature
  has_many :pfeature, through: :product_feature
end

# app/model/pfeature.rb
class Pfeature < ActiveRecord::Base
  has_many :product_feature
  has_many :product, through: :product_feature
end
_____________ 

      params.require(:product).permit(:name, :ptype_ids => [])
 _____________ 

     <%= f.input :name %>
+    <%= f.association :ptype %>

    <%= f.association :ptype %>
_____________ 

showpf=$(cat <<'HEREDOC'
\<p\>
\<\% \@product.pfeature.each do |v1| \%\>
    \<\%= link_to v1.name, v1 \%\>
\<\% end \%\>
\</p\>
HEREDOC
)

+<p>
+<% @product.ptype.each do |tag| %>
+    <%= link_to tag.name, tag %>
+<% end %>
+</p>
+
 <%= link_to 'Edit', edit_product_path(@product) %> |
 
 # sed -i '/$patrn/{/\(.*\)\)/$str1\) /}' $file1
# sed  '/.*$patrn.*/{s/\(.*\)e/$str1\)/}' $file1 |grep zxz
# sed  "/.*$patrn.*/{i/.$/$str1/}" $file1 |grep zxz
# sed  '/require/s/.$/$str1/' $file1
 
END


# end block comment ===============================
} 





 

### finish up.. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sleep 1
git add -A # Add all files and commit them
git commit -m "reached end of script"

set +vx
pwd
echo  '----------------------------------------> Successfully Reached end of file!!!'
echo  run rails s
echo  then visit localhost:3000/
echo  then visit localhost:3000/products
date
#

