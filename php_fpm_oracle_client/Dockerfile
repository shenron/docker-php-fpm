FROM ghcr.io/shenron/php-fpm:8.1

ENV LD_LIBRARY_PATH /usr/local/instantclient/

RUN apt-get update && \
  apt-get install -y \
  unzip \
  libaio-dev

# install oracle client
COPY /conf/ /tmp/

COPY ./install_oracle_driver.sh /tmp/

RUN /tmp/install_oracle_driver.sh

RUN echo 'instantclient,/usr/local/instantclient' | pecl install oci8 && \
  echo "extension=oci8.so" >> /usr/local/etc/php/php.ini

