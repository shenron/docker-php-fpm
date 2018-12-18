FROM php:7.3-fpm

MAINTAINER Thomas CASTELLY <thomas@tcy.io>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt-get install -y \
  libzip-dev \
  libmemcached-dev \
  wget

COPY /conf/php-fpm.conf /usr/local/etc/php-fpm.conf

RUN pecl install\
  xdebug-2.7.0beta1\
  # memcached\
  zip

# Install memcached
# Should be replaced by `pecl install memcached` when available with PHP 7.3
RUN set -ex \
    && MEMCACHED="`mktemp -d`" \
    && curl -skL https://github.com/php-memcached-dev/php-memcached/archive/master.tar.gz | tar zxf - --strip-components 1 -C $MEMCACHED \
    && docker-php-ext-configure $MEMCACHED \
    && docker-php-ext-install $MEMCACHED \
    && rm -rf $MEMCACHED

COPY /conf/php.ini /usr/local/etc/php/

COPY /conf/entrypoint.sh /entrypoint.sh

RUN wget https://phar.phpunit.de/phpunit.phar &&\
  chmod +x phpunit.phar && \
  mv phpunit.phar /usr/local/bin/phpunit

ENTRYPOINT ["/entrypoint.sh"]

WORKDIR /var/www

EXPOSE 9000 22
