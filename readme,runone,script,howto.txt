
Paste this into the commandline to run one script or some commands again later..


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# To run one script..


# read settings from last run...
#
read  appn  sfil  sfil2  mpwd  parm0</tmp/"_brvar1202_${USER}".txt
echo $appn $sfil $sfil2 $mpwd $parm0
#
# NOW cd into your project
cd /srv/share/test/brails/brail484b45
# run the script
  $sfil2/script.sh





###  ---  examples like..  -----




  $sfil2/activestorage.sh


  chmod +x $sfil2/jqueryautocomplete.sh
  dos2unix $sfil2/jqueryautocomplete.sh
  $sfil2/jqueryautocomplete.sh

  cd brail542c16
  $sfil2/bootstrap1.sh



Notes..

cat /tmp/"_brvar1202_${USER}".txt

albe@pmdsdata7:/srv/share/test/brails$ cat /tmp/"_brvar1202_${USER}".txt
brail484b45 bashrail ../bashrail /srv/share/test/brails bashrail/1mk.sh /home/albe
albe@pmdsdata7:/srv/share/test/brails$



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# To Run the whole thing normally...

cd /srv/web/2rail
  bashrail/1mk.sh brail484b27


# on pmdsdata7
#
cd /srv/file/test/brails
    appn='brail542c17'; 
       chmod +x bashrail/*.sh;  bashrail/1mk.sh $appn   2>&1 | tee -a ${appn}_sh_log$(date +"__%Y-%m-%d_%H.%M.%S").log


------
