read -p "Нужен ли нам Docker? y/n   > " isfront

if [[ ${isfront} == "y" ]]
then
    echo 'НУЖЕН'
    # bash ./bash/new/front.sh isfront
fi