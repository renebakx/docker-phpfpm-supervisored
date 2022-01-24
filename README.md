The pipeline on this project builds two Base docker images, one with PHP 7.4.x and the other one is PHP 8.0.x 
These images are currently based on the public nginx:1.21-alpine image and run both php-fpm and nginx in Supervisor mode.

The images asume you code will be stored in `/var/www` and that the public directory of your project is in the `public` folder.

At this moment the following modules are enabled in PHP

- bcmath 
- dom 
- ctype 
- curl 
- fileinfo 
- fpm 
- gd 
- iconv 
- intl 
- json 
- mbstring 
- mcrypt (7.4)
- mysqlnd 
- opcache 
- openssl 
- pecl-apcu 
- pecl-imagick 
- pdo 
- pdo_mysql 
- pdo_sqlite 
- phar 
- posix 
- simplexml 
- session 
- soap 
- sodium (8.0)
- tokenizer 
- xml 
- xmlreader 
- xmlwriter 
- zip 
