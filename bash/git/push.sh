#!/bin/bash

bash bash/git/getInfo.sh

git config user.name "zharikovartem"
git config user.email 7383125@mail.ru
# git push https://<GITHUB_ACCESS_TOKEN>@github.com/<GITHUB_USERNAME>/<REPOSITORY_NAME>.git

read -p "Укажите имя коммита:   > " commit

if [[ ${commit} == "" ]]
then
    commit="no name"
fi

git add .
git commit -m "${commit}"
echo '7383125@mail.ru'
echo 'zharikovartem'
echo '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'
git push