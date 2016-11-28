#!/usr/bin/env bash
 
###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 
echo 'gem "cancancan"' >> Gemfile

bundle

###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# note .. roles table was created with users table in devise1.rb.

###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 
rails g cancan:ability



###  git. .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

git add -A # Add all files and commit them
git commit -m "add cancan 1"
  
  
# copy ability and user model..

cp -a $sfil2/app/models/ app/



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# modify scaffold controller and users and roles controllers


# sub , add new lines of text after patrn...

r1tmp='/tmp/temprubyrunner.rb'
cat << 'HEREDOC' > $r1tmp
  repl2 = %Q{
  #cancancan
  load_and_authorize_resource}
  ARGF.each do |line|
    puts line
    puts repl2 if line =~ /before_action/
  end  
HEREDOC
filetarg='lib/templates/rails/scaffold_controller/controller.rb'
ruby $r1tmp $filetarg > $filetarg.tmp
cp $filetarg.tmp $filetarg; rm $filetarg.tmp




###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 # add to appl..contro..rb

r1tmp='/tmp/temprubyrunner.rb'
cat << 'HEREDOC' > $r1tmp
  repl2 = %Q{
  rescue_from CanCan::AccessDenied do |exception|
    # redirect_to :back, alert: exception.message
    redirect_to main_app.root_path, :alert => exception.message
  end
  }
  ARGF.each do |line|
    puts line
    puts repl2 if line =~ /protect_from_forgery/
  end  
HEREDOC
filetarg='app/controllers/application_controller.rb'
ruby $r1tmp $filetarg > $filetarg.tmp
cp $filetarg.tmp $filetarg; rm $filetarg.tmp




###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 # add to users_controller
 
r1tmp='/tmp/temprubyrunner.rb'
cat << 'HEREDOC' > $r1tmp
  repl2 = %Q{
  #cancancan
  load_and_authorize_resource}
  ARGF.each  { |line|  puts line ;  puts repl2 if line =~ /before_action/ }
HEREDOC
filetarg='app/controllers/users_controller.rb'
ruby $r1tmp $filetarg > $filetarg.tmp ; cp $filetarg.tmp $filetarg ; rm $filetarg.tmp



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 # add to roles_controller
 
r1tmp='/tmp/temprubyrunner.rb'
cat << 'HEREDOC' > $r1tmp
  repl2 = %Q{
  #cancancan
  load_and_authorize_resource}
  ARGF.each  { |line|  puts line ;  puts repl2 if line =~ /before_action/ }
HEREDOC
filetarg='app/controllers/roles_controller.rb'
ruby $r1tmp $filetarg > $filetarg.tmp && cp $filetarg.tmp $filetarg && rm $filetarg.tmp



###  git. .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

git add -A # Add all files and commit them
git commit -m "add cancan 2"
  
  
