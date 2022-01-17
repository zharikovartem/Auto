#!/bin/bash

read -p "userName: (root)   >> " userName
if [[ ${userName} == "" ]]
then
    userName="root"
fi

read -p "ip:   >> " ipAdress

read -p "Project Name:   >> " projectName

ssh $userName@$ipAdress


read -p "WAIT!!!!!!!!!   >> " ipAdress

#check node version
#check nginx version
#create directory
#add nginx settings
echo "server {" >>  /etc/nginx/sites-enabled/default
echo "server {" >>  /etc/nginx/sites-enabled/default
    # cat /etc/nginx/sites-enabled/crm_front_new

# copy build
mkdir /var/www/your_domain/html
touch /var/www/your_domain/html
scp -r ./build/* root@135.181.90.157:/var/www/your_domain/html

sudo systemctl restart nginx

# root /var/www/crm_front_new/html;
# try_files $uri /index.html;


# прописать ssh