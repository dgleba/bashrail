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

  gsub_file  path1 ,  /config.password_length = 6..128/ do 
  <<-'RUBY' 
config.password_length = 1..128  
  RUBY
  end
    
  # comment_lines path1, /config.email_regexp/
  
  gsub_file  path1 ,  'config.email_regexp = /\A[^@\s]+@[^@\s]+\z/'  do 
  <<-'RUBY' 
# config.email_regexp = /\A[^@\s]+@[^@\s]+\z/ 
config.email_regexp = /./ 
  RUBY
  end    

puts File.dirname(__FILE__)
puts "gsub1"
end
   
def self.source_root
  File.dirname(__FILE__)
end 
   
end
 
Rail308.start(ARGV)

