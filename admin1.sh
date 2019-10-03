#!/usr/bin/env bash
echo ~----------~----------Startingd $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")

    
### admin1 .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#echo "gem 'rails_admin', :git =>  'https://github.com/dgleba/rails_admin.git'" >> Gemfile
# 2017-05-21 got error with git repo. Missing template rails_admin/main/dashboard, rails_admin/application/dashboard with...
#   changed to v 1.1.1...
echo "gem 'rails_admin'" >> Gemfile

# 
bundle update

# gem1="gem 'activeadmin', github: 'activeadmin'"
# echo "$gem1" >> Gemfile

#echo "gem 'administrate'" >> Gemfile
#echo "gem 'bourbon'" >> Gemfile

bundle update

# active admin..

# rails g active_admin:install --skip-users
# rake db:migrate
# rake db:seed
# rails generate active_admin:resource Product
# rails destroy active_admin:resource Products



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


# https://github.com/sferik/rails_admin/wiki/Horizontally-scrolling-table-with-frozen-columns-in-list-view


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


  
# bump version to get custom layout to load...
#  
# remove line containing  '[global]'  and replace the line completely with the new text...
#      sed -i  's/.*global].*/[global]\n\nunix extensions = no/g' /etc/samba/smb.conf 
patrn1='Rails.application.config.assets.version'
# patrn1='version'
patrn2='Rails.application.config.assets.version = \"1.2\"'
# patrn2='Railsxxxxx'
sed -i  -e "s/.*$patrn1.*/$patrn2/" config/initializers/assets.rb

# add configs... 
#   sed -i  '/CLIENTSCRIPT/a \ \ CLIENTSCRIPT2' file  # add line after pattern - include leading spaces like so - escape them.. '\ '  
patrn='RailsAdmin.config'
addln='\ \ config.total_columns_width = 9999999'
sed -i  "/$patrn/a$addln" config/initializers/rails_admin.rb


sleep 1
git add -A # Add all files and commit them
git commit -m "configure customized  admin"
  
