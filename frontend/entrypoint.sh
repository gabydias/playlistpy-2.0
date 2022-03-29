#!/bin/sh
set -e

if [ -z "$BACKEND_URL" ] 
then
 echo "Não foi identificado a variável BACKEND_URL" 
 exit 1
fi

envsubst '\$PORT,\$BACKEND_URL'  < /etc/nginx/conf.d/configfile.template > /etc/nginx/conf.d/default.conf
cat /etc/nginx/conf.d/default.conf

exec "$@"
