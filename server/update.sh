#!/bin/bash
clear

echo 'Выберите проект:'

# count=($(jq '.servers | length' data/projects.json))
count=($(jq '.servers | length' data/projects.json))

for (( i=0; i<${count}; i++ ));
do
    name=($(jq ".servers| .[${i}].name" data/projects.json))
    folder=($(jq ".servers| .[${i}].folder" data/projects.json))
    echo "${i}) $name - (${folder})"
done

read -p "Выбирете проект: >>" serverNumber

folder=($(jq ".servers| .[${serverNumber}].folder" data/projects.json))
folder2="${folder%\"}"
folder2="${folder2#\"}"
# echo ~
cd ~/$folder2
#cd ~/Desktop/Auto
pwd
npm run build
scp -r ./build/* root@135.181.90.157:/var/www/$name/html