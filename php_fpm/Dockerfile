FROM php:7.1.1-fpm

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

COPY /conf/entrypoint.sh /entrypoint.sh

RUN wget https://phar.phpunit.de/phpunit.phar 

RUN chmod +x phpunit.phar

RUN mv phpunit.phar /usr/local/bin/phpunit

ENTRYPOINT ["/entrypoint.sh"]

WORKDIR /var/www

EXPOSE 9000 22
