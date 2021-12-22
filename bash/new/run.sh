echo RUN INSTALL NEW PROJECT

read -p "Нужен ли нам фронт? y/n   > " isfront

if [[ ${isfront} == "y" ]]
then
    bash ./bash/new/front.sh isfront
fi