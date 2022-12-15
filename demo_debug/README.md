# PHP Demo

Simple REST API with PHP, help to debug.
 
### Configuration of IntelliJ / PHPStorm
##### Plugins to install
  - PHP
  - PHP Docker
  - PHP Remote Interpreter
![alt Plugins](https://raw.githubusercontent.com/shenron/docker-php-fpm/master/demo_debug/screenshots/php-debug-01.png)
  
##### Languages & Frameworks > PHP
- Select PHP Language level: 8.2
- Configure a CLI Interpreter
  * From Docker, Vagrant, VM, Remote
  * Select Docker and your server (by default it's `Docker`)
  * Use an image with the debugger enable inthe php.ini (`shenron/php-fpm:8.2-dev`)
  * Select `php` as path
  * wait ...
  * Check volume binding: `./front` from the host has to be bind to `/var/www`

![alt Plugins](https://raw.githubusercontent.com/shenron/docker-php-fpm/master/demo_debug/screenshots/php-debug-02.png)
![alt Plugins](https://raw.githubusercontent.com/shenron/docker-php-fpm/master/demo_debug/screenshots/php-debug-03.png)
![alt Plugins](https://raw.githubusercontent.com/shenron/docker-php-fpm/master/demo_debug/screenshots/php-debug-04.png)
![alt Plugins](https://raw.githubusercontent.com/shenron/docker-php-fpm/master/demo_debug/screenshots/php-debug-05.png)
![alt Plugins](https://raw.githubusercontent.com/shenron/docker-php-fpm/master/demo_debug/screenshots/php-debug-07.png)
![alt Plugins](https://raw.githubusercontent.com/shenron/docker-php-fpm/master/demo_debug/screenshots/php-debug-08.png)

##### Start the listening for PHP Debug Connections
from `Run > Start Listening from PHP Debug Connections`
Accept the incomming connection from Xdebug and select `Manually choose local file or project`
Restart your IDE

![alt Plugins](https://raw.githubusercontent.com/shenron/docker-php-fpm/master/demo_debug/screenshots/php-debug-09.png)
![alt Plugins](https://raw.githubusercontent.com/shenron/docker-php-fpm/master/demo_debug/screenshots/php-debug-10.png)

##### Start the demo application
Execute the `start` file, launch the application in your browser 
http://localhost:8181/api/test

(all path after `/api/` will be rewritten to the index.php)

##### Chrome Plugin
Install and launch the XdebugHelper
https://chrome.google.com/webstore/detail/xdebug-helper/eadndfjplgieldjbigjakmdgkmoaaaoc

![alt Plugins](https://raw.githubusercontent.com/shenron/docker-php-fpm/master/demo_debug/screenshots/php-debug-06.png)

Enjoy !

![alt Plugins](https://raw.githubusercontent.com/shenron/docker-php-fpm/master/demo_debug/screenshots/php-debug-11.png)
