#!/bin/bash

mysql -e "CREATE USER '$CLOUD_SQL_USERNAME'@'%' IDENTIFIED BY '$CLOUD_SQL_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$CLOUD_SQL_USERNAME'@'%' WITH GRANT OPTION;"
echo -e "[client]\nuser=$CLOUD_SQL_USERNAME\npassword=$CLOUD_SQL_PASSWORD" > ~/.my.cnf
chmod 600 ~/.my.cnf
mysql -u $CLOUD_SQL_USERNAME < setup/Playlist.sql
