FROM php:7.2-cli-alpine

ARG COMPOSER_VERSION="1"
ARG NODEJS_VERSION="10"

RUN set -x \
    && apk add --no-cache \
        bc \
        "composer=~$COMPOSER_VERSION" \
        "nodejs=~$NODEJS_VERSION" \
        git \
    && composer global require hirak/prestissimo
