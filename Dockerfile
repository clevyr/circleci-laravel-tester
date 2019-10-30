FROM php:7.3-cli-alpine

ARG COMPOSER_VERSION="1"
ARG NODEJS_VERSION="10"

RUN set -x \
    && apk add --virtual .build-deps \
        postgresql-dev \
        $PHPIZE_DEPS \
    && apk add \
        bash \
        bc \
        "composer=~$COMPOSER_VERSION" \
        "nodejs=~$NODEJS_VERSION" \
        npm \
        git \
        openssh-client \
        postgresql-libs \
    && docker-php-ext-install -j"$(nproc)" bcmath pgsql pdo_pgsql exif \
    && composer global require hirak/prestissimo \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*

COPY rootfs/ /

CMD ["bash"]
