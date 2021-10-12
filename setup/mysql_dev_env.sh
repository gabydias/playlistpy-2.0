#!/bin/bash

docker run --name=mysqldb -e MYSQL_ROOT_HOST=% -e MYSQL_ROOT_PASSWORD=admin -p 3306:3306 -d mysql/mysql-server:5.7

mysql -h 127.0.0.1 -P 3306 -u root -p -e "CREATE USER 'playuser'@'%' IDENTIFIED BY '123456';"

mysql -h 127.0.0.1 -P 3306 -u root -p -e "GRANT ALL PRIVILEGES ON *.* TO 'playuser'@'%' WITH GRANT OPTION;"

mysql -h 127.0.0.1 -P 3306 -u playuser -p < Playlist.sql

mysql -h 127.0.0.1 -P 3306 -u playuser -p playlist -e "show tables;"
