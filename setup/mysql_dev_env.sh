#!/bin/bash

export CLOUD_SQL_DATABASE_NAME="playlist"
export CLOUD_SQL_PASSWORD="123456"
export CLOUD_SQL_USERNAME="playuser"
export DB_LOCAL_HOST="127.0.0.1"

docker run --name=mysqldb -e MYSQL_ROOT_HOST=% -e MYSQL_ROOT_PASSWORD=admin -p 3306:3306 -d mysql/mysql-server:5.7

mysql -h  $DB_LOCAL_HOST -P 3306 -u root -p -e "CREATE USER '$CLOUD_SQL_USERNAME'@'%' IDENTIFIED BY '$CLOUD_SQL_PASSWORD';"

mysql -h $DB_LOCAL_HOST -P 3306 -u root -p -e "GRANT ALL PRIVILEGES ON *.* TO '$CLOUD_SQL_USERNAME'@'%' WITH GRANT OPTION;"

mysql -h $DB_LOCAL_HOST -P 3306 -u $CLOUD_SQL_USERNAME -p < Playlist.sql

mysql -h $DB_LOCAL_HOST -P 3306 -u $CLOUD_SQL_USERNAME -p $CLOUD_SQL_DATABASE_NAME -e "show tables;"
