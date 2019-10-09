#!/usr/bin/env bash

echo ~----------~----------Startingd $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")
  
 
### create new application.html.erb layout with disabled turbolinks .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# comment out line with BBB ..  sed -i  '/![^#]/ s/\(^.*BBB.*$\)/#\ \1/' file
# noworky.. sed -i  '/![^#]/ s/\(^.*turbolinks.*$\)/#\ \1/' Gemfile
sed -i  -e '/turbolinks/ s/^#*/#/'  Gemfile


file1='application.js'
cp -a app/assets/javascripts/$file1  backup/$file1$(date +"__%Y.%m.%d_%H.%M.%S").bak.txt
# delete line containing..
sed -i  '/turbolinks/d' app/assets/javascripts/$file1
 
 
# originally... 
  # <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>
  # <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
 
# now using the heredoc below this stanza...
file2='application.html.erb'
cp -a app/views/layouts/$file2  backup/$file2$(date +"__%Y.%m.%d_%H.%M.%S").bak.txt
#remove turbolinks reference from $file2
patrn=", 'data-turbolinks-track' => true"
sed -i  "s/$patrn/ /" app/views/layouts/$file2
 
 
 
file2='application.html.erb'
cp -a app/assets/javascripts/$file1  backup/$file1$(date +"__%Y.%m.%d_%H.%M.%S").bak.txt
#
cat << 'HEREDOC' > app/views/layouts/$file2
<!DOCTYPE html >
<html>
  <head>
    <meta charset="utf-8">
      <meta content="IE=edge" http-equiv="X-UA-Compatible">
        <meta content="width=device-width, initial-scale=1" name="viewport">
          <title><%= Rails.application.class.parent_name %></title>
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
              <!-- <%#  = link_to 'Products', products_path %> -->
            </li>
          </ul>

          <ul class="nav navbar-nav navbar-right">
            <%# views/devise/menu/_login_items.html.erb %>
            <% if user_signed_in? %>
                <li>
                  <%= link_to "Administer", rails_admin.dashboard_path, :class => "btn btn-secondary " %>
                </li>
               <li>
                  <%= link_to('Logout', destroy_user_session_path, :method => :delete) %>
                </li>
                <li class="dropdown">
                  <a class="dropdown-toggle" data-toggle="dropdown" href="#"><%= current_user.email %>,<%= current_user.name %>
                  <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="#">This item to be used later</a></li>
                    <li> <%#= link_to 'Users', users_path %> </li>
                    <li> <%= link_to "Edit profile", edit_user_registration_path %> </li>
                    <li><%= link_to('Logout', destroy_user_session_path, :method => :delete) %></li>
                  </ul>
                </li>
            <% else %>
                <li>
                  <%= link_to('Login', new_user_session_path)  %>
                </li>
            <% end %>
          </ul>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <% flash.each do |type, msg| %>
        <div class="alert alert-<%= type == 'alert' ? 'danger' : 'success' %> alert-dismissable" role="alert">
          <button class="close"> .. </button>
          <%= msg if msg.is_a?(String) %>
        </div>
      <% end %>
      <%= yield %>
    </div>

  </body>
</html>
HEREDOC


  
###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# Copy files over..


path1='config/locales/en.yml'
cp -a  $sfil2/$path1 $path1



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sleep 1
git add -A # Add all files and commit them
git commit -m "app layout with disabled turbolinks"



