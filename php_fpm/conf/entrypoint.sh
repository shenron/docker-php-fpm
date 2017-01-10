#!/usr/bin/env bash

# For DEV env, disabled opc cache
if [ "$ENV" == "DEV" ]; then
    sed -i "s/opcache.revalidate_freq=60/opcache.revalidate_freq=0/" /usr/local/etc/php/php.ini
fi

exec "$@"
