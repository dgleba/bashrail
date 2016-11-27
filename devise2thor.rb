#!/usr/bin/env ruby

# usage:   ruby  ../bashrail/thor/t2.rb gsub1 a
#
# eg:
# cd /var/raila
# ruby  ../bashrail/thor/t2.rb gem1 anyparameter
# this will operate on files in raila
# bashrail/ must be beside raila/


require "thor"

class Rail308 < Thor

include Thor::Actions

desc "add to a file", "gsub file"

def gsub1(name)

  path1 = 'config/initializers/devise.rb'

  #
  # change password_length..
  #
  gsub_file  path1 ,  /config.password_length = 6..128/ do 
  <<-'RUBY' 
config.password_length = 1..128  
  RUBY
  end
    
  
  #
  # change email regex check...
  #

  gsub_file  path1 ,  'config.email_regexp = /\A[^@\s]+@[^@\s]+\z/'  do 
  <<-'RUBY' 
# config.email_regexp = /\A[^@\s]+@[^@\s]+\z/ 
config.email_regexp = /./ 
  RUBY
  end    


puts File.dirname(__FILE__)
puts "gsub1"
end
   

   
desc "add to a file", "gsub stylesheet file"

def gsub2(name)

  #
  # add devise bootstrap views.....
  #
  path2 = 'app/assets/stylesheets/application.scss'
  gsub_file  path2 ,  '= require_self'  do 
  <<-'RUBY' 
= require_self 
 *= require devise_bootstrap_views
  RUBY
  end 
end   
   
 
   
desc "add logout link to home page..." , "edit file(s)"

def gsub3(name)

  #
  # add logout link...
  #

  prepend_file 'app/views/home/index.html.erb', <<-'RUBY'
<% if user_signed_in? %> 
  <%= link_to('Logout', destroy_user_session_path, :method => :delete) %>         
<% else %> 
  <%= link_to('Login', new_user_session_path)  %>
<%end %>  
  RUBY
  
 
 
end   
   
  
 
   
def self.source_root
  File.dirname(__FILE__)
end 
   
#class end   
end
 
Rail308.start(ARGV)

