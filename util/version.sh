#!/usr/bin/env bash

folder=version
GITBIN=git

function ver_dn {

GITBIN=git
GIT_VERSION=`$GITBIN rev-list HEAD | wc -l`
let GIT_VERSION+=1
pwd

# file 1

if [ ! -f version.txt ] ; then
  echo 'Version:   Date  IncrementingNumber  CountCommits, 2016, 22, 1' > version.txt
fi

IFS=,
while read ver DATE1  NUM gver
do
  echo $ver,  $(date +"%Y.%m.%d_%H.%M.%S"), $((NUM+1)), $GIT_VERSION > tmpversiondatenumfile
done < version.txt

mv    tmpversiondatenumfile version.txt


# file 2

echo -en ' ~~~~~~~~~~~~~~~ Careful, this may be missing one version, but may hint this project history. ~~~~~~~~~~~~~~~~~~\n\n' > version-last10.txt
git log  -n 10 >> version-last10.txt


# file 3

# all version history summary..
file3='version-log.txt'
echo -en '\n\n~~~~~~~~~~~~~~~ Careful, this may be missing one version, but may hint this project history. ~~~~~~~~~~~~~~~~~~\n\n' >> $file3
git log  -n 1 >> $file3
echo "---"   >> $file3
git remote show origin>> $file3

# shorten the file by deleting some lines at the beginning of the file..
numlines=$(cat $file3 | wc -l )
#echo $numlines
if [ $numlines -gt 999 ]; then
  #echo 'morethan 2500';
  # delete first 41 lines..
  sed -i  1,41d $vfile1
else
  echo 'less';
fi

}


set -vx


ver_dn
