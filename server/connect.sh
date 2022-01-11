#!/bin/bash

echo ${1}

ip=($(jq ".servers| .[${1}].ip" data/data.json))
# ip2=$(last -i | grep -Pom 1 '[0-9.]{7,15}')
ip2="$(grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' <<< "$ip")"
name=($(jq ".servers| .[${1}].name" data/data.json))
folder=($(jq ".servers| .[${1}].name" data/data.json))

# ssh root@$ip2

ssh root@$ip2 NAME=$name FOLDER=$folder 'bash -s' <<'ENDSSH'
    # commands to run on remote host
    cd /var/www/${NAME}/
    pwd
    ./pull.sh
ENDSSH

echo $ip2

# ssh root@164.90.153.196