#!/bin/bash

if [[ ${1} == "" ]]
then
    echo -e "\e[30;48;5;82m Список команд: \e[0;49m"
    echo '1) deploy'
    echo '2) create'
    echo "3) rebuild"
    echo "4) ci_cd"
    echo "5) settings"

    read -p "введите номер команды > " comand
else
    # make ${1}
    echo ${1}
fi

