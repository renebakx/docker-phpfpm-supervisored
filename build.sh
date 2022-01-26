#!/bin/sh 

docker build --rm --build-arg PHPVERSION=7 -t renebakx/php-fpm-nginx:7.4-latest -t renebakx/php-fpm-nginx:7.4.27  ./
docker build --rm --build-arg PHPVERSION=8 -t renebakx/php-fpm-nginx:8.0-latest -t renebakx/php-fpm-nginx:8.0.14  ./
docker push --all-tags renebakx/php-fpm-nginx