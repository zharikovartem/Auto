#!/bin/bash
echo RUN INSTALL NEW PROJECT

read -p "Нужен ли нам фронт? y/n   > " isfront

if [[ ${isfront} == "y" ]]
then
    bash ~/Desktop/Auto/bash/new/front/front.sh isfront
fi

read -p "Нужен ли нам бэк? y/n   > " isbackend

if [[ ${isbackend} == "y" ]]
then
    bash ~/Desktop/Auto/bash/new/backend/backend.sh isfront
fi