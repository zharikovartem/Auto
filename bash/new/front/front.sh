echo Какой фреймворк:
echo 1 - React
echo 2 - React Native
echo 3 - Next.js

read -p "Выбери фреймворк  > " framework

if [[ ${framework} == "1" ]]
then
    echo "React"
    npx create-react-app app --template typescript
    bash ./bash/new/front/isDocker.sh
fi