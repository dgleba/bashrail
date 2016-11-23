#!/usr/bin/env ruby

# http://whatisthor.com/

# usage:   ruby  ../bashrail/thor/t2.rb gem1 anyparameter
#
# eg:
# cd /var/raila
# ruby  ../bashrail/thor/t2.rb gem1 anyparameter
# this will operate on files in raila
# bashrail/ must be beside raila/


require "thor"
 
class MyCLI < Thor
  desc "hello NAME", "say hello to NAME"
  def hello(name)
    puts "Hello #{name}"
  end
end
 
# MyCLI.start(ARGV)


class Rail308 < Thor
  desc "hello NAME", "say hello to NAME"
  def gem1(name)
    puts "Hello x"
  end
end
 
 
Rail308.start(ARGV)
