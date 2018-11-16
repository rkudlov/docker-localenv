#!/bin/bash

set -e

if [[ $DEBUG ]]; then
  set -x
fi

if [[ -z "$PHP_ENV" ]]; then
   PHP_ENV=production
fi

if [[ $PHP_ENV="production" || $PHP_ENV="development" ]]; then
     ln -sf ${PHP_INI_DIR}/php.ini-${PHP_ENV} ${PHP_INI_DIR}/php.ini
else
     ln -sf ${PHP_INI_DIR}/php.ini-production ${PHP_INI_DIR}/php.ini
fi

# Configure php.ini
sed -i \
        -e "s/^expose_php.*/expose_php = Off/" \
        -e "s/^;date.timezone.*/date.timezone = UTC/" \
        -e "s/^memory_limit.*/memory_limit = -1/" \
        -e "s/^max_execution_time.*/max_execution_time = 300/" \
        -e "s/^post_max_size.*/post_max_size = 512M/" \
        -e "s/^upload_max_filesize.*/upload_max_filesize = 512M/" \
        -e "s|^error_log.*|error_log = /proc/self/fd/2|" \
        ${PHP_INI_DIR}/php.ini


if [ -n "$PHP_SENDMAIL_PATH" ]; then
     sed -i 's@^;sendmail_path.*@'"sendmail_path = ${PHP_SENDMAIL_PATH}"'@' ${PHP_INI_DIR}/php.ini
fi

if [[ $PHP_XDEBUG_ENABLED = 1 ]]; then
     sed -i 's/^;zend_extension.*/zend_extension = xdebug.so/' ${PHP_INI_DIR}/conf.d/00_xdebug.ini
fi

if [[ $PHP_XDEBUG_AUTOSTART = 0 ]]; then
     sed -i 's/^xdebug.remote_autostart.*/xdebug.remote_autostart = 0/' ${PHP_INI_DIR}/conf.d/00_xdebug.ini
fi

if [[ $PHP_XDEBUG_REMOTE_CONNECT_BACK = 0 ]]; then
     sed -i 's/^xdebug.remote_connect_back.*/xdebug.remote_connect_back = 0/' ${PHP_INI_DIR}/conf.d/00_xdebug.ini
fi

if [[ $PHP_XDEBUG_REMOTE_HOST ]]; then
     sed -i 's/^xdebug.remote_host.*/'"xdebug.remote_host = ${PHP_XDEBUG_REMOTE_HOST}"'/' ${PHP_INI_DIR}/conf.d/00_xdebug.ini
fi

# Copy default nginx config.
if [ ! "$(ls -A /etc/nginx/conf.d)" ]; then
    cp /opt/drupal.conf /etc/nginx/conf.d/
else
    cp /opt/drupal.conf /etc/nginx/conf.d/default.conf
fi

# Ensure server name defined.
if [ -z "$NGINX_SERVER_NAME" ]; then
    NGINX_SERVER_NAME=localhost
fi

# Set server name
sed -i 's/SERVER_NAME/'"${NGINX_SERVER_NAME}"'/' /etc/nginx/conf.d/*.conf

exec "$@"
