# bashrail

https://github.com/dgleba/bashrail

===

This is a set of bash and ruby scripts to create a rails app with features like 
 - bootstrap styling, 
 - select2 dropdown selects, 
 - devise login, 
 - cancancan role based access, 
 - kaminari pagination, 
 - ransack search, 
 - jwt token authentication 
 - database is populated with users, roles, and faked data,
 - etc...

The resulting generated application has both an html interface which you can consume with most modern browsers and mobile device browsers, and a restful api which responds to json requests.


 usage:

      bashrail/1mk.sh  project_name

 where project_name is the name you want to give your new rails app..

 example..
 - input..  /var/web/bashrail
 - output.. /var/web/project_name
 - run command above from /var/web

--


 edit 1mk.sh
  - There are some Mac OSX specific settings around line 77. Check that.
  - Check to see if you might just run it the way it is and give it a go.
  - when it is up and running, then maybe...
  - edit scaffolds.
  - try it out.
  - change the files to your liking, turn things on or off, then run it again with a new $appn / project_name on the commandline if you like.

  
--

 To run the resulting app...  
  - cd project_name  
  - rails s  
  - visit localhost:3000/  
  - login as:  
        - admin:   username = a   password = a  
        - regular: username = r   password = a  
            
  - to use the api, see bashrail/docsbr/ for tips on how to consume the restful json api    

===

Images:
  
![List View](docs/images/list-main.png?raw=true "List view")
 - - -

 ![Image](docs/images/login.png?raw=true "Image")
 - - -

![Image](docs/images/selec2-multiple-manytomany.png?raw=true "Image")
 - - -

![Image](docs/images/home.png?raw=true "Image")

    
    Check out more images in  docs/images  folder...
    
    
===

### Notes..




ref..
    Rail308

===


