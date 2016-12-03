

if [ -z "$1" ] ; then
  echo ;
  echo 'Invalid paramters.'
  echo 'Usage: eg: bashrail/1mk.sh project_name'
  echo '  bashrail contains the app creator scripts.'
  echo '  project_name is the name you want to give the generated rails app.'
  echo  ;
else
  # set app name as first pramater on commandline
  export appn=$1
  inscript=$0
  bpath=$(dirname "${inscript}")
# Location of creator files beside the new folder of the application..
  export sfil=$bpath
  # Location modified for use after cd into the new app folder..
  export sfil2='../'$sfil
fi 

export mpwd=$PWD
echo $mpwd

echo $sfil
echo $sfil2
echo $appn

   
  