#!/bin/bash

dpkg -s $1 &> /dev/null  
# dpkg -s slack

if [ $? -ne 0 ]

    then
        if [ -e other/init/soft/$1/install.sh ]
        then
            echo -e "\e[30;48;5;82m \"${1}\" install started... \e[0;49m";
            bash other/init/soft/$1/install.sh
            echo -e "\e[30;48;5;82m \"${1}\" install finished \e[0;49m";
        else
            echo "sudo snap install ${1} --classic : "
            sudo snap install $1 --classic

        fi
    else
        echo -e "\e[30;48;5;82m \"${1}\" was installed!!! \e[0;49m";
fi
echo ''