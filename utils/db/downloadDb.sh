#!/bin/bash
# scp root@123.123.123.123:/home/test.txt /directory
# !!!!!!!!!!!!!!!!! не работает
sudo chmod -R 777 mysql/mysql-data/crm
sudo chmod -R 777 mysql/dumps
sudo rm -rf mysql/mysql-data/*
scp -r root@135.181.153.78:~/mail_trade_crm/mysql/mysql-data/crm mysql/mysql-data