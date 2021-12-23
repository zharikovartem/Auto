read -p "Нужен ли нам Docker? y/n   > " isDocker

if [[ ${isDocker} == "y" ]]
then
    echo 'Устанавливаем Dockerfile для node'
    mkdir Docker
    mkdir Docker/node
    # Dockerfile
    cp ./DockerFiles/node/Dockerfile ./Docker/node/Dockerfile
    # Dockerfile
    cp ./DockerComposes/node/docker-compose.yml ./Docker/node/docker-compose.yml

    echo '1 - prod'
    echo '2 - prod/dev'
    echo '3 - prod/dev/local'
    read -p "будет ли prod/dev/local    > " envtype

    if [[ ${envtype} == "3" ]]
    then
        echo 'prod/dev/local!!!'
        cp ./DockerComposes/node/docker-compose-dev.yml ./Docker/node/docker-compose-dev.yml
    fi

fi