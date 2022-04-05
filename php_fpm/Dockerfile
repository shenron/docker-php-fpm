FROM php:8.1.4-fpm

MAINTAINER Thomas CASTELLY <thomas@tcy.io>

ARG MEMCACHED_HOST=memcached

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt-get install -y \
  libzip-dev \
  libmemcached-dev \
  wget

COPY /conf/php-fpm.conf /usr/local/etc/php-fpm.conf

RUN pecl install\
  xdebug-3.1.4\
  memcached\
  zip

COPY /conf/php.ini "$PHP_INI_DIR/php.ini"

RUN sed -i "s/\$MEMCACHED_HOST/$MEMCACHED_HOST/g" $PHP_INI_DIR/php.ini

COPY /conf/entrypoint.sh /entrypoint.sh

RUN wget https://phar.phpunit.de/phpunit.phar &&\
  chmod +x phpunit.phar && \
  mv phpunit.phar /usr/local/bin/phpunit

ENTRYPOINT ["/entrypoint.sh"]

WORKDIR /var/www

EXPOSE 9000 22
