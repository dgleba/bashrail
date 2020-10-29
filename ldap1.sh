#!/usr/bin/env bash
echo ~----------~----------Startingd $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# read settings..

read  appn  sfil  sfil2  mpwd  parm0</tmp/"_brvar1202_${USER}".txt
echo $appn $sfil $sfil2 $mpwd $parm0

# timeout1=5 ; read -t "${timeout1}" -p "Press ENTER or wait $timeout1 seconds..." || true ;  echo ;


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


echo 'gem "devise_ldap_authenticatable", :git => "git://github.com/cschiewek/devise_ldap_authenticatable.git" , ref: "HEAD"' >> Gemfile

bundle


git add -A # Add all files and commit them
git commit -m "ldap - 1 - before rails g devise_ldap_authenticatable:install"



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

rails g devise_ldap_authenticatable:install

# copy  user model..
mkdir -p  backup/app/models
# cp -a app/models/ backup/app/
cp -a $sfil2/app/models/user.rb app/models/

git status
# git diff
git add .
git commit -m "after rails g devise_ldap_authenticatable:install"




###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# not working..

# # add new lines of text after patrn...
# #
# filetarg='app/models/user.rb'
# r1tmp="/tmp/_temprubyrunner_${USER}.rb"
# cat << 'HEREDOC' > $r1tmp
  # repl2 = %Q{
  # devise :database_authenticatable, :registerable,
  # }
  # ARGF.each do |line|
    # puts line
    # puts repl2 if line =~ /confirmable/
  # end
# HEREDOC
# ruby $r1tmp $filetarg > $filetarg.tmp
# cp $filetarg.tmp $filetarg; rm $filetarg.tmp




# not working..

# # comment line containing pattern...
# #
# filetarg='app/models/user.rb'
# r1tmp="/tmp/_temprubyrunner_${USER}.rb"
# cat << 'HEREDOC' > $r1tmp
  # repl2 = %Q{
  # notused
  # }
  # ARGF.each do |line|
    # if line =~ /ldap_authenticatable/
      # puts "  ##{line}"
    # else
      # puts line
    # end
  # end
# HEREDOC
# ruby $r1tmp $filetarg > $filetarg.tmp
# cp $filetarg.tmp $filetarg; rm $filetarg.tmp





#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function offline21() {
: <<'BLOCKCOMMENT'


I am getting this error.

Just make the changes manually for now.
Have to copy my ldap.yml into place anyway..


albe@v206x20161030220807:~/share203/dg/brail347a11papertrail$ irb
irb(main):001:0>   repl2 = <<-RBHEREDOC
irb(main):002:0"   config.ldap_create_user = true
irb(main):003:0"   config.ldap_auth_username_builder = Proc.new() {|attribute, login, ldap| "#{login}@stackpole.ca"}
irb(main):004:0"   RBHEREDOC
NameError: undefined local variable or method `login' for main:Object
	from (irb):3
	from /home/albe/.rbenv/versions/2.3.0/bin/irb:11:in `<main>'
irb(main):005:0>


BLOCKCOMMENT
}

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# add new lines of text after patrn...

filetarg='config/initializers/devise.rb'
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
  repl2 = %q[

  config.ldap_create_user = true
  config.ldap_auth_username_builder = Proc.new() {|attribute, login, ldap| "#{login}@stackpole.ca"}
  ]
  ARGF.each do |line|
    puts line
    puts repl2 if line =~ /config.ldap_ad_group_check/
  end
HEREDOC
ruby $r1tmp $filetarg > $filetarg.tmp
cp $filetarg.tmp $filetarg; rm $filetarg.tmp


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

git add -A # Add all files and commit them
git commit -m "ldap - 3. setup finished. check the ldap_manual-edits.txt file for more instructions"


### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
