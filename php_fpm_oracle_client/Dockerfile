FROM shenron/php-fpm:8.0

ENV LD_LIBRARY_PATH /usr/local/instantclient/

RUN apt-get update && \
  apt-get install -y \
  unzip \
  libaio-dev

# install oracle client
COPY /conf/ /tmp/

RUN unzip /tmp/instantclient-basiclite-linux.x64-19.3.0.0.0dbru.zip -d /usr/local/ && \
  unzip /tmp/instantclient-sdk-linux.x64-19.3.0.0.0dbru.zip -d /usr/local/ && \
  rm /tmp/instantclient-basiclite-linux.x64-19.3.0.0.0dbru.zip /tmp/instantclient-sdk-linux.x64-19.3.0.0.0dbru.zip &&\
  ln -s /usr/local/instantclient_19_3 /usr/local/instantclient && \
  echo 'instantclient,/usr/local/instantclient' | pecl install oci8 && \
  echo "extension=oci8.so" >> /usr/local/etc/php/php.ini

