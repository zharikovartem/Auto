#!/bin/bash

cd ~/Desktop/Auto

echo ${0}

if [[ ${1} == "" ]]
then
    make help
else
    make ${1}
fi

