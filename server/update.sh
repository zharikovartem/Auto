#!/bin/bash
clear

echo 'вывести список серверов:'
pwd

# count=($(jq '.servers | length' data/projects.json))
count=($(jq '.servers | length' data/projects.json))

for (( i=0; i<${count}; i++ ));
do
    # echo "i=${i}"
    name=($(jq ".servers| .[${i}].name" data/projects.json))
    folder=($(jq ".servers| .[${i}].folder" data/projects.json))
    echo "${i}) $name - (${folder})"
done