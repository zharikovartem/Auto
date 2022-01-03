#!/bin/bash

echo Какой фреймворк:
echo 1 - Laravel
echo 2 - Symfony
echo 3 - YII2 

read -p "Выбери фреймворк  > " framework

if [[ ${framework} == "1" ]]
then
    echo "Laravel"
fi

if [[ ${framework} == "2" ]]
then
    echo "Symfony"
fi

if [[ ${framework} == "3" ]]
then
    echo "YII2"
fi