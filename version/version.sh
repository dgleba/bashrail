#!/usr/bin/env bash

function git_func {
    GITBIN=git
    if [[ $1 == "commit" ]] && [[ "$#" -ne 1 ]]
    then
        GIT_VERSION=`$GITBIN rev-list HEAD | wc -l`
        let GIT_VERSION+=1
        perl -e "s/(\d+\.\d+\.)\d+/\${1}$GIT_VERSION/;" -pi.save config.json
        rm config.json.save
    fi

    GITCMD="$GITBIN "
    for var in "$@"
    do
        GITCMD="$GITCMD \"$var\""
    done
    eval $GITCMD
    
    # http://stackoverflow.com/questions/6920548/is-it-possible-to-add-a-version-number-using-git-github
    #  alias git='git_func'
}


function gitver {
  GITBIN=git
  folder=version
  if [[ 1 == 1 ]] 
  then
    if [ ! -f $folder/version-a.txt ] ; then
      echo '"version": "0.1.01"' > $folder/version-a.txt
    fi

    GIT_VERSION=`$GITBIN rev-list HEAD | wc -l`
    let GIT_VERSION+=1
    perl -e "s/(\d+\.\d+\.)\d+/\${1}$GIT_VERSION/;" -pi.save $folder/version-a.txt
    #rm $folder/version-a.txt.save

    echo "Version: $GIT_VERSION" > $folder/version-n.txt
  fi
}


function ver_dn {

if [ ! -f version_date.txt ] ; then
  echo 'Version, 2016, 21' > version_date.txt
fi

IFS=,
while read ver DATE1 NUM
do
echo $ver, $(date +"%Y.%m.%d_%H.%M.%S"), $((NUM+1)) > tmpversiondatenumfile
done < version_date.txt 
mv tmpversiondatenumfile version_date.txt
}



set -vx

gitver
ver_dn

