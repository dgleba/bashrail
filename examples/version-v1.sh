#!/usr/bin/env bash

function git_func {
    # I am not using this..
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
  
  # method 1
  if [[ 1 == 1 ]] 
  then
    if [ ! -f $folder/version-a.txt ] ; then
      mkdir -p $folder
      echo '"version": "0.1.01"' > $folder/version-a.txt
    fi

    GIT_VERSION=`$GITBIN rev-list HEAD | wc -l`
    let GIT_VERSION+=1
    
    # works, but it is turned off...
    # perl -e "s/(\d+\.\d+\.)\d+/\${1}$GIT_VERSION/;" -pi.save $folder/version-a.txt
    #rm $folder/version-a.txt.save

    # method 2
    # works, but it is turned off...
    # echo "Version(CountofCommits): $GIT_VERSION" > $folder/version-n.txt
  fi
}


function ver_dn {

folder=version
GIT_VERSION=`$GITBIN rev-list HEAD | wc -l`
let GIT_VERSION+=1
pwd

if [ ! -f $folder/version.txt ] ; then
  echo 'Version:   Date  IncrementingNumber  CountCommits, 2016, 16, 16' > $folder/version.txt
fi
    
IFS=,
while read ver DATE1 gver NUM
do
  echo $ver,  $(date +"%Y.%m.%d_%H.%M.%S"), $((NUM+1)), $GIT_VERSION > tmpversiondatenumfile
done < $folder/version.txt 

mv    tmpversiondatenumfile $folder/version.txt
# cp -f tmpversiondatenumfile $folder/version.txt
# rm -f tmpversiondatenumfile 
}


set -vx

# offline.. gitver
ver_dn
