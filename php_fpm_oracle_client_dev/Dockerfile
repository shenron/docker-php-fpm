FROM shenron/php-fpm-oracle-client:7.3

RUN echo "zend_extension=$(php-config --extension-dir)/xdebug.so" >> /usr/local/etc/php/php.ini && \
  sed -i "s/opcache.enable=1/opcache.enable=0/" /usr/local/etc/php/php.ini &&\
  sed -i "s/opcache.enable_cli=1/opcache.enable_cli=0/" /usr/local/etc/php/php.ini &&\
  sed -i "s/opcache.revalidate_freq=60/opcache.revalidate_freq=0/" /usr/local/etc/php/php.ini &&\
  sed -i "s/opcache.save_comments/; opcache.save_comments/" /usr/local/etc/php/php.ini
