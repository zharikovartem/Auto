#!/bin/bash

cd ~/Desktop/Auto

if [[ ${1} == "" ]]
then
    make help

elif [[ ${1} == "serv" ]]
then
    clear
    pwd
    bash server/run.sh ${2}

else
    make ${1} ${2}
fi

