#!/bin/bash

MYSQL_CONTAINER=$(docker-compose ps | grep db | awk -F' ' '{ print $1 }')

if [ -z "$MYSQL_CONTAINER" ]
then
    echo "Não foi possivel localizar o container do MySQL, voce rodou 'docker-compose up'?"
    exit 1
fi

docker exec -it "$MYSQL_CONTAINER" mysql -h 127.0.0.1 -P 3306 -u root -p123456 -c "CREATE USER 'playuser'@'%' IDENTIFIED BY '123456';"
docker exec -it "$MYSQL_CONTAINER" mysql -h 127.0.0.1 -P 3306 -u root -p123456 -c "GRANT ALL PRIVILEGES ON *.* TO 'playuser'@'%' WITH GRANT OPTION;"
docker exec -it "$MYSQL_CONTAINER" mysql -h 127.0.0.1 -P 3306 -u playuser -p123456 < deploy/Playlist.sql
