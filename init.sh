#!/bin/bash

git config user.name "zharikovartem"
git config user.email 7383125@mail.ru

echo -e "\e[30;48;5;82m Устанавливаются главные программы: \e[0;49m";
echo ''
bash other/init/install.sh  make
bash other/init/install.sh  code
bash other/init/install.sh  docker


echo -e "\e[30;48;5;82m Мессенджеры: \e[0;49m";
echo ''
bash other/init/install.sh  telegram-desktop