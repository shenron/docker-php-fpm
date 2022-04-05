#!/usr/bin/env bash

xdebugPath=/usr/local/etc/php/conf.d/
extFolder=$(php-config --extension-dir)

# allow debug in DEV
# update config file only if needed
if [ "$PHP_ENV" == "development" ]; then
  if grep -q "xdebug" /usr/local/etc/php/php.ini; then
    echo "[LOG] debug config already apply"
  else
    echo "zend_extension=$extFolder/xdebug.so" >> /usr/local/etc/php/php.ini
    echo "; workaround between PHP 7.3 and xdebug-2.7.0beta1" >> /usr/local/etc/php/php.ini
    echo "opcache.optimization_level=0x7FFFBBFF" >> /usr/local/etc/php/php.ini

    echo "" > $xdebugPath/xdebug.ini

    # On linux it's possible to try to connect to the client
    # On MacOS X, the IP of host have to be set
    if [ -z "$IP_HOST" ]; then
      echo xdebug.remote_connect_back=1 >> $xdebugPath/xdebug.ini
    else
      echo xdebug.remote_connect_back=0 >> $xdebugPath/xdebug.ini
      echo "xdebug.remote_host=$IP_HOST" >> $xdebugPath/xdebug.ini
    fi

    echo xdebug.remote_enable=1 >> $xdebugPath/xdebug.ini
    echo xdebug.remote_autostart=0 >> $xdebugPath/xdebug.ini
    echo xdebug.remote_port=9000 >> $xdebugPath/xdebug.ini
    echo xdebug.remote_log=/tmp/php-xdebug.log >> $xdebugPath/xdebug.ini

    sed -i "s/opcache.revalidate_freq=60/opcache.revalidate_freq=0/" /usr/local/etc/php/php.ini
    sed -i "s/opcache.enable=1/opcache.enable=0/" /usr/local/etc/php/php.ini
    sed -i "s/opcache.enable_cli=1/opcache.enable_cli=0/" /usr/local/etc/php/php.ini
  fi
else
  if [ -f $xdebugPath/xdebug.ini ]; then
    rm $xdebugPath/xdebug.ini
    sed -i "/xdebug/d" /usr/local/etc/php/php.ini
  fi
fi

sed -i "s/\$MEMCACHED_HOST/$MEMCACHED_HOST/g" /usr/local/etc/php/php.ini

exec "$@"
