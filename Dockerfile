ARG PHP_VERSION = PHP7
FROM nginx:1.21-alpine as nginx
LABEL Maintainer="Rene Bakx <rene.bakx@quinzel.nl>" \
      Description="php-fpm $PHP_VERSION NGINX base image, asumes your code is added to /var/www and the webroot is /var/www/public"
# Install packages
RUN apk --update --no-cache add \
    supervisor \
    $PHP_VERSION \
    $PHP_VERSION-bcmath \
    $PHP_VERSION-dom \
    $PHP_VERSION-ctype \
    $PHP_VERSION-curl \
    $PHP_VERSION-fileinfo \
    $PHP_VERSION-fpm \
    $PHP_VERSION-gd \
    $PHP_VERSION-iconv \
    $PHP_VERSION-intl \
    $PHP_VERSION-json \
    $PHP_VERSION-mbstring \
    $PHP_VERSION-mysqlnd \
    $PHP_VERSION-opcache \
    $PHP_VERSION-openssl \
    $PHP_VERSION-pecl-apcu \
    $PHP_VERSION-pdo \
    $PHP_VERSION-pdo_mysql \
    $PHP_VERSION-pdo_sqlite \
    $PHP_VERSION-phar \
    $PHP_VERSION-posix \
    $PHP_VERSION-simplexml \
    $PHP_VERSION-session \
    $PHP_VERSION-sodium \
    $PHP_VERSION-soap \
    $PHP_VERSION-tokenizer \
    $PHP_VERSION-xml \
    $PHP_VERSION-xmlreader \
    $PHP_VERSION-xmlwriter \
    $PHP_VERSION-zip \
    curl \
    jpegoptim \
    optipng \
    pngquant 
RUN mkdir -p "etc\$PHP_VERSION"
RUN if [ "$PHP_VERSION" = "PHP7"] ; \
    then \
      apk add php7-mcrypt; \
      \
    else \
       apk add $PHP_VERSION-sodium;\
    fi && rm -rf /var/cache/apk/*
COPY rootfs /
RUN mkdir -p /var/www
WORKDIR /var/www
RUN set -x ; \
  addgroup -g 82 -S www-data ; \
  adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1; \
  usermod -aG www-data nginx;
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
