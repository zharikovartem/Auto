#!/bin/bash
clear
# устанавливаем настройки git для Auto:
git config user.name "zharikovartem"
git config user.email "7383125@mail.ru"

read -p "Установить основные программы? y/n   >> " isMain
echo $isMain
if [[ $isMain == "y" ]]
then
    echo -e "\e[30;48;5;82m Устанавливаются главные программы: \e[0;49m";
    echo ''
    # sudo apt install jq # чтение из файла в shell
    bash other/init/install.sh  jq
    bash other/init/install.sh  make # утилита make
    bash other/init/install.sh  code # vsCode
    bash other/init/install.sh  docker-ce
    # https://stackoverflow.com/questions/41195952/updating-nodejs-on-ubuntu-16-04
    # bash other/init/install.sh nodejs
    # bash other/init/install.sh npm
    sudo apt install npm -y
    bash other/init/install.sh composer
    bash other/init/install.sh dbeaver-ce
    bash other/init/install.sh postman
    # !!!!!!!!!!!!
    # npm install --global yarn
fi

read -p "Установить мкссенджеры y/n   >> " isMeseengers
if [[ $isMeseengers == "y" ]]
then
    echo -e "\e[30;48;5;82m Мессенджеры: \e[0;49m";
    echo ''
    bash other/init/install.sh  telegram-desktop
    bash other/init/install.sh  slack
    bash other/init/install.sh  skype
    bash other/init/install.sh  viber
    sudo snap install whatsdesk
fi

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

# Shutter
read -p "Установить Shutter(Редактор скриншотов)? y/n   >> " isShutter
if [[ ${isShutter} == "y" ]]
then
    echo -e "\e[30;48;5;82m Устанавливется Shutter: \e[0;49m";
    sudo add-apt-repository -y ppa:linuxuprising/shutter
    sudo apt install shutter -y
    sudo apt-get install -y php8.2-cli php8.2-common php8.2-fpm php8.2-mysql php8.2-zip php8.2-gd php8.2-mbstring php8.2-curl php8.2-xml php8.2-bcmath
    sudo apt install php8.2 -y
fi

read -p "Установить PHP 8.2? y/n   >> " isPhp
if [[ ${isPhp} == "y" ]]
then
    echo -e "\e[30;48;5;82m Устанавливется PHP 8.2: \e[0;49m";
    
    LC_ALL=C.UTF-8 sudo add-apt-repository ppa:ondrej/php
    sudo apt install software-properties-common
    sudo apt install php8.2 libapache2-mod-php8.2 php8.2-mysql
    sudo apt install php8.2 php8.2-fpm php8.2-mysql

    sudo apt install php-pear
fi

read -p "Установить ssh ключи? y/n   >> " isSSH

# https://github.com/flozz/nautilus-terminal

# add ssh
# chmod 700 ~/.ssh
# chmod 600 ~/.ssh/id_rsa
# chmod 644 ~/.ssh/*.pub

# nautilus-terminal (терминал в папке)
sudo apt install python3-nautilus python3-psutil python3-pip libglib2.0-bin dconf-editor
sudo pip3 install nautilus-terminal
sudo nautilus-terminal --install-system
nautilus -q

# Настроить Chrome

# Добавить favorites
    # Вывести список добавленных:
    # gsettings get org.gnome.shell favorite-apps
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed s/.$//), 
    'google-chrome.desktop', 
    'code_code.desktop',
    'org.gnome.Nautilus.desktop', 
    'telegram-desktop_telegram-desktop.desktop', 
    'slack_slack.desktop', 'postman_postman.desktop', 
    'dbeaver-ce_dbeaver-ce.desktop', 
    'org.gnome.gedit.desktop', 
    'org.gnome.Terminal.desktop'
    ]"


# Запустить все программы нуждающиеся в ручных настройках
# Настроить DBeaver

