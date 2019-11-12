
status. works.


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

production..

docker-compose  -f docker-compose.prod.yml build

shoud not be needed. done in dev... docker-compose -f docker-compose.prod.yml run --rm webp bundle install 
 
make prup

docker-compose  -f docker-compose.prod.yml up


docker-compose  -f docker-compose.prod.yml down
 
docker-compose -f docker-compose.prod.yml run --rm web469 bundle exec  rails assets:precompile RAILS_ENV=production


mkdir -p shared/log ; mkdir -p shared/pids ; mkdir -p shared/sockets
touch shared/log/.keep; touch shared/pids/.keep; touch shared/sockets/.keep


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



2019-06-16

https://anonoz.github.io/tech/2019/03/10/rails-docker-compose-yml.html



Clean up...


  careful..   docker volume rm -f $( docker volume ls |    grep bundle_cache       | awk '{print $2}' )
  
  careful.. dkd -v
  dkd
  docker rm -f $(docker ps -a |    grep rail469         | awk '{print $1}')
  docker rm -f $(docker ps -a |    grep rail467xxv         | awk '{print $1}')
  docker rm -f $(docker ps -a |    grep suspic       | awk '{print $1}')
	make clean
  docker images | grep prod469_ | awk '{print $1 ":" $2}' | xargs docker rmi 
  # docker images | grep prod467_ | awk '{print $1 ":" $2}' | xargs docker rmi 
  # docker images | grep rail467_ | awk '{print $1 ":" $2}' | xargs docker rmi 
	
targ=brail347a22_webp
targ=brail347a22_web
targ=prod469_webp
targ=prod469
  docker rm -f $(docker ps -a |    grep $targ         | awk '{print $1}')
  docker images | grep $targ | awk '{print $1 ":" $2}' | xargs docker rmi -f
	
	
docker-compose build


echo -e "source 'https://rubygems.org' \ngem 'rails', '~>5'"> Gemfile


docker-compose run --rm web bundle install 
 
  
noneed... 
 docker-compose run --rm web bundle install -j8
 


docker-compose run --rm web  rails new .  --no-deps

# don't use  force??  docker-compose run --rm web  rails new . --force --no-deps


4.
 
docker-compose  run --rm web bundle exec  rails g scaffold ReportName name  active_status:integer sort_order:integer  --no-migration \
 -f
 
docker-compose  run  --rm  dev bundle exec  rails g scaffold RptElist  email report_name:references when active_status:integer \
  sort_order:integer 
    --no-migration 
  -f 



docker-compose run --rm web bundle exec  rails g scaffold ReportName name clock active_status:integer sort_order:integer 

docker-compose run --rm web bundle exec  rails destroy  scaffold ReportName 

docker-compose run --rm web bundle exec  rails destroy  scaffold RptElist 

docker-compose run --rm web bundle exec  rails destroy  scaffold MorningMeeting 


Drop db..
# careful.. docker-compose run --rm web bundle exec  rails db:drop RAILS_ENV=development
# careful.. docker-compose run --rm web bundle exec  rails db:create RAILS_ENV=development
# careful.. docker-compose run --rm web bundle exec  rails db:migrate:redo RAILS_ENV=development






migrate..

docker-compose run --rm web bundle exec rails db:migrate RAILS_ENV=development


docker-compose run --rm web bundle exec rails db:seed



dkup


 docker-compose run --rm web    bash -c "rm -f tmp/pids/server.pid "


 docker-compose run --rm web    bash -c "rm -f tmp/pids/server.pid "


sudo chown -R $USER:$USER .



prod 467 error


web_1  | /usr/local/bundle/gems/activesupport-5.0.7.2/lib/active_support/dependencies.rb:287:in `load': 
/app/spec/factories/rpt_elists.rb:5: syntax error, unexpected when, expecting end (SyntaxError)
web_1  |     when "MyString"
web_1  |     ^~~~
web_1  | /app/spec/factories/rpt_elists.rb:9: syntax error, unexpected end, expecting end-of-input


gem 'rspec-rails', '~> 3.5'

docker-compose run --rm web bundle update

docker-compose run --rm web bundle update --source rspec-rails



docker-compose run --rm web bundle exec rails generate autocomplete:install


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

select 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~













other stuff..












~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




echo -e "gem 'tzinfo-data'">> Gemfile

worked. in suresh.
docker-compose run --rm web  rails new . --force --no-deps





docker-compose run --rm app bundle exec rails new . --force --no-deps 

docker-compose run --rm app  bundle install

docker-compose run --rm web  rails new . --force --no-deps 

docker-compose run app  rails new  --force --no-deps 

docker-compose build


no.. docker build -t r467 .

docker-compose run web 



worked. in suresh.
docker-compose run --rm web  rails new . --force --no-deps

docker-compose run --rm web bundle install -j8
