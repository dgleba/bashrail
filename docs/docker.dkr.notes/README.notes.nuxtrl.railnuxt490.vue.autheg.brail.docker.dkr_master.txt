

Status: works.  

autheg-backend works with autheg-frontend. 
and works with brail484b53 backend as well. 



Summary: good rails docker example to learn the gemfile.lock problem.

  can login and log out..

  shows examples table on index.vue.


-----

now..

albe@pmdsdata7:/srv/file/test/nuxtrl/railnuxt490$ git lds
7f926bf\ 2019-10-21 (HEAD -> master, origin/master, origin/HEAD)\ 1021\ [David Glebagit]
fb72905\ 2019-10-18\ update.notes\ [David Glebagit]

albe@pmdsdata7:/srv/file/test/nuxtrl/railnuxt490$ git r
origin  https://github.com/dgleba/railnuxt490.git (fetch)
origin  https://github.com/dgleba/railnuxt490.git (push)


-----

was..
sftp://10.4.1.228/srv/file/test/nuxtrl/autheg

2019-10-18_Fri_12.03-PM


--


the gemfile.lock docker problem..

yes.. https://stackoverflow.com/questions/37927978/how-do-i-update-gemfile-lock-on-my-docker-host

no.. https://nickjanetakis.com/blog/dealing-with-lock-files-when-using-ruby-node-and-elixir-with-docker





# Interesting bundle behavior.

  This will put the bundled packages inside the rails project. This may desirable if wanting to move all files to another
  server..
    RUN bundle install -j3 --path vendor/bundle




--

https://github.com/fishpercolator/autheg

https://medium.com/@fishpercolator/how-to-separate-frontend-backend-with-rails-api-nuxt-js-and-devise-jwt-cf7dd9da9d16




--

grep -rLZE '.{300}' . | xargs -r0 grep -i --color cors



docker-compose build


no..
docker-compose run -u root backend bundle

docker-compose run frontend yarn


dc run frontend /bin/bash

dc run backend /bin/bash


cd build


_____________

error.

Step 3/10 : RUN adduser frontend --uid $UID --disabled-password --gecos ""
 ---> Running in 7809bc9ffded
adduser: The UID 1000 is already in use.
ERROR: Service 'frontend' failed to build: The command '/bin/sh -c adduser frontend --uid $UID --disabled-password --gecos ""' returned a non-zero code: 1
albe@pmdsdata7:/srv/file/test/nuxtrl/autheg$ 

I changed to user 1000, OK.

_____________

I changed rails to root user.

_____________



  docker images | grep "autheg_b" | awk '{print $1 ":" $2}' | xargs docker rmi
  
 
docker-compose build

touch autheg-backend/Gemfile.lock
#try this first..
  docker-compose run backend bundle
#then if necessary..
  docker-compose build backend


# no need..
docker-compose run --rm backend bundle exec bundle install


docker-compose run --rm backend bundle exec rails db:migrate
docker-compose run --rm backend bundle exec rails db:seed

 
docker-compose run --rm backend bundle exec rails db:migrate RAILS_ENV=development



  
  
  

----------------------------------------------------
Title:  .
-----------------------2019-10-18[Oct-Fri]11-21AM

didn't do this..

docker-compose run backend bundle exec rails g resource example name:string colour:string

no..
> rails db:migrate
> rails c
> > {"foo" => "green", "bar" => "red", "baz" => "purple"}.each {|n,c| Example.create!(name: n, colour: c)}
  
  
  
no..  
docker-compose run backend bash
> rails g resource example name:string colour:string
> rails db:migrate
> rails c
> > {"foo" => "green", "bar" => "red", "baz" => "purple"}.each {|n,c| Example.create!(name: n, colour: c)}
  

----------------------------------------------------
  
#no..
curl -i -H "Content-Type: application/json" \
      -X POST -D ./curldump -i\
      -d '{"user": {"email":"a@a","password":"123123"}}' \
      http://10.4.1.228:8080/api/users/sign_in.json
      
# yes..      
curl -i -H "Content-Type: application/json" \
      -X POST -D ./curldump -i\
      -d '{"user": {"email":"a@a","password":"123123"}}' \
      http://10.4.1.228:8080/api/users/sign_in
      

