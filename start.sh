#!/bin/bash

echo "pwd: ${1}"

code .
if [ -f ${1}/start.sh ]
then
    echo 'own start.sh'
    bash ${1}/start.sh
else
    echo 'default start.sh'
fi

