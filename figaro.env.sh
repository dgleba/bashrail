#!/usr/bin/env bash


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# read settings..

read  appn  sfil  sfil2  mpwd  parm0</tmp/"_brvar1202_${USER}".txt
echo $appn $sfil $sfil2 $mpwd $parm0

# timeout1=5 ; read -t "${timeout1}" -p "Press ENTER or wait $timeout1 seconds..." || true ;  echo ;


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


echo 'gem "figaro"' >> Gemfile

bundle


git add -A # Add all files and commit them
git commit -m "figaro environment gem"



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

bundle exec figaro install


echo 'SECRET_KEY_BASE: f55c9f3b84be053f8ea74b84d' >> config/application.yml
echo 'DATABASE_USERNAME: username1' >> config/application.yml
echo 'DATABASE_PASSWORD: pass1' >> config/application.yml


git status
# git diff
git add -A
git commit -m "after figaro install"




###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# change database gems..

# add text to end of line containing patrn...
#
filetarg='Gemfile'
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
  repl2 = 'not used here' 
  ARGF.each do |line|
    if line =~ /gem.*sqlite3/
      puts line.sub!(/sqlite3\'/, 'sqlite3\', group: :development')
    else
      puts line
    end  
  end
HEREDOC
ruby $r1tmp $filetarg > $filetarg.tmp
cp $filetarg.tmp $filetarg; rm $filetarg.tmp



# add new lines of text after patrn...
#
filetarg='Gemfile'
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
  repl2 = %q{
  gem 'mysql2', group: :development
  gem 'pg', group: :production
  }
  ARGF.each do |line|
    puts line
    puts repl2 if line =~ /gem.*sqlite3/
  end
HEREDOC
ruby $r1tmp $filetarg > $filetarg.tmp
cp $filetarg.tmp $filetarg; rm $filetarg.tmp



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



function offline21() {
: <<'BLOCKCOMMENT'





BLOCKCOMMENT
}


### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# git add -A # Add all files and commit them
# git commit -m "figaro setup"


### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
