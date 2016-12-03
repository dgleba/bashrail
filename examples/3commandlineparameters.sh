#!/usr/bin/env bash


# usage: bashrail/examples/3commandlineparameters.sh  projname1 


   
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
export mpwd=$PWD


echo ;
echo $mpwd

echo $sfil
echo $sfil2
echo $appn
echo ;

   
  
echo $appn $sfil $sfil2 $mpwd $0 > /tmp/brvar1202.txt
  
read ap sf sf2 mp zero <  /tmp/brvar1202.txt

echo 'read from file..'
echo ;
echo $ap
echo $sf  $sf2
echo $mp
echo $zero 
echo ;


