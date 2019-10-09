
# One liners and simple stuff may be here in this makefile. See sc folder for scripts.
# run scripts from project folder like this --  sc/cl


  
devup:  
	docker-compose  -f docker-compose.yml up 
   
devrup:  
	docker-compose  -f docker-compose.yml up --build  --force-recreate  

prupr:  
	docker-compose  -f docker-compose.prod.yml up --build  --force-recreate  
   
prup:  
	docker-compose  -f docker-compose.prod.yml up 
  
prd:  
	docker-compose  -f docker-compose.prod.yml up -d 

  
# having trouble setting env variable, but do I need it?  
perm2:  
	docker-compose run  dev \
	bash -c "chmod -R u+rws,g+rws,o+rs  /myapp "
   
   
mgr21:
	docker-compose run app bin/rails active_storage:install:migrations ; \
     	docker-compose run app rake db:migrate   

asc:
	docker-compose -f docker-compose.prod.yml run app bundle exec rake assets:precompile 
	
  
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
#  other/`less common` stuff...

 

te:
  # test accessing exported env variable.
	echo $${PWD##*/}
	#export PWDbasename=$${PWD##*/} ; echo $$PWDbasename



myrup:  
# db recreate build force
	docker-compose  up --build  --force-recreate  
 
myup:  
# db up
	docker-compose up 

phprup:  
	# docker-compose  -f php/docker-compose.yml stop \
	docker-compose  -f ../php392/docker-compose.yml up --build  --force-recreate  
   
phpup:  
	docker-compose  -f ../php392/docker-compose.yml up 
   
   
myl:
	docker-compose  -f mysql/docker-compose.yml logs -t -f

adup:  
	docker-compose  -f ../adminer392/docker-compose.yml up --build  --force-recreate  

myd:  
# dump
	docker-compose  -f mysql/docker-compose.yml run
  
mysh:
	docker-compose  -f mysql/docker-compose.yml exec dbm /bin/bash


myimpa:
	docker-compose  -f mysql/docker-compose.yml exec dbm /bin/bash /root/sh21.sh

mydumpa:
	docker-compose  -f mysql/docker-compose.yml exec dbm /bin/bash /root/all-individual-mysqldump.sh
 

mydumpb:
	docker-compose  -f mysql/docker-compose.yml exec dbm sh -c 'exec mysqldump  --force --opt --user=root -p"$$MYSQL_ROOT_PASSWORD" --databases dkrdbm dgnote130  \
    --complete-insert --quote-names  --allow-keywords  \
    --skip-add-drop-table --add-drop-database  --skip-lock-tables  --no-tablespaces --no-create-info --routines  \
    --events  > /home/db_mysqldump.sql '
 
 
 
# run system with umask test dockerfile
# I can't seem to get writable group permissions 2018-08-27_Mon_21.28-PM
#
umasktest:
	docker-compose  -f docker-compose.devtest.yml  run djangodev  django-admin.py startproject myproject .

  
# shell in django
#
djbash:
	docker-compose run djangodev /bin/bash

dps:   
	docker ps 
	docker ps -a
	docker images
	docker volume ls 

  
# clean docker containers 
#
clean:   
	docker ps 
	docker ps -a
	docker images
	docker volume ls 
	# remove this one.. 
	-docker rmi dkr382django2t_djangodev 
	-docker rmi dkr382r-django_djangodev
  # remove docker containers exited 
	-docker rm $$(docker ps -qa --no-trunc --filter "status=exited") 
	# remove tagged <none> 
	-docker rmi $$(docker images | grep "^<none>" | awk '{ print $3 }') 
  #volumes
	-docker volume rm $$(docker volume ls -qf dangling=true)


#
dkv: 
	docker --version
	docker-compose -version

  
perm:
# fix permissions. make them group writable so www-data group can manage the files. move, delete, etc..  
	docker-compose run djangodev sh sc/fixpermsh

    

  
recreatep:  
# recreate for production...
	docker-compose -f docker-compose.prod.yml up --build  --force-recreate  

rup:  
# dev recreate build force
	docker-compose  up --build  --force-recreate  
 
up:  
# dev recreate build force
	docker-compose  up 

prep:  
	docker/prep.sh  
  
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# https://github.com/docker/compose/issues/2033 docker compose command line run sh multiple commands in one line
# $ requires escaping with $, so, $$
# continuation card  \
# - dash in front of command ignores error. -rm -f *.o
