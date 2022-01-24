### Introduction

The pipeline on this project builds two Base docker images, one with PHP 7.4.x and the other one is PHP 8.0.x 
These images are currently based on the public [`nginx:1.21-alpine` ](https://hub.docker.com/_/nginx)image and run both php-fpm and nginx in Supervisor mode.
PHP is added from the community repository of Alpine Linux 3.15 [PHP 7.4](https://pkgs.alpinelinux.org/packages?name=php7-*&branch=v3.15&arch=x86_64) and [PHP 8.0](https://pkgs.alpinelinux.org/packages?name=php8-*&branch=v3.15&arch=x86_64)

### build

Builds of these images are currenly manually, and you can specify the verion with two variables at when [triggering a new build](https://gitlab.ara.hosting/devops/php-docker/-/pipelines/new).

`PH80` and `PHP74` and these should contain the dotted version of the PHP version you are building (7.4.xx or 8.0.xx)

Both of these variables are also set in the [variables CI/CD settings](https://gitlab.ara.hosting/devops/php-docker/-/settings/ci_cd) and they need to be updated when a new release of PHP is tagged!


### Usage
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
