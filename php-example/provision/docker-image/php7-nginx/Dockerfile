FROM php:7.2-fpm-alpine

ARG PHP_INI_DIR=/usr/local/etc/php
ENV PHP_INI_DIR=${PHP_INI_DIR}

# Install permanent packages
RUN apk add --update \
        bash \
        ca-certificates \
        openssh-client \
        git \
        curl \
        wget \
        gzip \
        tar \
        mariadb-client \
        yaml \
        file \
        nginx \
        nginx-mod-http-upload-progress \
        nginx-mod-http-lua \
        luajit \
        supervisor

#Install temporary packages

RUN apk add freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    autoconf \
    build-base && \

    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) gd pdo_mysql && \
    docker-php-ext-enable opcache && \
    pecl install xdebug && \

    # Cleanup
   apk del --purge \
#        *-dev \
        build-base \
        autoconf \
        libtool && \
    rm -rf \
        /usr/include/php \
        /usr/lib/php/build \
        /var/cache/apk/* \
        /tmp/* \
        /root/.composer

    # Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \

    # Install drush
    php -r "readfile('https://github.com/drush-ops/drush/releases/download/8.1.16/drush.phar');" > /usr/local/bin/drush && \
    chmod +x /usr/local/bin/drush



RUN ln -sf /usr/local/etc/php/php.ini-production /usr/local/etc/php.ini

WORKDIR /var/www/html
EXPOSE 9000
EXPOSE 80 443

RUN mkdir -p /run/nginx

COPY 00_xdebug.ini ${PHP_INI_DIR}/conf.d/
COPY nginx.conf /etc/nginx/
COPY php-fpm.conf ${PHP_INI_DIR}/../
COPY drupal.conf /opt/
COPY supervisord.conf /etc/supervisord.conf
COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD /usr/bin/supervisord -n -c /etc/supervisord.conf
