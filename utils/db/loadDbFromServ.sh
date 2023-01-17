#!/bin/bash

sudo chmod -R 777 mysql/dumps
# scp -r root@135.181.153.78:~/mail_trade_crm/mysql/dumps mysql
scp root@135.181.153.78:~/mail_trade_crm/mysql/dump-latest/database-latest.sql.gz mysql/dumps/database-latest.sql.gz
docker-compose restart db

# backup_filename="database-latest.sql.gz"
# backup_path="/var/lib/mysql/dumps/$backup_filename"
# docker-compose exec -T db sh -c  "mysql -uroot -p${DATABASE_ROOT_PASSWORD} --max-allowed-packet=64M --quick  ${DATABASE_NAME} | gunzip < $backup_path"

gzip -d mysql/dumps/database-latest.sql.gz

docker-compose exec -T db sh -c "mysql --user=root --host=db --password=root crm < /var/lib/mysql/dumps/database-latest.sql"