#!/usr/bin/env bash


### home page .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

rails g controller Home index about

#
# add line after match...  sed -i '.bakup' '/CLIENTSCRIPT="foo"/a CLIENTSCRIPT2="hello"' file
# i think 0, means only do it for the first match..
#
pattern1='application.routes'
line1=' root "home#index"'
#line2='  about "home#about"'
sed -i '.bakup' "0,/$pattern1/a \ \n$line1\n\n" config/routes.rb


cat << 'HEREDOC' >> app/views/home/index.html.erb

<h3> 1.   </h3>
<%= link_to 'Products', products_path %>
<h3> 2.   </h3>

<%# This is a comment! %>
<%#  <%= link_to 'Rails admin', rails_admin.index_path('') %>

Use /radmin to access the rails admin tool if it is setup.

<br><br><br>
<hr>
<%= Rails.env %>

HEREDOC


git add -A # Add all files and commit them
git commit -m "add home page"



