echo RUN INSTALL NEW PROJECT

read -p "Нужен ли нам фронт? y/n   > " isfront

if [[ ${isfront} == "y" ]]
then
    # touch package.json
    # touch package-lock.json

    bash ~/Desktop/Auto/bash/new/front/front.sh isfront
fi