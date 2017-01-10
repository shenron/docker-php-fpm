FROM php:7.1.0-fpm

RUN apt-get update && \
    apt-get install -y \
    zlib1g-dev \
    libmemcached-dev \
    unzip wget

COPY /conf/php-fpm.conf /usr/local/etc/

RUN pecl install\
    xdebug\
    # memcached\
    zip

# Today the install of memcached with pecl not working with php7
# Install it manually
RUN apt-get install -y git &&\
    cd / &&\
    git clone https://github.com/php-memcached-dev/php-memcached.git &&\
    cd php-memcached &&\
    phpize &&\
    ./configure --disable-memcached-sasl &&\
    make &&\
    make install

COPY /conf/php.ini /usr/local/etc/php/

# Update PHP config
RUN extFolder=$(php-config --extension-dir) && \
    echo "zend_extension=$extFolder/xdebug.so" >> /usr/local/etc/php/php.ini

RUN xdebugPath=/usr/local/etc/php/conf.d/ && \
    touch $xdebugPath/xdebug.ini; \
    ip=$(/sbin/ip route|awk '/default/ { print $3 }') && \
        echo "xdebug.remote_host=$ip" >> $xdebugPath/xdebug.ini; \
    echo xdebug.remote_enable=1 >> $xdebugPath/xdebug.ini; \
    echo xdebug.remote_autostart=0 >> $xdebugPath/xdebug.ini; \
    echo xdebug.remote_connect_back=1 >> $xdebugPath/xdebug.ini; \
    echo xdebug.remote_port=9000 >> $xdebugPath/xdebug.ini; \
    echo xdebug.remote_log=/tmp/php7-xdebug.log >> $xdebugPath/xdebug.ini;

COPY /conf/entrypoint.sh /entrypoint.sh

RUN wget https://phar.phpunit.de/phpunit.phar 

RUN chmod +x phpunit.phar

RUN mv phpunit.phar /usr/local/bin/phpunit

ENTRYPOINT ["/entrypoint.sh"]

WORKDIR /var/www

EXPOSE 9000 22
