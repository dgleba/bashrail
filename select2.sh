#!/usr/bin/env bash

  
### enable select2 .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#
# add line after match...  sed -i '/CLIENTSCRIPT="foo"/a CLIENTSCRIPT2="hello"' file
# i think 0, means only do it for the first match..
#
pattern1='ActiveRecord::Base'
line1='  has_many :product_feature\n  has_many :pfeature, through: :product_feature\n'
file1='app/models/product.rb'
sed  -i "0,/$pattern1/a $line1" $file1
#
sleep 1

#
pattern1='ActiveRecord::Base'
line1='   has_many :product_feature\n   has_many :product, through: :product_feature\n'
file1='app/models/pfeature.rb'
sed  -i "0,/$pattern1/a $line1" $file1



line1='<%= f.association :pfeature %>'
patrn='f.input :name'
sed -i "/.*$patrn.*/a $line1" app/views/products/_form.html.erb

      
sleep 1
      
# add this.. :ptype_ids => [] ... Edit line to look like this..  params.require(:product).permit(:name, :ptype_ids => [])
# http://unix.stackexchange.com/questions/155331/sed-replace-a-character-in-a-matched-line-in-place  /ipsum/{s/#//g;s/@/-at-/g;}
# add a space before the last character in the line...   sed 's/.$/ &/' file
#
# find lines with $patrn and replace last characater with $str1)
patrn='params.require'
patrn='require'
str1=', :pfeature_ids=> []'
file1='app/controllers/products_controller.rb'
echo $patrn,  $str1,  $file1
sed -i  "/$patrn/{s/.$/$str1\)/}" $file1 

# rev $file1 | sed "s/)/ZaZ@Z/" | rev


sleep 1

# insert lines before line matching patrn...
ln1='<p>'
ln2='<% @product.pfeature.each do |v1| %>'
ln3='    <%= link_to v1.name, v1 %>'
ln4='<% end %>'
ln5='</p>'
patrn='edit_product_path'
sed -i "/.*$patrn.*/i $ln1\n$ln2\n$ln3\n$ln4\n$ln5\n" app/views/products/show.html.erb

sleep 1

mkdir -p app/inputs
cat << 'HEREDOC' > app/inputs/collection_select_input.rb
# app/inputs/collection_select_input.rb
class CollectionSelectInput < SimpleForm::Inputs::CollectionSelectInput
  def input_html_classes
    super.push('dgselect2')
  end
end
HEREDOC


cat << 'HEREDOC' > app/assets/javascripts/dgselect2.js
//#app/assets/javascripts/dgselect2.js
$(function() {
  $(".dgselect2").select2({
   });	
});
HEREDOC

echo '//= require select2' >> app/assets/javascripts/application.js
 
# this gave error.. echo  '*= require select2'>> app/assets/stylesheets/application.scss
# echo  '*= require select2-bootstrap'>> app/assets/stylesheets/application.scss
#
# insert lines after line matching patrn...
ln1='\ \ \*= require select2'
ln2='  \*= require select2-bootstrap'
# got error.. patrn='self'
# sed -i "/self/a "$ln1"\n"$ln2"\n" app/assets/stylesheets/application.scss
  sed -i "/require_self/a $ln1\n$ln2" app/assets/stylesheets/application.scss


sleep 1
git add -A # Add all files and commit them
git commit -m "enable select2"
 