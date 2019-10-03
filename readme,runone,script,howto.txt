
Paste this into the commandline to run one script or some commands again later..


---


cat /tmp/"_brvar1202_${USER}".txt

# read settings from last run...

read  appn  sfil  sfil2  mpwd  parm0</tmp/"_brvar1202_${USER}".txt
echo $appn $sfil $sfil2 $mpwd $parm0


# 

# cd into your project

# $sfil2/script.sh

chmod +x $sfil2/jqueryautocomplete.sh
dos2unix $sfil2/jqueryautocomplete.sh
 
# $sfil2/jqueryautocomplete.sh

  source $sfil2/bootstrap1.sh

