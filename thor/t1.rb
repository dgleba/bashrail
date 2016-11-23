#!/usr/bin/env ruby

# http://whatisthor.com/


require "thor"
 

class MyCLI < Thor
  desc "hello NAME", "say hello to NAME"
  def hello(name)
    puts "Hello #{name}"
  end
end
 
 
MyCLI.start(ARGV)

