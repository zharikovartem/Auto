#!/bin/bash
clear
echo "oldDir = ${1}"
echo -e "\e[30;48;5;82m Comand list: \e[0;49m";

echo '1) add user to project (local)'

echo ''
read -p "Укажите номер команды: >>" comandNum

if [[ ${comandNum} == "1" ]]
then
    echo -e "\e[30;48;5;82m Users list: \e[0;49m";

    count=($(jq '.users | length' data/gitUsers.json))
    for (( i=0; i<${count}; i++ ));
    do
        userName=($(jq ".users| .[${i}].userName" data/gitUsers.json))
        email=($(jq ".users| .[${i}].email" data/gitUsers.json))
        echo "${i}) ${userName} / ${email}"
    done

    read -p "Укажите номер user: >>" userNum

    userName=($(jq ".users| .[${userNum}].userName" data/gitUsers.json))
    email=($(jq ".users| .[${userNum}].email" data/gitUsers.json))
    password=($(jq ".users| .[${userNum}].password" data/gitUsers.json))

    cd ${1}

    git config user.name ${userName}
    git config user.email $email

    echo -e "\e[30;48;5;82m ${userName} \e[0;49m";
    echo -e "\e[30;48;5;82m ${password} \e[0;49m";

    git config credential.helper cache


    pwd
    # cd ~/Desktop/Auto
    # pwd
fi