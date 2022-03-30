#!/bin/bash
clear
checker=$1

echo "checker:\"${checker}\""

# if [[ $checker=="" ]]
# then
#     echo "bash ./getRedmine.sh"
#     # bash ./getRedmine.sh "index"
# fi

# if [[ $checker!="" ]]
if [ -z "$checker" ]
then
    echo "bash ./getRedmine.sh"
    bash ./getRedmine.sh "index"
else
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    printf ${checker}
    echo 
fi

