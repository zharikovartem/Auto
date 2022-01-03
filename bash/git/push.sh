#!/bin/bash

pwd
git config --global user.name 'zharikovartem'
git config --global user.email '7383125@mail.ru'
git config -l


read -p "Укажите имя коммита:   > " commit
git add .
git commit -m "${commit}"
echo '7383125@mail.ru'
echo 'zharikovartem'
echo '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'
git push