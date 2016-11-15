#!/usr/bin/env bash





### setup bootstrap assets .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
pwd

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

sleep 1
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


sleep 
git add -A # Add all files and commit them
git commit -m "copy and modify scaffold templates"

