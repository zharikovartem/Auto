#!/bin/bash
cd ~
cd /home/artem/projects

printf "Выбирете проект:\n"
select d in */; do test -n "$d" && break; echo ">>> Invalid Selection"; done
cd "$d" && pwd

read -p "Выбрать папку "$d" y/n   > " isfront

if [[ ${isfront} == "y" ]]
then
    echo 'continue'
    pwd
    bash ~/Desktop/Auto/bash/new/isMulti.sh
    # /home/artem/Desktop/Auto/bash/new/run.sh
fi

if [[ ${isfront} == "n" ]]
then
    printf "Выбирете проект:\n"
    select d in */; do test -n "$d" && break; echo ">>> Invalid Selection"; done
    cd "$d" && pwd

    read -p "Выбрать папку "$d" y/n   > " isfront
fi
