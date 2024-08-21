#!/bin/bash

echo 'CREATE NETWORK net1'
docker network create --subnet 192.168.10.0/24 net1
echo ' ' 

echo 'CREATE DOCKER CONTAINER WITH DB(mysql)'
docker run --net net1 --ip 192.168.10.11 --rm --name mysql --hostname mysql -d -e MYSQL_ROOT_PASSWORD=123 mysql:8.0.38-bookworm
echo ' ' 

echo 'CREATE DOCKER CONTAINER WITH APP(adminer)'
docker run --net net1 --ip 192.168.10.12 -p 8080:8080 --rm --name adminer --hostname adminer -d adminer:4.8.1
echo ' '

echo -en 'The WEBAPP(mysql+adminer) application has been created.\nIn the browser address bar, go to http://localhost:8080\nAccess parameters\n - System: MySQL \n - Server: mysql \n - Username: root \n - Password: 123 \n - Database: \n'
