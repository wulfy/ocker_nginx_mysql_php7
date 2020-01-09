FROM php:7.4-fpm

RUN apt-get update
RUN apt-get install -y zlib1g-dev libjpeg-dev libpng-dev libfreetype6-dev

RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install bcmath

## APCu
RUN pecl install apcu-5.1.17 \
RUN docker-php-ext-enable apcu

