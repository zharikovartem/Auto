#!/bin/bash
read -p "switch the version of NodeJs (10/14/16)   >> " nodeVersion
curl -sL https://deb.nodesource.com/setup_${nodeVersion}.x -o nodesource_setup.sh
# nano nodesource_setup.sh
sudo bash nodesource_setup.sh