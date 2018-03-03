#!/usr/bin/env bash


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


status:

this worked when it was one file attached.
i then started editing the project for multiple-file-uploads.
it is not working.

https://github.com/dgleba/brail347a22

https://brail347a22-dgleba.c9users.io/pets

git lds: this works i think.
5dc1537\ 2018-01-27 (HEAD -> master)\ carrierwave - 7c\ [David Gleba]



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# uploads go to...
#
# see ..   ./workspace/public/uploads/pet/image/5/config.csv


# https://code.tutsplus.com/tutorials/rails-image-upload-using-carrierwave-in-a-rails-app--cms-25183

# https://stackoverflow.com/questions/21411988/rails-4-multiple-image-or-file-upload-using-carrierwave
# https://stackoverflow.com/questions/11690257/rails-how-to-download-a-previously-uploaded-document

# https://stackoverflow.com/questions/21411988/rails-4-multiple-image-or-file-upload-using-carrierwave
# https://github.com/carrierwaveuploader/carrierwave/blob/master/README.md#multiple-file-uploads
 
 
# https://code.tutsplus.com/articles/uploading-with-rails-and-carrierwave--cms-28409

# https://github.com/bodrovis/TutsPlusSource/tree/master/Uploading_with_Carrierwave




###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# read settings..

read  appn  sfil  sfil2  mpwd  parm0</tmp/"_brvar1202_${USER}".txt
echo $appn $sfil $sfil2 $mpwd $parm0

# timeout1=5 ; read -t "${timeout1}" -p "Press ENTER or wait $timeout1 seconds..." || true ;  echo ;


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


 
# echo "gem 'carrierwave', '~> 1.0'" >> Gemfile
echo "gem 'carrierwave'" >> Gemfile
echo "gem 'mini_magick'" >> Gemfile

bundle


git add -A # Add all files and commit them
git commit -m "carrierwave - 1"



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

rails g scaffold Pet name:string description:text image:string

bundle exec rake db:migrate

git add -A # Add all files and commit them
git commit -m "carrierwave - 2"



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



# Write new file...

r1tmp="config/initializers/carrier_wave.rb"
cat << 'HEREDOC' > $r1tmp

# config/initializers/carrier_wave.rb
 
require 'carrierwave/orm/activerecord'

HEREDOC

cat  config/initializers/carrier_wave.rb


git add -A # Add all files and commit them
git commit -m "carrierwave - 3"


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#  This will create a new directory called uploaders in the app folder and a file inside called image_uploader.rb. 

rails generate uploader Image


git add -A # Add all files and commit them
git commit -m "carrierwave - 4"


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# add new lines of text after patrn...
#

cat 'app/models/pet.rb'


filetarg='app/models/pet.rb'
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
  repl2 = %Q{
  mount_uploader :image, ImageUploader
  }
  ARGF.each do |line|
    puts line
    puts repl2 if line =~ /class /
  end
HEREDOC
ruby $r1tmp $filetarg > $filetarg.tmp
cp $filetarg.tmp $filetarg; rm $filetarg.tmp

cat 'app/models/pet.rb'




###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# add new lines of text before patrn...
#

git add -A # Add all files and commit them
git commit -m "carrierwave - 7b"


cat 'app/views/pets/_form.html.erb'

# grep end 'app/views/pets/_form.html.erb'


filetarg='app/views/pets/_form.html.erb'
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
  ARGF.each do |line|
    if line =~ /image,/
      line.sub! /f.text_field/, "f.file_field" 
    end  
    puts line
  end
HEREDOC
ruby $r1tmp $filetarg > $filetarg.tmp
cat $filetarg.tmp
cp $filetarg.tmp $filetarg; rm $filetarg.tmp

###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


git add -A # Add all files and commit them
git commit -m "carrierwave - 7c"







###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# sqlite3 db/development.sqlite3
# delete from pets;




###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

