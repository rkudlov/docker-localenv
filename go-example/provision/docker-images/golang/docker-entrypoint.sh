#!/bin/bash

set -e

if [[ $DEBUG ]]; then
  set -x
fi

if [[ -z "$APP_CONFIG" ]]; then
   APP_CONFIG=production
fi

if [[ $APP_CONFIG="production" || $APP_CONFIG="development" || $APP_CONFIG="local" || $APP_CONFIG="stage" ]]; then
     ln -sf ${GOPATH}/src/${PACKAGE_NAME}/config/config-${APP_CONFIG}.json ${GOPATH}/src/${PACKAGE_NAME}/config/config.json
else
     ln -sf ${GOPATH}/src/${PACKAGE_NAME}/config/config-production.json ${GOPATH}/src/${PACKAGE_NAME}/config/config.json
fi

exec "$@"