_____________

      
albe@pmdsdata7:/srv/file/test/nuxtrl/autheg$ curl -i -H "Content-Type: application/json" \
>       -X POST -D ./curldump -i\
>       -d '{"user": {"email":"a@a","password":"123123"}}' \
>       http://10.4.1.228:8080/api/users/sign_in
HTTP/1.1 200 OK
Location: /
Content-Type: application/json; charset=utf-8
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNTcxNDEyNzg0LCJleHAiOjE1NzE0MTYzODQsImp0aSI6IjI3MGFmODc1LTA4ZjEtNGQwZC1hM2U2LTMzN2NiZTU2Njg3YiJ9.cc4tyhuHBJ24CGgAMQRTfvIf9pJRrMmI93KM9GpkTmg
ETag: W/"c5f2b40871a5d9d42be3b71a57eae3b3"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e9f04b01-a8eb-419a-865a-30fec3109b0a
X-Runtime: 0.525804
Vary: Origin
Transfer-Encoding: chunked

{"token":"eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNTcxNDEyNzg0LCJleHAiOjE1NzE0MTYzODQsImp0aSI6IjI3MGFmODc1LTA4ZjEtNGQwZC1hM2U2LTMzN2NiZTU2Njg3YiJ9.cc4tyhuHBJ24CGgAMQRTfvIf9pJRrMmI93KM9GpkTmg"}albe@pmdsdata7:/srv/file/test/nuxtrl/autheg$
albe@pmdsdata7:/srv/file/test/nuxtrl/autheg$


_____________

4login?redirect=%2F:1 Access to XMLHttpRequest at 'http://10.4.1.228:8080/api/users/sign_in' from origin 'http://10.4.1.228:7000' has been blocked by CORS policy: Response to preflight request doesn't pass access control check: No 'Access-Control-Allow-Origin' header is present on the requested resource.

  
nuxt Access to XMLHttpRequest at sign_in' from origin  has been blocked by CORS policy

Response to preflight request doesn't pass access control check: No 'Access-Control-Allow-Origin' header is present on the requested resource.
  
  
grep -rLZE '.{300}' . | xargs -r0 grep -i --color cors


_____________


not needed I don't think....

https://nuxtjs.org/faq/http-proxy/

npm i @nuxtjs/proxy --save
or  
add to package.json



    "@nuxtjs/proxy": "^1.3"
    
    
    
_____________


dc build frontend


 modules: [
    "@nuxtjs/vuetify",
    "@nuxtjs/proxy",
    "@nuxtjs/axios",
    "@nuxtjs/auth"
  ],
  proxy: {
    target: "10.4.1.228:8080",
    prefix: "/api"
  },
  auth: {
    endpoints: {
      login: { url: "/users/sign_in" },
      logout: { url: "/users/sign_out", method: "delete" },
      user: { url: "/users/current" }
    }
  }
  
  

NuxtServerError
$axios is not available

_____________
  
  
docker-compose   exec backend /bin/bash -c ' rm -r vendor/bundle/ '
   
  
  
---

Access to XMLHttpRequest at 'http://10.4.1.228:8080/api/users/sign_in' from origin 'http://10.4.1.228:7000' has been blocked by CORS policy: Response to preflight request doesn't pass access control check: No 'Access-Control-Allow-Origin' header is present on the requested resource.

Set up rack cors..  
  
  https://github.com/cyu/rack-cors
  
-----

tried..

  modules: ["@nuxtjs/vuetify", "@nuxtjs/axios", "@nuxtjs/auth"],
  axios: {
    baseURL: "http://10.4.1.228:6035",
    proxyHeaders: false
  },


-----  
  
  


Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:3000', 'autheg.herokuapp.com', '10.4.1.228', '*'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end

_____________



----------------------------------------------------
Title:  .
-----------------------2019-10-18[Oct-Fri]19-43PM

works..


dkd -v --rmi local
make clean

dc build

docker-compose run frontend yarn


touch autheg-backend/Gemfile.lock
#try this first..
  docker-compose run backend bundle

dc up


docker-compose exec  backend bundle exec rails db:migrate RAILS_ENV=development
# or
docker-compose run --rm backend bundle exec rails db:migrate RAILS_ENV=development


docker-compose exec backend bundle exec rails db:seed
# or
docker-compose run --rm backend bundle exec rails db:seed


adminer
  http://10.4.1.228:6119/?server=db3309&username=root&db=dkrdb&select=users

nuxt app.. 
  http://10.4.1.228:7000/login
 
 
Tools..
 
dc run frontend /bin/bash

dc run backend /bin/bash





----------------------------------------------------


----------------------------------------------------
Title:  .
-----------------------2019-10-18[Oct-Fri]20-46PM

copy..


clone autheg to railnuxt490. copy my changes over top using rsync.

1.
fork.
   origin  https://github.com/fishpercolator/autheg.git (fetch)


2.

git clone https://github.com/dgleba/railnuxt490.git

