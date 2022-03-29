mysql -h 127.0.0.1 -P 3306 -u root -p123456 -e "CREATE USER 'playuser'@'%' IDENTIFIED BY '123456';"
mysql -h 127.0.0.1 -P 3306 -u root -p123456 -e "GRANT ALL PRIVILEGES ON *.* TO 'playuser'@'%' WITH GRANT OPTION;"
mysql -h 127.0.0.1 -P 3306 -u playuser -p123456 < Playlist.sql
