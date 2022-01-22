#!/bin/bash
# sudo apt update
# sudo apt install snapd -y
# sudo snap install core
# sudo snap refresh core
# sudo apt-get remove certbot
# sudo snap install --classic certbot
# sudo ln -s /snap/bin/certbot /usr/bin/certbot
# sudo certbot --nginx
# sudo certbot renew --dry-run

sudo apt update
sudo apt install nginx -y

sudo ufw app list
sudo ufw allow 'Nginx Full'
sudo ufw status
systemctl status nginx



