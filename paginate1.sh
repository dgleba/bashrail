#!/usr/bin/env bash


# kaminari pagainate, with ransack search  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
pwd

# https://www.anthonycandaele.com/blog/2015/08/04/adding-pagination-to-your-rails-app-with-kaminari

# http://www.softwaremaniacs.net/2014/01/replacing-scaffoldcontroller-generator.html



# to get original controller generator....
  railt1="$(bundle show railties)"
  echo "${railt1}"
  path1='lib/rails/generators/rails/scaffold_controller/templates'
  echo "${railt1}/${path1}"
  ls -la "${railt1}/${path1}"

  path2='lib/templates/rails/scaffold_controller/orig_default'
  mkdir -p $path2
  rsync -auv "${railt1}/${path1}/" $path2
# 

# before..
# def index
  # @<%= plural_table_name %> = <%= orm_class.all(class_name) %>
#
# after..
#   from railt251b or c..
# insert_into_file 'lib/templates/rails/scaffold_controller/controller.rb', after: /def index\n/ do
  # <<-'RUBY'
  # i think this should be .. <%= singular_table_name %>
    # @q = @<%= plural_table_name %>.search params[:q]
    # @<%= plural_table_name %> = @q.result.page(params[:page])
  # RUBY
# end
#

path1='lib/templates/rails/scaffold_controller'
# rsync.. -a - rltpgoD  preserve almost all. -u update don't copy older source files.
rsync -auv  $sfil2/$path1/ $path1/


rails generate 'kaminari:config'


# Copy scaffold templates over..

path1='lib/templates/erb/scaffold'
# rm -r $path1/
# rsync.. -a - rltpgoD  preserve almost all. -u update don't copy older source files.
rsync -auv --ignore-times  $sfil2/$path1/ $path1/



git add -A # Add all files and commit them
  git commit -m "Kaminari Ransack"

  
