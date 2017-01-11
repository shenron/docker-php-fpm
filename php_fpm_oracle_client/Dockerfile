FROM shenron/php-fpm:5.6

RUN apt-get update && \
    apt-get install -y \
    unzip \
    libaio-dev

# install oracle client
COPY /conf/instantclient-basic-linux.x64-12.1.0.2.0.zip /tmp/
COPY /conf/instantclient-sdk-linux.x64-12.1.0.2.0.zip /tmp/
COPY /conf/instantclient-sqlplus-linux.x64-12.1.0.2.0.zip /tmp/

RUN unzip /tmp/instantclient-basic-linux.x64-12.1.0.2.0.zip -d /usr/local/
RUN unzip /tmp/instantclient-sdk-linux.x64-12.1.0.2.0.zip -d /usr/local/
RUN unzip /tmp/instantclient-sqlplus-linux.x64-12.1.0.2.0.zip -d /usr/local/

RUN ln -s /usr/local/instantclient_12_1 /usr/local/instantclient
RUN ln -s /usr/local/instantclient/libclntsh.so.12.1 /usr/local/instantclient/libclntsh.so
RUN ln -s /usr/local/instantclient/sqlplus /usr/bin/sqlplus
RUN echo 'instantclient,/usr/local/instantclient' | pecl install oci8-1.4.10
RUN echo "extension=oci8.so" >> /usr/local/etc/php/php.ini
