#!/bin/bash
mkdir app # можно поменять название папки
cd app

# создаем бэк
composer create-project symfony/skeleton api

cp ./../DockerComposes/SymfonyReact/docker-compose.yml ./docker-compose.yml

mkdir docker

mkdir docker/nginx
cp ./../DockerFiles/SymfonyReact/nginx/Dockerfile ./docker/nginx/Dockerfile
cp ./../DockerFiles/SymfonyReact/nginx/nginx.conf ./docker/nginx/nginx.conf
cp ./../DockerFiles/SymfonyReact/nginx/api.conf ./docker/nginx/api.conf

mkdir docker/php
cp ./../DockerFiles/SymfonyReact/php/Dockerfile ./docker/php/Dockerfile
cp ./../DockerFiles/SymfonyReact/php/php.ini ./docker/php/php.ini

# Create UI
npx create-react-app ui --template cra-template-pwa-typescript
# cd ui
cp ./../DockerFiles/SymfonyReact/ui/Dockerfile ./ui/Dockerfile
cd ui
yarn install 
cd ..

# cd api
#     echo  -e '\e[30;48;5;82m composer install --ignore-platform-reqs \e[0;49m' 
#     pwd
#     ls -la
#     composer update --ignore-platform-reqs
# cd ..

# Starting up the containers
docker-compose up --build