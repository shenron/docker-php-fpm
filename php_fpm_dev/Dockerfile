FROM shenron/php-fpm:7.3

RUN echo "zend_extension=$(php-config --extension-dir)/xdebug.so" >> $PHP_INI_DIR/php.ini && \
  sed -i "s/opcache.enable=1/opcache.enable=0/" $PHP_INI_DIR/php.ini &&\
  sed -i "s/opcache.enable_cli=1/opcache.enable_cli=0/" $PHP_INI_DIR/php.ini &&\
  sed -i "s/opcache.revalidate_freq=60/opcache.revalidate_freq=0/" $PHP_INI_DIR/php.ini &&\
  echo "; fix bug between PHP 7.3 and xdebug 2.7.0beta1" >> $PHP_INI_DIR/php.ini &&\
  echo "opcache.optimization_level=0x7FFFBBFF" >> $PHP_INI_DIR/php.ini
