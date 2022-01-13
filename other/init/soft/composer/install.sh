#!/bin/bash
sudo apt update
sudo apt install curl php-cli php-mbstring git unzip -y
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
composer