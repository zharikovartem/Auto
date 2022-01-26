#!/bin/bash
sudo apt update
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
sudo apt install curl php-cli php-mbstring git unzip -y
composer