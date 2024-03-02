#!/bin/bash
# clear; bash deploy.sh
# version 3

read -p "Куде деплоим? (dev/prod):   > " envType

CURRENTDATE=`date +"%d_%m-(%k:%M)"`
BACKUP_BRANCH=backup_$envType
COMMIT_NAME=backup_to_${envType}_at_${CURRENTDATE}

# ##### ДЕЛАЕМ БЭКАП #####
# 1 Пулим все с удаленного репозитория
git pull
git fetch
# 2 Убираем все изменения
git stash
# 3 Переходим на целевую ветку и заливаем комит
git checkout $BACKUP_BRANCH
git merge $envType
git add .
git commit -m "$COMMIT_NAME"
git push
git checkout $envType
# ?Возвращаем изменения
git stash pop
# git add .
# git commit -m "$COMMIT_NAME"
# git push


read -p "Нужен ли git push? y/n:   > " isGitPush
if [[ ${isGitPush} == "y" ]]
then
    read -p "Укажите имя коммита:   > " commit
    if [[ ${commit} == "" ]]
    then
        commit="no name"
    fi
    git add .
    git commit -m "${commit}"
    git push
fi




# #######################################
