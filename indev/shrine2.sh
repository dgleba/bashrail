#!/usr/bin/env bash


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function Purpose() {
# begin block comment 
: <<'END'

#  Purpose:  add shrine file upload

start with brail347a25

then do this..



END
# end block comment 
}
###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# read settings..

read  appn  sfil  sfil2  mpwd  parm0</tmp/"_brvar1202_${USER}".txt
echo " appn:$appn    sfil:$sfil    sfil2:$sfil2    parm0:$parm0    mpwd:$mpwd"  

# timeout1=5 ; read -t "${timeout1}" -p "Press ENTER or wait $timeout1 seconds..." || true ;  echo ;



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



rails generate scaffold Album name:string cover_photo_data:text 

rails generate scaffold Photo album:references title:string image_data:text 
# --no-migration



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


 
# echo "gem 'carrierwave', '~> 1.0'" >> Gemfile

# Shrine
  echo "gem 'shrine'" >> Gemfile
  echo "gem 'fastimage'" >> Gemfile
# Processing
  echo "gem 'image_processing'" >> Gemfile
  echo "gem 'mini_magick'" >> Gemfile



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

models edit

app/models/image_uploader.rb

_____________


commit e2c1f3ad48901641ae8ccb5cc2a9e74cde4dccf3
Author: David Gleba <dgleba@gmail.com>
Date:   Sat Mar 31 17:07:29 2018 -0400
    shrine2

diff --git a/app/models/album.rb b/app/models/album.rb

-class Album < ApplicationRecord
+class Album < ActiveRecord::Base
+  has_many :photos, dependent: :destroy
+  accepts_nested_attributes_for :photos, allow_destroy: true
+
+  include ImageUploader::Attachment.new(:cover_photo)
+
+  validates_presence_of :name, :cover_photo
 end
 

diff --git a/app/models/photo.rb b/app/models/photo.rb
index de07343..cd874b8 100644
--- a/app/models/photo.rb
+++ b/app/models/photo.rb
@@ -1,3 +1,3 @@
-class Photo < ApplicationRecord
-  belongs_to :album
+class Photo < ActiveRecord::Base
+  include ImageUploader::Attachment.new(:image)
 end


diff --git a/app/models/image_uploader.rb b/app/models/image_uploader.rb

diff --git a/config/initializers/shrine.rb b/config/initializers/shrine.rb




###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


albe@pmdsdata4:/srv/share/test/brail347a25-shrine$ git ca shrine10
albe@pmdsdata4:/srv/share/test/brail347a25-shrine$ git lds
7931834\ 2018-03-31 (HEAD, master)\ shrine10\ [David Gleba]
bd53f18\ 2018-03-31\ shrine9\ [David Gleba]
5f09902\ 2018-03-31\ shrine8\ [David Gleba]
5f7fc45\ 2018-03-31\ shrine7\ [David Gleba]
0f19573\ 2018-03-31\ shrine6\ [David Gleba]
d0b367f\ 2018-03-31\ shrine5\ [David Gleba]
9eb17fa\ 2018-03-31\ shrine4\ [David Gleba]
9b4ea5d\ 2018-03-31\ shrine3\ [David Gleba]
e2c1f3a\ 2018-03-31\ shrine2\ [David Gleba]
7d5c6bd\ 2018-03-31\ shrine1\ [David Gleba]
fce9ff8\ 2018-03-30\ mass update 2018-03-29\ [David Gleba]
eda2200\ 2018-03-06\ add button to about, and button to mass update pfeature name field with raw sql 2018-03-06\ [David Gleba]
65dac3d\ 2018-03-03\ add sqlite db and docs. Bashrail Finished.\ [David Gleba]


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

exit 0

end comment - this will not run