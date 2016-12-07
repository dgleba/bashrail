#!/usr/bin/env bash

  
 
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
      <% flash.each do |type, msg| %>
        <div class="alert alert-<%= type == 'alert' ? 'danger' : 'success' %> alert-dismissable" role="alert">
          <button class="close"> Close </button>
          <%= msg if msg.is_a?(String) %>
        </div>
      <% end %>
      <%= yield %>
    </div>

  </body>
</html>
HEREDOC
  
  
sleep 1
git add -A # Add all files and commit them
git commit -m "app layout with disabled turbolinks"



