FROM php:8.1-fpm

ARG userid
ARG groupid

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && echo "xdebug.mode=debug,develop,profile" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.start_with_request=trigger" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.output_dir=/var/www/codeprofiling/profiles" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

RUN apt-get update -yqq \
    &&  apt-get install -yqq git unzip

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN curl -sS https://get.symfony.com/cli/installer | bash \
    &&  mv /root/.symfony/bin/symfony /usr/local/bin/symfony

RUN groupadd -g $userid myuser \
    && useradd -m -u $userid -g $groupid myuser

USER myuser

RUN git config --global user.email "you@example.com" \
    && git config --global user.name "Your Name"

WORKDIR /var/www/codeprofiling