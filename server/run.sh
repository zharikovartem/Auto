#!/bin/bash

# echo ${1}

if [[ ${1} == "" ]]
then
    echo -e "\e[30;48;5;82m Список команд: \e[0;49m"
    echo '1) deploy/d'
    echo '2) create'
    echo "3) rebuild"
    echo "4) ci_cd"
    echo "5) settings/s"

    read -p "введите команду > " comand
    bash ./server/run.sh $comand
    

elif [[ ${1} == "deploy"  ]] || [ ${1} == "d" ]
then
    bash server/choiseServer.sh

elif [[ ${1} == "settings"  ]] || [ ${1} == "s" ]
then
    nano data/data.json

    git add data/data.json
    git commit -m "data update"
    git push  
else
    # make ${1}
    echo ${1}
fi

