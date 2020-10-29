#!/usr/bin/env bash
echo ~----------~----------Startingd $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")

 
  
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
  

#got error with # bundle show railties
# output ...
#   The dependency tzinfo-data (>= 0) will be unused by any of the platforms Bundler is installing for. Bundler is installing for ruby but the dependency is only for x86-mingw32, x86-mswin32, x64-mingw32, java. To add those platforms to the bundle, run `bundle lock --add-platform x86-mingw32 x86-mswin32 x64-mingw32 java`.
#   /home/albe/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/railties-5.2.4.4
#
bundle config disable_platform_warnings true


bundle update

sleep 1
git add -A # Add all files and commit them
git commit -m "gemfile"


