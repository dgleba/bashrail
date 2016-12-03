#!/usr/bin/env bash


### settings .. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
# http://how-to.wikia.com/wiki/How_to_read_command_line_arguments_in_a_bash_script
# $0 is scripts name.
# http://stackoverflow.com/questions/6121091/get-file-directory-path-from-filepath
# http://stackoverflow.com/questions/1464253/global-environment-variables-in-a-shell-script 
  
if [ -z "$1" ] ; then
  echo ;
  echo 'Invalid paramters.'
  echo '  Usage: eg:  bashrail/1mk.sh project_name'
  echo '      bashrail contains the app creator scripts.'
  echo '      project_name is the name you want to give the generated rails app.'
  echo ;
else
  # set app name as first pramater on commandline
  export appn=$1
  #  get the command that invoked this..
  inscript=$0
  # extract the path from that command..
  bpath=$(dirname "${inscript}")
  # Location of creator files beside the new folder of the application..
  export sfil=$bpath  # ex: bashrail
  # Location modified for use after cd into the new app folder..
  export sfil2='../'$sfil  # ex: ../bashrail
fi 

