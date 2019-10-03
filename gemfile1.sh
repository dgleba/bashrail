#!/usr/bin/env bash

 
  
### gemfile.. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
pwd


echo "gem 'faker'" >> Gemfile
echo "gem 'populator'" >> Gemfile

# to fix error..
# http://stackoverflow.com/questions/40823566/i-get-this-errors-whenever-i-want-to-generate-a-new-controller
# ggl: rails new ruby thor-0.19.2   validate_default_type An option's default must match its type. (ArgumentError)
# rails _4.2.7.1_ new /2.3.0/lib/ruby/gems/2.3.0/gems/thor-0.19.2/lib/thor/parser/option.rb:130:in `validate_default_type!': An option's default must match its type. (ArgumentError)

echo "gem 'thor'">> Gemfile

echo "# " >> Gemfile


# gem uninstall thor -v 0.19.2
# gem install thor -v 0.19.1 
# bundle update thor  
  
bundle update

sleep 1
git add -A # Add all files and commit them
git commit -m "gemfile"


