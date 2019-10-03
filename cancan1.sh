#!/usr/bin/env bash
echo ~----------~----------Startingd $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 # read settings..

read  appn  sfil  sfil2  mpwd  parm0</tmp/"_brvar1202_${USER}".txt
echo $appn $sfil $sfil2 $mpwd $parm0

# timeout1=15 ; read -t "${timeout1}" -p "Press ENTER or wait $timeout1 seconds..."  || true;  echo ;


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



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# modify scaffold controller and users and roles controllers


# sub , add new lines of text after patrn...

r1tmp="/tmp/_temprubyrunner_${USER}.rb"
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

r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
  repl2 = %Q{
  rescue_from CanCan::AccessDenied do |exception|
    # redirect_to :back, alert: exception.message
    redirect_to main_app.root_path, :alert => exception.message
  end
  }
  ARGF.each do |line|
    puts line
    puts repl2 if line =~ /protect_from_forgery with\: \:exception/
  end
HEREDOC
filetarg='app/controllers/application_controller.rb'
ruby $r1tmp $filetarg > $filetarg.tmp
cp $filetarg.tmp $filetarg; rm $filetarg.tmp




###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 # add to users_controller

r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
  repl2 = %Q{
  #cancancan
  load_and_authorize_resource}
  ARGF.each  { |line|  puts line ;  puts repl2 if line =~ /before_action/ }
HEREDOC
filetarg='app/controllers/users_controller.rb'
if [ -f $filetarg ] ; then
  ruby $r1tmp $filetarg > $filetarg.tmp ; cp $filetarg.tmp $filetarg ; rm $filetarg.tmp
else
  echo 'skipping, file doesnt exist.'
fi



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 # add to roles_controller

# r1tmp="/tmp/_temprubyrunner_${USER}.rb"
# cat << 'HEREDOC' > $r1tmp
  # repl2 = %Q{
  # #cancancan
  # load_and_authorize_resource}
  # ARGF.each  { |line|  puts line ;  puts repl2 if line =~ /before_action/ }
# HEREDOC
# filetarg='app/controllers/roles_controller.rb'
# ruby $r1tmp $filetarg > $filetarg.tmp && cp $filetarg.tmp $filetarg && rm $filetarg.tmp


# add roles.

rails g scaffold Role name description active_status:integer sort:integer

# Add role to user.

rails g migration AddRoleToUser role:references
rake db:migrate


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# copy ability and user model..
mkdir -p  backup/app/models
cp -a app/models/ backup/app/
cp -a $sfil2/app/models/ app/

# timeout1=15 ; read -t "${timeout1}" -p "Press ENTER or wait $timeout1 seconds..."  || true;  echo ;




###  git. .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

git add -A # Add all files and commit them
git commit -m "add cancan 2"


