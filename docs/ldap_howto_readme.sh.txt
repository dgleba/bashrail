
around.. 2016-10-21

see also  \\10.4.1.227\rt\srv\share\incident295a\docs\ldap265mk\readme__incidents-ldap-howto.sh.txt

_____________ 



echo 'gem "devise_ldap_authenticatable", :git => "git://github.com/cschiewek/devise_ldap_authenticatable.git"' >> Gemfile
bundle

done already?   rails generate devise:install
done already?   rails generate devise user
done already?   rake db:migrate

git add .
git commit -m "before rails g devise_ldap_authenticatable:install"

rails g devise_ldap_authenticatable:install

git status
git diff
git add .
git commit -m "after rails g devise_ldap_authenticatable:install"


done already?   rails generate devise:views 


# add auth requirement in controller..  
# sed -i '/CLIENTSCRIPT="foo"/a CLIENTSCRIPT2="hello"' file  # add line after pattern
done already?   sed -i '/ApplicationController/a  before_filter :authenticate_user!' app/controllers/application_controller.rb


# add ldap_authenticatable in place of :database_authenticatable, in app/models/user.rb

#replace only the first occurrence  --  sed -i -e '0,/foo/s/foo/bar/' filename -  http://stackoverflow.com/questions/148451/how-to-use-sed-to-replace-only-the-first-occurrence-in-a-file
sed -i -e '0,/email_field/s/email_field/text_field/' app/views/devise/sessions/new.html.erb

# copy in config files..


cp -f $sfiles/devise.rb config/initializers
cp  $sfiles/ldap.yml  config

git add .
git commit -m "change devise config for ldap"

echo  run rails s
echo  Now visit localhost:3000/posts
#

