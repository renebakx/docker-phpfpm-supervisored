FROM nginx:1.21-alpine as nginx
LABEL Maintainer="Rene Bakx <rene.bakx@ara.nl>" \
      Description="php-fpm 7.4 NGINX base image, asumes your code is added to /var/www and the webroot is /var/www/public"
# Install packages
RUN apk --update --no-cache add \
    supervisor \
    php7 \
    php7-bcmath \
    php7-dom \
    php7-ctype \
    php7-curl \
    php7-fileinfo \
    php7-fpm \
    php7-gd \
    php7-iconv \
    php7-intl \
    php7-json \
    php7-mbstring \
    php7-mcrypt \
    php7-mysqlnd \
    php7-opcache \
    php7-openssl \
    php7-pecl-apcu \
    php7-pecl-imagick \
    php7-pdo \
    php7-pdo_mysql \
    php7-pdo_sqlite \
    php7-phar \
    php7-posix \
    php7-simplexml \
    php7-session \
    php7-soap \
    php7-tokenizer \
    php7-xml \
    php7-xmlreader \
    php7-xmlwriter \
    php7-zip \
    curl \
    jpegoptim \
    optipng \
    pngquant && rm -rf /var/cache/apk/*
COPY rootfs /
RUN mkdir -p /var/www
WORKDIR /var/www
RUN set -x ; \
  addgroup -g 82 -S www-data ; \
  adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1; \
  usermod -aG www-data nginx;

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
