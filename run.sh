#!/bin/bash

cd ~/Desktop/Auto

if [[ ${1} == "" ]]
then
    make help
else
    make ${1}
fi