3.
copy from
sftp://10.4.1.228/srv/file/test/nuxtrl/autheg

  cd /srv/file/test/nuxtrl/
     Source=autheg;    
     Dest=railnuxt490;
  rsync -av  --exclude '.git'  --exclude 'node_modules'  $Source/ $Dest/

4.
git cap


was.. origin  https://github.com/fishpercolator/autheg.git (fetch)



----------------------------------------------------



----------------------------------------------------
Title:  .
-----------------------2019-10-25[Oct-Fri]14-24PM


This is response from two different rails backends.

_____________

curl -i -H "Content-Type: application/json" \
      -X POST -D ./curldump -i\
      -d '{"user": {"email":"a@a","password":"123123"}}' \
      http://10.4.1.228:8080/api/users/sign_in
      
albe@pmdsdata7:~$ 
curl -i -H "Content-Type: application/json" \
>       -X POST -D ./curldump -i\
>       -d '{"user": {"email":"a@a","password":"123123"}}' \
>       http://10.4.1.228:8080/api/users/sign_in
HTTP/1.1 200 OK
Location: /
Content-Type: application/json; charset=utf-8
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNTcyMDI3MjY0LCJleHAiOjE1NzIwMzA4NjQsImp0aSI6ImQxOGQxMzk0LTYyM2ItNDYyOS1hNjBjLTliZGRiODM0ODBiMiJ9.OYQaesjm9PQoPbvQd0jeSvJVuzHnAexpZ3-LKJTawjA
ETag: W/"d3f1132ce2f4735ccac03af65c2a8f48"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 04a571cc-7a31-4090-b42a-6835e0192e80
X-Runtime: 1.258037
Vary: Origin
Transfer-Encoding: chunked

{"token":"eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNTcyMDI3MjY0LCJleHAiOjE1NzIwMzA4NjQsImp0aSI6ImQxOGQxMzk0LTYyM2ItNDYyOS1hNjBjLTliZGRiODM0ODBiMiJ9.OYQaesjm9PQoPbvQd0jeSvJVuzHnAexpZ3-LKJTawjA"}

albe@pmdsdata7:~$

_____________

      
curl -i -H "Content-Type: application/json" \
      -X POST -D ./curldump -i\
      -d '{"user": {"email":"a","password":"a"}}' \
      http://10.4.1.228:3001/users/sign_in.json
            
albe@pmdsdata7:~$ curl -i -H "Content-Type: application/json" \
>       -X POST -D ./curldump -i\
>       -d '{"user": {"email":"a","password":"a"}}' \
>       http://10.4.1.228:3001/users/sign_in.json
HTTP/1.1 200 OK
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Permitted-Cross-Domain-Policies: none
Referrer-Policy: strict-origin-when-cross-origin
Content-Type: application/json; charset=utf-8
ETag: W/"862f54690147f5b530aa5c529b23a727"
Cache-Control: max-age=0, private, must-revalidate
Set-Cookie: _brail484b53_session=EevIF1zglMOIH6pzmDXeo%2FMJHGFzv3T3xMVeN98cO4fvuvWoQSYSeBli12BVcSbwOMsc7%2BtHJ5rbG4xIuE3NgPhKUmfRMsj3KshzTPQ7wq4E%2FzonN%2FKY83kZCi7SwvNSnG4M0d9ceA5jBraEofDd74wtcFG0k8UkSnfr3FvFpXlI9cb4YHcc3cb%2BRSSJON6hQ3%2ByWT%2B3B9CDkI2m8o8A%2BUletSa1wUpB--lkd617BJsdEynvLY--4SJKb7EiJXScDyh29dd0aQ%3D%3D; path=/; HttpOnly
X-Request-Id: 81a5f5d1-73db-4ef6-a3e2-bda36761875f
X-Runtime: 0.265291
Vary: Origin
Transfer-Encoding: chunked

