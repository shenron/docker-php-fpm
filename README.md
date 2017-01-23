# docker-php

## Base PHP (7.1.x) with some extensions

- PHPUnit, because test your application is important :)
- xdebug for debug your application with PHPStorm, Eclipse ...
> If the host is different of Gnu Linux, use the environment variable `IP_HOST`
- memcached to store sessions in an external memcache server
> host: `memcached`
- zlib to compress (REST) ouput, more informations: [zlib.configuration](http://php.net/manual/en/zlib.configuration.php#ini.zlib.output-compression)  
- opcache to cache the application in production
> ENV=DEV to disable it



## Optional dependencies

- oci8, if your project need an Oracle database

## How use these images
Beacause theses images extend official PHP image, you can refer to official documentation [official documentation](https://hub.docker.com/_/php/) 

## Versions
| Tag | PHP 7 
|-----|-------
| 7.1 | 7.1.0
