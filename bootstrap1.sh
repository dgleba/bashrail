#!/usr/bin/env bash
echo ~----------~----------Startingd $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")





### setup bootstrap assets .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
pwd

echo "# " >> Gemfile
note1='# https://github.com/twbs/bootstrap-sass'
echo "# $note1" >> Gemfile
echo "# " >> Gemfile

gem1="gem 'simple_form'"
echo "$gem1" >> Gemfile

bundle

# echo "gem 'bootstrap-sass', '~> 3.3.6'" >> Gemfile
 echo "gem 'bootstrap-sass'" >> Gemfile
# already there, no need to repeat.... echo "gem 'sass-rails'" >> Gemfile


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

bundle install

sleep 1
git add -A # Add all files and commit them
git commit -m "install 1 - bootstrap1.sh"





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
rsync -auv "${sfil2}/lib/templates/erb/scaffold/" lib/templates/erb/scaffold/
rsync -auv "${railt1}/${path1}/" lib/templates/erb/scaffold/

# edit template index...
#
file1='index.html.erb'
path1='lib/templates/erb/scaffold/'
cp -a $path1$file1  $path1$file1$(date +"__%Y.%m.%d_%H.%M.%S").bak.txt
#
#replace foo with bar once per line... #sed -i  -e 's/foo/bar/' filename
pattern1='<table>'
pattern2='<table class="table table-striped">'
sed -i  -e "s/$pattern1/$pattern2/" $path1$file1




#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# fix vertical-align on top row of index.  title, search, and pagination are not aligned vertically.

file1='dg_twitterbootstrap.scss'
cat << 'HEREDOC' > app/assets/stylesheets/$file1

//# app/assets/stylesheets/dg_twitterbootstrap.scss
//# eg: C:\var\share203\rail_jwtbr\app\assets\stylesheets\dg_twitterbootstrap.scss

// bootstrap components have different heights
// https://scotch.io/bar-talk/different-tricks-on-how-to-make-bootstrap-columns-all-the-same-height
//
// usage: on top row of index page for example.. <row class="row is-table-row" >
//
@media only screen and (min-width : 768px) {
  .is-table-row {
    display: table;
  }
  .is-table-row [class*="col-"] {
    float: none;
    display: table-cell;
    vertical-align: middle;
  }
}

.is-table-row .box {
  background: none;
  position: static;
}
.is-table-row [class*="col-"] {
  background: #fff;
}

HEREDOC



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function blockcomment211() {
: <<'BLOCKCOMMENT'



BLOCKCOMMENT
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



sleep 1
git add -A # Add all files and commit them
git commit -m "copy and modify scaffold templates - bootstrap1.sh"

