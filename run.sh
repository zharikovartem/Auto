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

elif [[ ${1} == "r" ]]
then
    bash ./bash/runProject/runProject.sh $2

else
    make ${1} ${2}
fi

