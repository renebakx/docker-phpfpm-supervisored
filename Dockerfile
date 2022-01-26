FROM nginx:1.21-alpine as nginx
ARG PHP_VERSION=7
LABEL Maintainer="Rene Bakx <rene.bakx@quinzel.nl>" \
      Description="php-fpm ${PHP_VERSION} NGINX base image, asumes your code is added to /var/www and the webroot is /var/www/public"
# Install packages
RUN echo "building ${PHP_VERSION}"
RUN apk --update --no-cache add \
    supervisor \
    php${PHP_VERSION} \
    php${PHP_VERSION}-bcmath \
    php${PHP_VERSION}-dom \
    php${PHP_VERSION}-ctype \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-fileinfo \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-gd \
    php${PHP_VERSION}-iconv \
    php${PHP_VERSION}-intl \
    php${PHP_VERSION}-json \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-mysqlnd \
    php${PHP_VERSION}-opcache \
    php${PHP_VERSION}-openssl \
    php${PHP_VERSION}-pecl-apcu \
    php${PHP_VERSION}-pdo \
    php${PHP_VERSION}-pdo_mysql \
    php${PHP_VERSION}-pdo_sqlite \
    php${PHP_VERSION}-phar \
    php${PHP_VERSION}-posix \
    php${PHP_VERSION}-simplexml \
    php${PHP_VERSION}-session \
    php${PHP_VERSION}-soap \
    php${PHP_VERSION}-tokenizer \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-xmlreader \
    php${PHP_VERSION}-xmlwriter \
    php${PHP_VERSION}-zip \
    curl \
    jpegoptim \
    optipng \
    pngquant 
COPY rootfs/etc /etc    
RUN ln -s /usr/sbin/php-fpm${PHP_VERSION} /usr/sbin/php-fpm
COPY php-fpm.d/www.conf etc/php${PHP_VERSION}/php-fpm.d/
RUN  [ "$PHP_VERSION" = "7" ] && apk add --no-cache php7-mcrypt || apk add --no-cache php${PHP_VERSION}-sodium
RUN rm -rf /var/cache/apk/* && set -x ; \
  addgroup -g 82 -S www-data ; \
  adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1; \
  usermod -aG www-data nginx; 
WORKDIR /var/
COPY --chown=www-data:www-data rootfs/var .  
RUN chown -R www-data:www-data /var/log
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
