#!/usr/bin/env bash

###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# read settings..

read  appn  sfil  sfil2  mpwd  parm0</tmp/"_brvar1202_${USER}".txt
echo $appn $sfil $sfil2 $mpwd $parm0

# timeout1=5 ; read -t "${timeout1}" -p "Press ENTER or wait $timeout1 seconds..." || true ;  echo ;


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


echo "gem 'jwt'" >> Gemfile

bundle


git add -A # Add all files and commit them
git commit -m "jwt1"



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



# add new lines of text after patrn...

filetarg='config/initializers/devise.rb'
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
  repl2 = %Q{

  config.warden do |manager|
   # Registering your new Strategy
   manager.strategies.add(:jwt, Devise::Strategies::JsonWebToken)
   # Adding the new JWT Strategy to the top of Warden's list,
   # Scoped by what Devise would scope (typically :user)
   manager.default_strategies(scope: :user).unshift :jwt
  end
  
  }
  ARGF.each do |line|
    puts line
    puts repl2 if line =~ /Devise\.setup/
  end
HEREDOC
ruby $r1tmp $filetarg > $filetarg.tmp
cp $filetarg.tmp $filetarg; rm $filetarg.tmp



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# Copy files over..


path1='config/initializers/core/extensions/devise/strategies'
mkdir -p $path1/
rm -r $path1/
# rsync.. -a - rltpgoD  preserve almost all. -u update don't copy older source files.
rsync -av --ignore-times  $sfil2/$path1/ $path1/



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# edit secrets.yml rather than copying it like the next commented out stanza would..



# add new lines of text after patrn...

filetarg='config/secrets.yml'
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
  repl2 = %Q{
  # jwt token auth
  # Add somewhere to your secrets yml
  # "config/secrets.yml"
  jwt_secret: '38af0483c50d39ebd0b58ea81a3fc366c1995c4da5bsuperrandomkey'
  jwt_expiration_hours: 18
  }
  ARGF.each do |line|
    puts line
    puts repl2 if line =~ /development\:/
  end
HEREDOC
ruby $r1tmp $filetarg > $filetarg.tmp
cp $filetarg.tmp $filetarg; rm $filetarg.tmp

sleep 1

# add new lines of text after patrn...

filetarg='config/secrets.yml'
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
  repl2 = %Q{
  # jwt token auth
  # Add somewhere to your secrets yml
  # "config/secrets.yml"
  jwt_secret: '62d2f8f20c9852a2da46b9332c8ec62ba95d82509a7c758evenmoresuperrandomkey'
  jwt_expiration_hours: 18
  }
  ARGF.each do |line|
    puts line
    puts repl2 if line =~ /production\:/
  end
HEREDOC
ruby $r1tmp $filetarg > $filetarg.tmp
cp $filetarg.tmp $filetarg; rm $filetarg.tmp




###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function blockcomment21() {
: <<'BLOCKCOMMENT'



# careful with this one.. You may want to edit manually to preserve it's contents..

# copy secrets.yml

# first, backup secrets..
mkdir -p backup
file1='secrets.yml'
cp -a config/$file1  backup/$file1$(date +"__%Y.%m.%d_%H.%M.%S").bak.txt

path1='config'
mkdir -p $path1/
#  rm -r $path1/
# rsync.. -a - rltpgoD  preserve almost all. -u update don't copy older source files.
rsync -av --ignore-times  $sfil2/$path1/ $path1/

BLOCKCOMMENT
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# add to home index..

cat << 'HEREDOC' >> app/views/home/index.html.erb

<br><br><br>
<hr>

JWT
<br>
# Add the following code to a view
<br>
# It will show you an example of how to make a
<br>
# curl HTTP request with the proper authentication headers.
<br>
# Be sure to actually use a working route and not "http://localhost:3001/products.json"
<br>
<br>

<% if user_signed_in? %>
  curl -i -X  GET --header 'Authorization: Bearer <%= JWTWrapper.encode({ user_id: current_user.id }) %>' 'http://localhost:3001/products.json'
<% end %>

<br><br><br>
<hr>

HEREDOC


### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




# add new lines of text after patrn...

filetarg='app/controllers/application_controller.rb'
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
  repl2 = %Q{
  # Be sure to enable JSON.
  respond_to :html, :json
  }
  ARGF.each do |line|
    puts line
    puts repl2 if line =~ /before_filter/
  end
HEREDOC
ruby $r1tmp $filetarg > $filetarg.tmp
cp $filetarg.tmp $filetarg; rm $filetarg.tmp

sleep 1

# comment out line if matches patrn and insert repl2 before that line...

filetarg='app/controllers/application_controller.rb'
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
  repl2 = %Q{
  protect_from_forgery with: :null_session
  }
  ARGF.each do |line|
    if line =~ /protect_from_forgery with/ then
      puts repl2
      print '  #'
      puts line
      
    else
      puts line
    end
  end
HEREDOC
ruby $r1tmp $filetarg > $filetarg.tmp
cp $filetarg.tmp $filetarg; rm $filetarg.tmp


  
### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

git add -A # Add all files and commit them
git commit -m "jwt token auth2"


### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# copy devise controllers

path1='app/controllers/users'
mkdir -p $path1/
rm -r $path1/
# rsync.. -a - rltpgoD  preserve almost all. -u update don't copy older source files.
rsync -av --ignore-times  $sfil2/$path1/ $path1/


### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# sub  lines of text  when matching patrn...

filetarg='config/routes.rb'
cat << 'HEREDOC' > $r1tmp
  repl2 = %Q{
  devise_for :users, controllers: { sessions: 'users/sessions' }
  }
  ARGF.each do |line|
    if line =~ /devise_for/ then
      puts repl2
    else
      puts line
    end
  end
HEREDOC
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
ruby $r1tmp $filetarg > $filetarg.tmp
cp $filetarg.tmp $filetarg; rm $filetarg.tmp



### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

git add -A # Add all files and commit them
git commit -m "jwt token auth 3"


### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
