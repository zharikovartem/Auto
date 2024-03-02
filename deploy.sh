#!/bin/bash
# clear; bash deploy.sh
# 2

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
git checkout $envType
git merge $BACKUP_BRANCH
git checkout $BACKUP_BRANCH
git add .
git commit -m "$COMMIT_NAME"
git push
git checkout $envType
# ?Возвращаем изменения
git stash pop
git add .
git commit -m "$COMMIT_NAME"
git push




# #######################################
