#!/usr/bin/env bash
echo ~----------~----------Startingd $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")



### home page .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

rails g controller Home index about

#
# add line after match...  sed -i  '/CLIENTSCRIPT="foo"/a CLIENTSCRIPT2="hello"' file
# i think 0, means only do it for the first match..
#
pattern1='application.routes'
line1='  root "home#index"'
#line2='  about "home#about"'
sed -i "0,/$pattern1/a \ \n$line1\n\n" config/routes.rb



cat << 'HEREDOC' >> app/views/home/index.html.erb

<h3> 1.   </h3>
<%= link_to 'Products', products_path, class: "btn btn-primary", :style=>'color:#FFFFFF;' %>
<h3> 2.   </h3>

<%# This is a comment! %>
<%#  <%= link_to 'Rails admin', rails_admin.index_path('') %>

Use /radmin to access the rails admin tool if it is setup.

<h3> 3.   </h3>

<%# this not working.. = link_to(:url =>"http://#{request.host}/pfeatures", :text => 'Pfeatures list') %>
<%# = link_to(:url =>"http://localhost:3001/pfeatures", :text => "pfeatures list") %>

<%= link_to 'Pfeatures', pfeatures_path, class: "btn btn-primary", :style=>'color:#FFFFFF;' %>
<br>
<br>
<%= link_to 'Country of Origin list', country_of_origins_path, class: "btn btn-primary", :style=>'color:#FFFFFF;' %>
<p>This has attachments</p>
<br>
<br>
<%= link_to 'Product_features join table', product_features_path, class: "btn btn-primary", :style=>'color:#FFFFFF;' %>
<br>
<br>

<hr>
<%= Rails.env %>

HEREDOC


git add -A # Add all files and commit them
git commit -m "add home page"



