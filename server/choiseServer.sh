#!/bin/bash

count=($(jq '.servers | length' data/data.json))
for (( i=0; i<${count}; i++ ));
do
    # echo "i=${i}"
    ip=($(jq ".servers| .[${i}].ip" data/data.json))
    name=($(jq ".servers| .[${i}].name" data/data.json))
    echo "${i}) ${name} (${ip})"
done

read -p "Выбирете сервер: >>" serverNumber

# echo ${serverNumber}
bash server/connect.sh $serverNumber