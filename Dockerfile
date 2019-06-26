FROM php:7.2-cli

RUN apt-get update \
    && apt-get install --no-install-recommends -y wget git unzip zip bc \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php --

RUN mv composer.phar /bin
RUN echo '#!/bin/bash\nphp /bin/composer.phar "$@"' > /bin/composer
RUN chmod a+x /bin/composer

RUN wget https://deb.nodesource.com/setup_10.x -O - -q | bash -

RUN apt-get update \
    && apt-get install --no-install-recommends -y nodejs \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
