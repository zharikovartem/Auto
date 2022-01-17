#!/bin/bash
clear
# устанавливаем настройки git для Auto:
git config user.name "zharikovartem"
git config user.email 7383125@mail.ru

echo -e "\e[30;48;5;82m Устанавливаются главные программы: \e[0;49m";
echo ''
sudo apt install jq
bash other/init/install.sh  make
bash other/init/install.sh  code
# заменить файл
bash other/init/install.sh  docker-ce
# https://stackoverflow.com/questions/41195952/updating-nodejs-on-ubuntu-16-04
# bash other/init/install.sh nodejs
# bash other/init/install.sh npm
# sudo apt install npm -y
# bash other/init/install.sh composer
bash other/init/install.sh dbeaver-ce
bash other/init/install.sh postman


# !!!!!!!!!!!!
# npm install --global yarn




echo -e "\e[30;48;5;82m Мессенджеры: \e[0;49m";
echo ''
bash other/init/install.sh  telegram-desktop
bash other/init/install.sh  slack

read -p "add global MAKE? y/n   >> " isMake
if [[ ${isMake} == "y" ]]
then
    bash bash/init/constant.sh
fi

read -p "Composer install? y/n   >> " isComposer
if [[ ${isComposer} == "y" ]]
then
    bash other/init/soft/composer/install.sh
fi

read -p "Установить библиотеки? y/n   >> " isLib
if [[ ${isLib} == "y" ]]
then
    echo -e "\e[30;48;5;82m Устанавливаются Библиотеки: \e[0;49m";
    sudo apt update
    sudo apt install -y build-essential
    sudo apt install php php-pear php-dev libmcrypt-dev -y
    sudo apt install php-curl php-memcached php-mysql php-pgsql php-gd php-imagick php-intl php-xml php-zip php-mbstring -y
    sudo apt-get --purge remove php-common -y
    sudo apt-get install php-common php-mysql php-cli -y
fi

sudo apt update