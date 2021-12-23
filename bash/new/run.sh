echo RUN INSTALL NEW PROJECT

touch .gitignore
echo .Docker >> .gitignore

read -p "Нужен ли нам фронт? y/n   > " isfront

if [[ ${isfront} == "y" ]]
then
    bash ./bash/new/front/front.sh isfront
fi