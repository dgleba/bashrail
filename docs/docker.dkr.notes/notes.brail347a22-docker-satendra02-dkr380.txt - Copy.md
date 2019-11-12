# 2018-07-03_Tue_11.42-AM

# on .. pdata 10.4.1.224 pmdsdata3 ssh

# was cd /srv/share
cd /srv/dkr

git clone https://github.com/dgleba/brail347a22.git


# test outside of docker..

bin/rails db:migrate RAILS_ENV=development

# test outside of docker..
bin/rails s -b 0.0.0.0 -p 3004 -e development


bundle exec rails server -b 0.0.0.0


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



bin/rails db:migrate RAILS_ENV=production
RAILS_ENV=production bundle exec rake assets:precompile

# test outside of docker..
bin/rails s -b 0.0.0.0 -p 3004 -e production


# https://stackoverflow.com/questions/18700219/rails-4-assets-not-loading-in-production


# production.rb 
	# changed to true - see below - config.assets.compile = true
  # Do not fallback to assets pipeline if a precompiled asset is missed.
  # config.assets.compile = false
  # https://stackoverflow.com/questions/18700219/rails-4-assets-not-loading-in-production 2018-07-11 not sure what to do..
  config.assets.compile = true


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# run it in docker..

chmod +x docker/prep.sh
docker/prep.sh

docker-compose build

docker-compose run app rails r passw.rb
	albe@pmdsdata4:/srv/dkr/brail347a22$  docker-compose run app rails r passw.rb
	Starting brail347a22_db_1 ... done
	 Please specify a valid ruby command or the path of a script to run.
	Run 'bin/rails runner -h' for help.
	undefined local variable or method `passw' for main:Object

rails r passw.rb -e production
 
docker-compose up


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

more notes..

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



====================================================
Title:
2018-Jun-27_Wed_08:46:37 PM 
__________________

works, but no assets.

====================================================


2018-06-27_Wed_21.25-PM

err.

web_1  | 2018/06/28 01:18:13 [emerg] 1#1: invalid number of arguments in "root" directive in /etc/nginx/conf.d/default.conf:14
web_1  | nginx: [emerg] invalid number of arguments in "root" directive in /etc/nginx/conf.d/default.conf:14
brail347a22_web_1 exited with code 1

ans.

must edit $rails_root with actual path.

  see docker/start.sh
  

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2018-06-27[Jun-Wed]21-58PM

err.

web_1  | 2018/06/28 01:57:28 [emerg] 1#1: open() "/var/www/brail347a22/log/nginx.access.log" failed (2: No such file or directory)
web_1  | nginx: [emerg] open() "/var/www/brail347a22/log/nginx.access.log" failed (2: No such file or directory)
app_1  | Puma starting in single mode...
app_1  | * Version 3.11.4 (ruby 2.3.1-p112), codename: Love Song
app_1  | * Min threads: 5, max threads: 5
app_1  | * Environment: production
brail347a22_web_1 exited with code 1


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2018-09-17[Sep-Mon]12-09PM

        docker-compose  -f docker-compose.dev.yml up --build  --force-recreate
WARNING: Found orphan containers (brail347a22_db_1) for this project. If you removed or renamed this service in your compose file, you can run this command with the --remove-orphans flag to clean it up.


__________________


https://www.codementor.io/victor_hazbun/docker-for-rails-development-juklgqo36



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2018-09-17[Sep-Mon]14-10PM

 [RailsAdmin] Could not load model JwtWrapper, assuming model is non existing. (uninitialized constant JwtWrapper
app_1  | Did you mean?  JWTWrapper)



 RailsAdmin Could not load model JwtWrapper, assuming model is non existing. uninitialized constant JwtWrapper Did you mean?  JWTWrapper
 RailsAdmin   uninitialized constant JwtWrapper Did you mean?  JWTWrapper


 
https://gist.github.com/goncalvesjoao/5e5131954a12065ac4c601ecf1b827fe
 
 
__________________


albe@pmdsdata4:/srv/dkr/brail347a22$ grep -ri jwtwrap

config/initializers/core/extensions/devise/strategies/json_web_token.rb:        JWTWrapper.decode(token) rescue nil

app/controllers/users/sessions_controller.rb:    token = JWTWrapper.encode({ user_id: current_user.id })

app/helpers/jwt_wrapper.rb:module JWTWrapper

app/views/home/index.html.erb:  curl -i -X  GET --header 'Authorization: Bearer <%= JWTWrapper.encode({ user_id: current_user.id }) %>' 'http://localhost:3001/products.json'

albe@pmdsdata4:/srv/dkr/brail347a22$
 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  