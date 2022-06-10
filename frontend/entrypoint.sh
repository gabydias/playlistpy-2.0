#!/bin/sh
set -e

function fail_if_does_exists
{
    if [ -z "$2" ]
    then
	echo "Não foi identificado a variável $1, valor: '$2'"
	exit 1
    fi
}

fail_if_does_exists BACKEND_URL "$BACKEND_URL"
fail_if_does_exists PORT "$PORT"

envsubst '\$PORT,\$BACKEND_URL'  < /etc/nginx/conf.d/configfile.template > /etc/nginx/conf.d/default.conf
cat /etc/nginx/conf.d/default.conf

exec "$@"
