#!/bin/bash

oldDir=$(pwd)
cd ~/Desktop/Auto

pwd

if [[ ${1} == "" ]]
then
    make help

elif [[ ${1} == "serv" ]]
then
    clear
    pwd
    bash server/run.sh ${2}

elif [[ ${1} == "git" ]]
then
    bash ./bash/git/git.sh $oldDir

else
    make ${1} ${2}
fi

