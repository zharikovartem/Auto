read -p "Нужен ли нам Docker? y/n   > " isDocker

if [[ ${isDocker} == "y" ]]
then
    echo 'Устанавливаем Dockerfile для node'
    mkdir Docker
    mkdir Docker/node
    # Dockerfile
    cp ~/Desktop/Auto/DockerFiles/node/Dockerfile ./Docker/node/Dockerfile
    # Dockerfile
    cp ~/Desktop/Auto/DockerComposes/node/docker-compose.yml docker-compose.yml

    echo '1 - prod'
    echo '2 - prod/dev'
    echo '3 - prod/dev/local'
    read -p "будет ли prod/dev/local    > " envtype

    if [[ ${envtype} == "3" ]]
    then
        echo 'prod/dev/local!!!'
        cp ~/Desktop/Auto/DockerComposes/node/docker-compose-dev.yml docker-compose-dev.yml

        echo 'docker stop $(docker ps -a -q);' >> start.sh
        echo 'read -p "Enter node env server: dev/prod/local   > " envsrv' >> start.sh
        echo 'docker-compose -f docker-compose.yml -f docker-compose-dev.yml up -d --build;' >> start.sh

        read -p "Смонтировать контейнер сейчас? y/n   > " isStart
        if [[ ${isStart} == "y" ]]
        then
            bash ./start.sh
            echo 'docker-compose ps:'
            docker-compose ps
            echo 'docker ps:'
            docker ps
        fi
        
    fi

fi