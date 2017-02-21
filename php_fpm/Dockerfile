FROM php:5.6-fpm

MAINTAINER Thomas CASTELLY <thomas@tcy.io>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt-get install -y \
  zlib1g-dev \
  libmemcached-dev \
  unzip wget

COPY /conf/php-fpm.conf /usr/local/etc/

RUN pecl install\
  xdebug\
  memcached-2.2.0 \
  zip

COPY /conf/php.ini /usr/local/etc/php/

COPY /conf/entrypoint.sh /entrypoint.sh

RUN wget https://phar.phpunit.de/phpunit.phar && \ 
  chmod +x phpunit.phar && \
  mv phpunit.phar /usr/local/bin/phpunit

ENTRYPOINT ["/entrypoint.sh"]

WORKDIR /var/www

EXPOSE 9000 22
