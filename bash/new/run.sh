echo RUN INSTALL NEW PROJECT

# создаем gitignore
rm -rf .gitignore
touch .gitignore
echo /Docker >> .gitignore

# создаем start.sh
rm -rf start.sh
touch start.sh
echo .start.sh >> .gitignore


read -p "Нужен ли нам фронт? y/n   > " isfront

if [[ ${isfront} == "y" ]]
then
    # touch package.json
    # touch package-lock.json

    bash ./bash/new/front/front.sh isfront
fi