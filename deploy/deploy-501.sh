#!/usr/bin/env bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function Purpose() {
# begin block comment =============================
: <<'END'

#  Purpose:  deploy the app to production


Read and edit these files. they may need editing.
  edit prjname dpath and vport..
    ..
  
  
Note: This is specfic to my server setup..  see: https://github.com/dgleba/vamp206a  
  
  
usage:   


( the rails project folder )  example: run this from /srv/web/rail263 


*******   Don't run with sudo..  *******


 cd /srv/web/rail263
 deploy/deploy.sh

end -- usage. 


END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#cd ;
date ; set +vx  ; set -vx ; # echo off, then echo on
#


# settings...

prjname="lpa346"
dpath="/srv/web/$prjname"
vport="1293"



echo $prjname
echo $dpath
echo $vport

cd $dpath

mkdir -p shared/pids shared/sockets shared/log

sudo cp deploy/puma.conf /etc/init/puma.conf
sudo cp deploy/puma-manager.conf /etc/init/puma-manager.conf
cp deploy/puma.rb config/puma.rb


#old..
#sudo sh -c 'echo "$dpath" >> /etc/puma.conf'
#
# remove line containing  ???  and replace the line completely with the new text ...
# example.. sed 's/.*TEXT_TO_BE_REPLACED.*/This line is removed by the admin/'
# sudo sed -i "s/.*$dpath.*//$dpath/g" /etc/puma.conf



# add path to etc/puma.conf...
if grep --quiet "$dpath" /etc/puma.conf; then
  echo  the text exists.. do nothing..
else
  #  it's not found..
  sudo sh -c "echo $dpath >> /etc/puma.conf"
  echo added $dpath to puma.conf
fi



# Use &&& as a marker for $ in the heredoc tee. Then replace &&& markers with $ afterward..
#
sudo tee /etc/nginx/sites-available/$prjname.conf <<EOF
############
#
# http://pmdsdata:$vport/
# nginx conf $prjname 

upstream app$vport {
    # Path to Puma SOCK file, as defined previously
    server unix:/srv/web/$prjname/shared/sockets/puma.sock fail_timeout=0;
}

server {
    listen $vport;
    #server_name localhost;
    server_name 127.0.0.1;

    root /srv/web/$prjname/public;

    try_files &&&uri/index.html &&&uri @app$vport;

    location @app$vport {
        proxy_pass http://app$vport;
        proxy_set_header X-Forwarded-For &&&proxy_add_x_forwarded_for;
        proxy_set_header Host &&&http_host;
        proxy_redirect off;
    }

    error_page 500 502 503 504 /500.html;
    client_max_body_size 4G;
    keepalive_timeout 10;
}
#
EOF
#
# replace &&& markers with $
#  
sudo sed -i -e 's/&&&/\$/g' /etc/nginx/sites-available/$prjname.conf 




sudo cp  /etc/nginx/sites-available/$prjname.conf  /etc/nginx/sites-available/$prjname.conf$(date +"__%Y.%m.%d_%H.%M.%S").bk
# copy file into place --  from $prjname app folder /srv/web/$prjname
# now in tee above... sudo cp  deploy/$prjname.conf /etc/nginx/sites-available/$prjname.conf
sudo ln -nfs /etc/nginx/sites-available/$prjname.conf /etc/nginx/sites-enabled/$prjname.conf

#https://github.com/sferik/rails_admin/issues/2515 -- Gradient has outdated direction syntax. New syntax is like `to left` instead of `right` #2515
sleep 1
bundle exec rake assets:precompile RAILS_ENV=production
sleep 3
bundle exec rake assets:precompile RAILS_ENV=production

sudo start puma-manager
sudo restart puma-manager
sudo service nginx restart



# http://stackoverflow.com/questions/4883891/ruby-on-rails-production-log-rotation
# http://www.thegeekstuff.com/2010/07/logrotate-examples
#
sudo tee /etc/logrotate.d/raillog_$prjname <<EOF
/srv/web/$prjname/log/*.log {
    size=5k
    daily
    missingok
    rotate 62
    compress
    delaycompress
    notifempty
    copytruncate
}
EOF
#


# bundle exec rake db:migrate RAILS_ENV=production
# bundle exec rake db:seed RAILS_ENV=production

