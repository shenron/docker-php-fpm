#!/usr/bin/env bash

# update config file only if needed
if [ "$PHP_ENV" == "development" ]; then
  sed -i "s/opcache.revalidate_freq=60/opcache.revalidate_freq=0/" /usr/local/etc/php/php.ini
  sed -i "s/opcache.enable=1/opcache.enable=0/" /usr/local/etc/php/php.ini
  sed -i "s/opcache.enable_cli=1/opcache.enable_cli=0/" /usr/local/etc/php/php.ini
fi

sed -i "s/\$MEMCACHED_HOST/$MEMCACHED_HOST/g" /usr/local/etc/php/php.ini

exec "$@"
