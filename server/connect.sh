#!/bin/bash

ip=($(jq ".servers| .[${1}].ip" data/data.json))
# ip2=$(last -i | grep -Pom 1 '[0-9.]{7,15}')
ip2="$(grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' <<< "$ip")"
name=($(jq ".servers| .[${1}].name" data/data.json))
folder=($(jq ".servers| .[${1}].folder" data/data.json))

scripts=($(jq ".servers| .[${1}].scripts" data/data.json))
# echo "scripts=${scripts[@]}"

# count=($(jq '.servers | length' data/data.json))
# echo "count=${count}"



countScripts=($(jq ".servers| .[${1}].scripts  | length" data/data.json))
# scripts=($(jq ".scripts| .[].name" data/data.json))
echo "countScripts=${countScripts}"

comand=""
# choise directory:
name2="${name%\"}"
name2="${name2#\"}"
comand+="cd /var/www/${name2}/"


for (( i=0; i<${countScripts}; i++ ));
do
    script=($(jq ".servers| .[${1}].scripts | .[${i}]" data/data.json))
    script="${script%\"}"
    script="${script#\"}"
    echo "script_${i}=${script}"
    comand+="; ./$script"
done

echo ''
echo $comand
comand="\"${comand}\""
echo $comand
echo ''

echo -e "\e[30;48;5;82m ssh root@${ip2} \e[0;49m"
echo -e "\e[30;48;5;82m 1: \e[0;49m"

ssh root@$ip2 COMAND=$comand 'bash -s' <<'ENDSSH'
    # commands to run on remote host
    pwd
    echo "Comand string: \"${COMAND}\""
    
    IFS=';' read -ra ADDR <<< "$COMAND"
    for i in "${ADDR[@]}"; do
        # process "$i"
        ${i}
    done

    # cd /var/www/befree/; ./pull.sh
ENDSSH

# echo -e "\e[30;48;5;82m 2: \e[0;49m"

# ssh root@$ip2 NAME=$name FOLDER=$folder 'bash -s' <<'ENDSSH'
#     # commands to run on remote host
#     cd /var/www/${NAME}/
#     pwd
#     ./pull.sh
# ENDSSH



# ssh root@164.90.153.196