{"user":"a","token":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NzIwOTI0Nzl9.BJhxZENuNBPBYmGbTEwHIJRqbSCwhZ4h9QFqxElfC6c"}
albe@pmdsdata7:~$
albe@pmdsdata7:~$
            


----------------------------------------------------

----------------------------------------------------
Title:  .
-----------------------2019-10-25[Oct-Fri]16-15PM


rails generate scaffold User2 email:string encrypted_password:string reset_password_token:string reset_password_sent_at:datetime remember_created_at:datetime confirmation_token:string confirmed_at:datetime confirmation_sent_at:datetime unconfirmed_email:string failed_attempts:integer unlock_token:string locked_at:datetime name:string role:references sign_in_count:integer current_sign_in_at:datetime last_sign_in_at:datetime current_sign_in_ip:string last_sign_in_ip:string --no-migration -f

_____________

class ViewOnlineValue < ActiveRecord::Base
  # we can specify prefix, no need when using with 'dbo.' 
  self.table_name_prefix = 'dbo.' 
  # specify table name if it breaks Rails conventions
  self.table_name  = 'viewOnlineValues'

_____________



http://10.4.1.228:3001/users/current.json

NoMethodError in User2s#show
Showing /srv/file/test/nuxtrl/railnuxt490/brail484b53/app/views/user2s/_user2.json.jbuilder where line #1 raised:

undefined method `id' for nil:NilClass
Extracted source (around line #1):
1
2
              
json.extract! user2, :id, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :failed_attempts, :unlock_token, :locked_at, :name, :role_id, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :created_at, :updated_at
json.url user2_url(user2, format: :json)

Trace of template inclusion: app/views/user2s/show.json.jbuilder

Rails.root: /srv/file/test/nuxtrl/railnuxt490/brail484b53

Application Trace | Framework Trace | Full Trace
app/views/user2s/_user2.json.jbuilder:1:in `_app_views_user_s__user__json_jbuilder___3029431862227071318_47085588366500'
app/views/user2s/show.json.jbuilder:1:in `_app_views_user_s_show_json_jbuilder__3497432708681219881_47085588299820'
Request
Parameters:

{"format"=>"json"}
Toggle session dump
Toggle env dump
Response


_____________


albe@pmdsdata7:/srv/file/test/nuxtrl/railnuxt490/brail484b53$ git s
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   app/controllers/users/sessions_controller.rb        -- added show
        modified:   config/routes.rb                                    -- edited
        modified:   db/development.sqlite3
        modified:   db/migrate/40170101010105_add_trackable_to_devise.rb   -- changed inet to string
        modified:   db/schema.rb

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        app/assets/javascripts/user2s.coffee
        app/assets/stylesheets/user2s.scss
        app/controllers/user2s_controller.rb
        app/helpers/user2s_helper.rb
        app/models/user2.rb                                     - add table name.
        app/views/user2s/
        test/controllers/user2s_controller_test.rb
        test/fixtures/user2s.yml
        test/models/user2_test.rb
        test/system/user2s_test.rb

        


----------------------------------------------------
 

----------------------------------------------------
Title:  .
-----------------------2019-10-25[Oct-Fri]16-39PM

<input tabindex=​"0" aria-label=​"Password" type=​"password" value autocomplete=​"off" style=​"background-image:​ url("data:​image/​png;​base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAASCAYAAABSO15qAAAAAXNSR0IArs4c6QAAAYJJREFUOBGVVLuKwkAUPRFRY2GlhRKDVRpBMFgJgRQ2C37HCvmCdOpnuE0qWzvZBf8hTbC2SLAKqQQfTXbumAy6xE0cmMx9nHNm5t4h0nK5/​IjjeMVmFwWGJEk+g30uFosfgpfeIRMh2eiLbBokUGjnO/​z+feSUHhN5dr1eh6ZpT7C3BHq9HiaTSbZArVYTiWq1ClYs4T/​mRDAxyrROp1Pouo71eo0oimBZFo7HIxzHecr9JZP/​1hWyBKT5fB5Tgo55uVw4hq5wvV6z8CLGrhgwZyZOkJIJkUcmDGulwpYVrwEF8oZhGOj3+2g2m7xWh8OBi4gT/​CcwHo9hmiZ838d2u+WFTvGl5G2nfuY6Go04WZZlqKqK2+0mcCQwyxNpNBpQFAWVSgXD4RCDwUAIlFkXvpmnikhipN0h93w+43Q6YbPZwLZtdDodAS9UA8/​z0G63+QMjJhUwHS+7QH1OWoXdbocwDNFqtRAEAfb7PecT5qUAQ1Bt6EejsAnXddNNBZkwv/​3KjSrHve9/​AAAAAElFTkSuQmCC")​;​ background-repeat:​ no-repeat;​ background-attachment:​ scroll;​ background-size:​ 16px 18px;​ background-position:​ 98% 50%;​ cursor:​ auto;​">​
lpfulllib.js:1 [Deprecation] Synchronous XMLHttpRequest on the main thread is deprecated because of its detrimental effects to the end user's experience. For more help, check https://xhr.spec.whatwg.org/.
include_language @ lpfulllib.js:1
(anonymous) @ lpfulllib.js:1
VM167:1 GET http://10.4.1.228:3001/users/current.json 500 (Internal Server Error)
(


----------------------------------------------------
 