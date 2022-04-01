# builder
ARG PHP_VERSION=8.1

FROM ghcr.io/shenron/php-fpm:$PHP_VERSION as builder

ENV LD_LIBRARY_PATH /usr/local/instantclient/

RUN apt-get update && \
  apt-get install -y \
  unzip \
  libaio-dev

# install oracle client
COPY /conf/ /tmp/

COPY ./install_oracle_driver.sh /tmp/

RUN /tmp/install_oracle_driver.sh

# final stage
FROM ghcr.io/shenron/php-fpm:$PHP_VERSION

ENV LD_LIBRARY_PATH /usr/local/instantclient/

COPY --from=builder /usr/local/instantclient /usr/local/instantclient

RUN echo 'instantclient,/usr/local/instantclient' | pecl install oci8 && \
  echo "extension=oci8.so" >> /usr/local/etc/php/php.ini

