FROM php:7.1-fpm

MAINTAINER Thomas CASTELLY <thomas@tcy.io>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt-get install -y \
  libzip-dev \
  libmemcached-dev \
  wget

# Fix Zip Archive
RUN rm -rf /var/lib/apt/lists/* \
  && docker-php-ext-install zip 

COPY /conf/php-fpm.conf /usr/local/etc/php-fpm.conf

RUN pecl install\
  xdebug\
  memcached\
  zip

COPY /conf/php.ini /usr/local/etc/php/

COPY /conf/entrypoint.sh /entrypoint.sh

RUN wget https://phar.phpunit.de/phpunit.phar &&\ 
  chmod +x phpunit.phar && \
  mv phpunit.phar /usr/local/bin/phpunit

ENTRYPOINT ["/entrypoint.sh"]

WORKDIR /var/www

EXPOSE 9000 22
