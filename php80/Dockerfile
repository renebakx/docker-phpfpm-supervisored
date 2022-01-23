FROM nginx:1.21-alpine as nginx
LABEL Maintainer="Rene Bakx <rene.bakx@ara.nl>" \
      Description="php-fpm 8.0 NGINX base image, asumes your code is added to /var/www and the webroot is /var/www/public"
# Install packages
RUN apk --update --no-cache add \
    supervisor \
    php8 \
    php8-bcmath \
    php8-dom \
    php8-ctype \
    php8-curl \
    php8-fileinfo \
    php8-fpm \
    php8-gd \
    php8-iconv \
    php8-intl \
    php8-json \
    php8-mbstring \
    php8-mysqlnd \
    php8-opcache \
    php8-openssl \
    php8-pecl-apcu \
    php8-pecl-imagick \
    php8-pdo \
    php8-pdo_mysql \
    php8-pdo_sqlite \
    php8-phar \
    php8-posix \
    php8-simplexml \
    php8-session \
    php8-sodium \
    php8-soap \
    php8-tokenizer \
    php8-xml \
    php8-xmlreader \
    php8-xmlwriter \
    php8-zip \
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
