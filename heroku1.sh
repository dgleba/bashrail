
echo run the commands by pasteing them..

echo exiting..

exit



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# https://devcenter.heroku.com/articles/getting-started-with-rails5#local-workstation-setup

sudo apt-get update
sudo apt-get install -y postgresql postgresql-contrib postgresql-client-common  pgadmin3
# not .. postgres-xc-client

gem uninstall  heroku

sudo apt-get --purge remove heroku
sudo apt-get --purge remove heroku-toolbelt

sudo apt-get remove heroku heroku-toolbelt
sudo rm /etc/apt/sources.list.d/heroku.list

sudo apt-key list
sudo apt-key del KEYFROMABOVE
# sudo apt-key del 2048R/0F1B0520

# got error:  .rbenv/shims/heroku: No such file or directory
# ans..
rbenv rehash


sudo add-apt-repository "deb https://cli-assets.heroku.com/branches/stable/apt ./"
curl -L https://cli-assets.heroku.com/apt/release.key | sudo apt-key add -
#sudo apt-get update
sudo apt-get install -y heroku

rbenv rehash

sudo -u postgres bash -c "psql -c \"CREATE USER albe WITH PASSWORD 'albe';\""

sudo -u postgres createdb albe


# psql
# \q

sudo apt-get install -y libpq-dev


echo 'gem "pg"' >> Gemfile

# comment out gem 'sqlite3'

bundle

git ca heroku2

heroku login

heroku create  brail347a22

      # Logged in as dgleba@gmail.com
      # albe@pmdsdata4:/srv/share/test/brail347a21$       heroku create
      # Creating app... done, ? peaceful-plateau-37353
      # https://peaceful-plateau-37353.herokuapp.com/ | https://git.heroku.com/peaceful-plateau-37353.git
      # albe@pmdsdata4:/srv/share/test/brail347a21$


git config --list | grep heroku

      # albe@pmdsdata4:/srv/share/test/brail347a21$       git config --list | grep heroku
      # remote.heroku.url=https://git.heroku.com/peaceful-plateau-37353.git
      # remote.heroku.fetch=+refs/heads/*:refs/remotes/heroku/*


git push heroku master

  # no need. heroku does that...
  # heroku config:set DATABASE_PASSWORD=albe



bin/rails db:environment:set RAILS_ENV=production

heroku pg:reset DATABASE --confirm peaceful-plateau-37353

# not sure this can work....   heroku run rake db:reset
# or
heroku run rake db:migrate
heroku run rake db:seed
heroku run rake db:populate

heroku ps:scale web=1


