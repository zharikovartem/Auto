echo Какой фреймворк:
echo 1 - React
echo 2 - React Native
echo 3 - Next.js

read -p "Выбери фреймворк  > " framework

if [[ ${framework} == "1" ]]
then
    echo "React"

    read -p "введите имя проекта  > " projectName

    npx create-react-app ${projectName} --template typescript
    cd $projectName
    pwd

    # создаем gitignore
    rm -rf .gitignore
    touch .gitignore
    echo /Docker >> .gitignore

    # создаем start.sh
    rm -rf start.sh
    touch start.sh
    echo .start.sh >> .gitignore

    bash ~/Desktop/Auto/bash/new/front/isDocker.sh
fi