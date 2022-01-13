#!/bin/bash

dpkg -s $1 &> /dev/null  

if [ $? -ne 0 ]

    then
        echo -e "\e[30;48;5;82m \"${1}\" install started... \e[0;49m";
        bash other/init/soft/$1/install.sh
        echo -e "\e[30;48;5;82m \"${1}\" install finished \e[0;49m";
    else
        echo -e "\e[30;48;5;82m \"${1}\" was installed!!! \e[0;49m";
fi
echo ''