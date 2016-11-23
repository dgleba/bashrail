#!/usr/bin/env ruby

# usage:   ruby  ../bashrail/thor/t2.rb gsub1 a
#
# eg:
# cd /var/raila
# ruby  ../bashrail/thor/t2.rb gem1 anyparameter
# this will operate on files in raila
# bashrail/ must be beside raila/

# https://gist.github.com/levifig/463511
# http://stackoverflow.com/questions/2088480/modify-a-file-with-a-rails-generator
# http://textmate.rubyforge.org/thor/Thor/Actions.html



require "thor"

class Rail308 < Thor

  include Thor::Actions
  
  desc "hello NAME", "say hello to NAME"
  def gem1(name)
    puts "Hello x"
  end
  
  desc "add to a file", "gsub file"
  def gsub1(name)

    path1 = 'app/models/product.rb'
    path2 = 'app/models/product.rb.bak'

    gsub_file path1 ,     /ActiveRecord::Base/ do 
    <<-'RUBY' 
    ActiveRecord::Base
    has_many :product_feature
    has_many :pfeature, through: :product_feature
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
