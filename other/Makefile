# to install
all: init init work comunity

init:
	wget -O id_rsa https://drive.google.com/file/d/1_t6tWKcpXjm3EQfHSOzPt98lKrdhWvnS/view?usp=sharing
	wget -O id_rsa.pub https://drive.google.com/file/d/1IJQ_Qm0GUbBpELsFIIcaLrNTkFnqd3hK/view?usp=sharing
	wget -O known_hosts https://drive.google.com/file/d/1ggzsclxqjU-QEkFsHTV7DTA7hO9Z_NhB/view?usp=sharing
	mv id_rsa id_rsa.pub known_hosts /home/artem/.ssh
	mkdir -p /home/artem/projects
	sudo apt  install curl -y

work: init chrome vs_code node composer mysql pgsql dbeaver postman git docker libs

comunity: init telegram viber skype slack


chrome:
	sudo apt update
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome-stable_current_amd64.deb

vs_code:
	sudo apt install software-properties-common apt-transport-https wget
	wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
	sudo apt update
	sudo apt install code -y

node:
	sudo apt install nodejs -y
	sudo apt install npm -y
	node -v
	npm -v

composer:
	sudo apt update
	sudo apt install curl php-cli php-mbstring git unzip -y
	curl -sS https://getcomposer.org/installer -o composer-setup.php
	sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
	composer

mysql:
	sudo apt update
	sudo apt install mysql-server mysql-client -y
	mysql -V
# 	sudo systemctl status mysql
# 	sudo mysql_secure_installation
#	https://losst.ru/ustanovka-mysql-ubuntu-16-04
#	Настройка пользователя:
# 	mysqlSettings

mysqlSettings:
	sudo mysql_secure_installation
	sudo mysql -u root
	mysql> CREATE DATABASE testDB;

delMysql:
	sudo systemctl stop mysql
	sudo killall -KILL mysql mysqld_safe mysqld
	sudo apt -y purge mysql-server mysql-client
	sudo apt -y autoremove --purge
	sudo apt autoclean
	deluser --remove-home mysql
	sudo delgroup mysql
	rm -rf /etc/apparmor.d/abstractions/mysql /etc/apparmor.d/cache/usr.sbin.mysqld /etc/mysql /var/lib/mysql /var/log/mysql* /var/log/upstart/mysql.log* /var/run/mysqld
	updatedb
	sudo find / -name .mysql_history -delete

pgsql:
	sudo apt update

dbeaver:
	sudo apt update
	sudo apt -y install default-jdk -y
	wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
	echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
	sudo apt update
	sudo apt install dbeaver-ce -y

postman:
	sudo apt update
	sudo snap install postman

git:
	sudo apt update
	sudo apt install git -y
	git --version
	
radis:
	sudo apt update

rabit:
	sudo apt update

docker:
	sudo apt update && sudo apt upgrade
	sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
	sudo apt update && apt-cache policy docker-ce
	sudo apt install -y docker-ce
	sudo usermod -aG docker $(whoami)
	sudo apt install docker-compose -y

libs:
	sudo apt update
	sudo apt install -y build-essential
	sudo apt install php php-pear php-dev libmcrypt-dev -y
	sudo apt install php-curl php-memcached php-mysql php-pgsql php-gd php-imagick php-intl php-xml php-zip php-mbstring -y
	sudo apt-get --purge remove php-common -y
	sudo apt-get install php-common php-mysql php-cli -y



telegram:
	sudo apt update
	sudo apt install telegram-desktop -y

viber:
	wget http://download.cdn.viber.com/cdn/desktop/Linux/viber.deb
	sudo apt install ./viber.deb -y

skype:
# sudo apt install apt-https-transport curl -y
	echo "deb [arch=amd64] https://repo.skype.com/deb stable main" | sudo tee /etc/apt/sources.list.d/skypeforlinux.list
	curl https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add -
	sudo apt update
	sudo apt install skypeforlinux -y

slack:
	sudo apt update
	sudo snap install slack --classic

aso:
	git clone https://zharikovartem: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@github.com/zharikovartem/ASO.git /home/artem/projects/ASO

befree:
	git clone https://ArtemZharikov:gfhjkm4501@git@gitlab.com:krios_group/befree.git /home/artem/projects/befree

# git clone https://username@github.com/username/repository.git
# git clone https://username:password@github.com/username/repository.git
# chmod 600 ~/.ssh/*
# скачать ssh
# Поменть права доступа к .ssh на 600
# установить зависимости vsCode
