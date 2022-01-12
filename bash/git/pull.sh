#!/bin/bash
echo -e "\e[30;48;5;82m Start \e[0;49m";

# git pull
echo -e "\e[30;48;5;82m Git pull... \e[0;49m";
git -c color.ui=always pull > /tmp/tmp.log
cat /tmp/tmp.log
GIT_RES=$(cat /tmp/tmp.log)
rm -f /tmp/tmp.log
echo "end git pull";

set -o allexport
[[ -f .env ]] && source .env
set +o allexport

# запускаем миграции если были изменения
if echo "$GIT_RES" | grep -q "app/migrations"
then
    UPDATE_MIGRATIONS=1
else
    UPDATE_MIGRATIONS=0
fi

if echo "$GIT_RES" | grep -q "twig"
then
    UPDATE_TWIG=1
else
    UPDATE_TWIG=0
fi

if echo "$GIT_RES" | grep -q ".js"
then
    UPDATE_JS=1
else
    UPDATE_JS=0
fi

D_C_UP_D=0
if echo "$GIT_RES" | grep -q ".env"
then
    D_C_UP_D=1
    D_C_ENV=1
else
    D_C_ENV=0
fi

if echo "$GIT_RES" | grep -q "docker-compose"
then
    D_C_UP_D=1
    D_C_COM=1
else
    D_C_COM=0
fi

RESTART=0
if [[ -n "$1" ]]
then
    if [[ $1 == 'c' ]]
    then
        UPDATE_TWIG=1
    fi
    if [[ $1 == 'r' ]]
    then
        RESTART=1
    fi
    if [[ $1 == 's' ]]
    then
        SCALE=1
    fi
fi

if echo "$GIT_RES" | grep -q "cron.d"
then
    UPDATE_CRON=1
else
    UPDATE_CRON=0
fi

if echo "$GIT_RES" | grep -q "composer.json"
then
    UPDATE_COMPOSER=1
else
    UPDATE_COMPOSER=0
fi

if echo "$GIT_RES" | grep -q "Already"
then
    UPDATE_ALL=0
else
    UPDATE_ALL=1
fi

if [[ ${D_C_UP_D} -eq 1 ]]
then
    if [[ ${D_C_ENV} -eq 1 ]]
    then
        echo -e "\e[30;48;5;82m Copy file .env-$APP_ENV and rename in .env \e[0;49m";
        cp ./.env-${APP_ENV} ./.env

        set -o allexport
        [[ -f .env ]] && source .env
        set +o allexport
    fi

    if [[ ${D_C_COM} -eq 1 ]]
    then
        echo -e "\e[30;48;5;82m Copy file docker-compose-$APP_ENV.yml and rename in docker-compose.yml \e[0;49m";
        cp ./docker-compose-${APP_ENV}.yml ./docker-compose.yml
        echo;
    fi

    docker-compose up -d --scale mvideo_parser=${MVIDEO_PARSER_SCALE} --scale mvideo_save=${MVIDEO_SAVE_SCALE} --scale calculation=${CALCULATION_SCALE} --scale command=${COMMAND_SCALE} --scale mvideo_pa$
    echo;
fi

if [[ ${UPDATE_ALL} -eq 1 ]]
then
    if [[ ${UPDATE_COMPOSER} -eq 1 ]]
    then
        echo -e "\e[30;48;5;82m Composer install... \e[0;49m";
        docker-compose exec php7 composer install
        echo;
    fi

    if [[ ${UPDATE_MIGRATIONS} -eq 1 ]]
    then
        echo -e "\e[30;48;5;82m Migrations start... \e[0;49m";
        docker-compose exec php7 php bin/console d:m:m --no-interaction
        echo;
    fi
fi

if [[ ${UPDATE_TWIG} -eq 1 ]]
then
    echo -e "\e[30;48;5;82m Cache:clear $APP_ENV ... \e[0;49m";
    docker-compose exec php7 php bin/console cache:clear --env=${APP_ENV} --no-warmup
    docker-compose exec php7 php bin/console cache:warmup --env=${APP_ENV}
    echo;

    echo -e "\e[30;48;5;82m Set www-data as owner of app.. \e[0;49m";
    chown www-data:www-data -R app
    echo;
fi

if [[ ${UPDATE_JS} -eq 1 ]]
then
    echo -e "\e[30;48;5;82m Running webpack ... \e[0;49m";
    docker-compose exec php7 yarn
    docker-compose exec php7 yarn build
    echo;
fi
     
if [[ ${RESTART} -eq 1 ]]
then
    echo -e "\e[30;48;5;82m Restart.. \e[0;49m";
    docker-compose restart
    echo;
fi

if [[ ${SCALE} -eq 1 ]]
then
    echo -e "\e[30;48;5;82m Scale.. \e[0;49m";
    docker-compose up -d
    echo;
fi

if [[ ${UPDATE_CRON} -eq 1 ]]
then
    echo -e "\e[30;48;5;82m Restart cron.. \e[0;49m";
    docker-compose restart cron
    echo;
fi

echo -e "\e[30;48;5;82m End!! \e[0;49m";