git pull heroku master


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function blockcomment211() {
: <<'BLOCKCOMMENT'



# local......



bin/rails db:environment:set RAILS_ENV=development

sudo -u postgres bash -c "psql -c \"ALTER USER albe CREATEDB;\""

rake db:create RAILS_ENV=development
rake db:migrate RAILS_ENV=development
rake db:seed RAILS_ENV=development
rake db:populate RAILS_ENV=development


rake db:reset RAILS_ENV=development
rake db:populate RAILS_ENV=development


# _____________


bin/rails db:environment:set RAILS_ENV=test
#
rake db:drop RAILS_ENV=test
rake db:create RAILS_ENV=test
rake db:migrate RAILS_ENV=test
rake db:reset RAILS_ENV=test



BLOCKCOMMENT
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~













# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





# notes follow....











#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function blockcomment21() {
: <zz<'BLOCKCOMMENT'


brail347a22.herokuapp.com/

http://brail347a22.herokuapp.com/


https://coderwall.com/p/y5rtzq/created-a-heroku-app-but-i-want-to-change-the-name-now

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2017-07-11[Jul-Tue]21-57PM

https://stackoverflow.com/questions/34702786/problems-with-heroku-rake-dbreset


https://stackoverflow.com/questions/8162420/running-rake-dbdrop-dbcreate-dbmigrate-on-heroku-cedar-stack


heroku run rake db:schema:load




~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2017-07-07[Jul-Fri]14-34PM

albe@pmdsdata4:/srv/share/test/ruby-getting-started$ heroku create
Creating app... done, ? evening-stream-92463
https://evening-stream-92463.herokuapp.com/ | https://git.heroku.com/evening-stream-92463.git
albe@pmdsdata4:/srv/share/test/ruby-getting-started$ git push heroku master


albe@pmdsdata4:/srv/share/test/ruby-getting-started$ git config --list | grep heroku
remote.origin.url=https://github.com/heroku/ruby-getting-started.git
remote.heroku.url=https://git.heroku.com/evening-stream-92463.git
remote.heroku.fetch=+refs/heads/*:refs/remotes/heroku/*
albe@pmdsdata4:/srv/share/test/ruby-getting-started$



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2017-07-06[Jul-Thu]21-42PM

https://help.ubuntu.com/community/PostgreSQL


sudo apt-get update

sudo apt-get install snapd

sudo snap install heroku

heroku login


2017-07-07_Fri_14.18-PM

sudo apt-get update
sudo apt-get install postgresql postgresql-contrib postgresql-client-common 
# not .. postgres-xc-client


sudo -u postgres bash -c "psql -c \"CREATE USER albe WITH PASSWORD 'albe';\""

sudo -u postgres createdb albe

psql
\q

sudo apt-get install libpq-dev


echo 'gem "pg"' >> Gemfile

bundle




~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2017-07-06[Jul-Thu]22-31PM

# PostgreSQL. Versions 9.1 and up are supported.
#
# Install the pg driver:
#   gem install pg
# On OS X with Homebrew:
#   gem install pg -- --with-pg-config=/usr/local/bin/pg_config
# On OS X with MacPorts:
#   gem install pg -- --with-pg-config=/opt/local/lib/postgresql84/bin/pg_config
# On Windows:
#   gem install pg
#       Choose the win32 build.
#       Install PostgreSQL and put its /bin directory on your path.
#
# Configure Using Gemfile
# gem 'pg'
#
default: &default
  adapter: postgresql
  encoding: unicode
  # For details on connection pooling, see Rails configuration guide
  # http://guides.rubyonrails.org/configuring.html#database-pooling
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

development:
  <<: *default
  database: myapp_development

  # The specified database role being used to connect to postgres.
  # To create additional roles in postgres see `$ createuser --help`.
  # When left blank, postgres will use the default role. This is
  # the same name as the operating system user that initialized the database.
  #username: myapp

  # The password associated with the postgres role (username).
  #password:

  # Connect on a TCP socket. Omitted by default since the client uses a
  # domain socket that doesn't need configuration. Windows does not have
  # domain sockets, so uncomment these lines.
  #host: localhost

  # The TCP port the server listens on. Defaults to 5432.
  # If your server runs on a different port number, change accordingly.
  #port: 5432

  # Schema search path. The server defaults to $user,public
  #schema_search_path: myapp,sharedapp,public

  # Minimum log levels, in increasing order:
  #   debug5, debug4, debug3, debug2, debug1,
  #   log, notice, warning, error, fatal, and panic
  # Defaults to warning.
  #min_messages: notice

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  <<: *default
  database: myapp_test

# As with config/secrets.yml, you never want to store sensitive information,
# like your database password, in your source code. If your source code is
# ever seen by anyone, they now have access to your database.
#
# Instead, provide the password as a unix environment variable when you boot
# the app. Read http://guides.rubyonrails.org/configuring.html#configuring-a-database
# for a full rundown on how to provide these environment variables in a
# production deployment.
#
# On Heroku and other platform providers, you may have a full connection URL
# available as an environment variable. For example:
#
#   DATABASE_URL="postgres://myuser:mypass@localhost/somedatabase"
#
# You can use this database configuration with:
#
#   production:
#     url: <%= ENV['DATABASE_URL'] %>
#
production:
  <<: *default
  database: myapp_production
  username: myapp
  password: <%= ENV['MYAPP_DATABASE_PASSWORD'] %>
  

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2017-07-06[Jul-Thu]22-38PM

# config/environments/production.rb
config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
if ENV["RAILS_LOG_TO_STDOUT"].present?
  logger           = ActiveSupport::Logger.new(STDOUT)
  logger.formatter = config.log_formatter
  config.logger = ActiveSupport::TaggedLogging.new(logger)
end



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2017-07-06[Jul-Thu]22-50PM

git ca heroku1

heroku create

git config --list | grep heroku

_____________ 



This version of the API has been Sunset. Please see https://devcenter.heroku.com/changelog-items/1147 for more information.

_____________ 


https://askubuntu.com/questions/893627/heroku-error-when-installing/896461


sudo add-apt-repository "deb https://cli-assets.heroku.com/branches/stable/apt ./"
curl -L https://cli-assets.heroku.com/apt/release.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install heroku



 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

BLOCKCOMMENT
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

