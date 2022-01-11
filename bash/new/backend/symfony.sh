#!/bin/bash

let projectName="front"

if [[ ${1} == "1" ]]
then
    read -p "введите имя проекта (front)  > " projectName
    if [[ ${projectName} == "" ]]
    then
        projectName="front"
        echo "!!!projectName ${projectName}"
    fi
else 
    read -p "введите имя проекта  > " projectName
fi

composer create-project symfony/website-skeleton ${projectName}