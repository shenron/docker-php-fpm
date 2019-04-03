# docker-php

## Base PHP (7.3.x) with some extensions

- PHPUnit, because test your application is important :)
- xdebug for debug your application with PHPStorm, Eclipse ...
> If the host is different of Gnu Linux, use the environment variable `IP_HOST`
- memcached to store sessions in an external memcache server
> host: `memcached`
- zlib to compress (REST) ouput, more informations: [zlib.configuration](http://php.net/manual/en/zlib.configuration.php#ini.zlib.output-compression)  
- opcache to cache the application in production
> PHP_ENV=development to disable it


## Optional dependencies

- oci8, if your project need an Oracle database

## Logs
- php.ini: `/var/log/php-error.log`
- php-fpm: `/proc/self/fd/2` 

## How use these images
Beacause theses images extend official PHP image, you can refer to official documentation [official documentation](https://hub.docker.com/_/php/) 

## docker hub
[docker hub / shenron](https://hub.docker.com/r/shenron/php-fpm/)
