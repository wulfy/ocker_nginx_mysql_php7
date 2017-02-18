FROM php:7.0-fpm

RUN apt-get update
RUN apt-get install -y zlib1g-dev libjpeg-dev libpng-dev libfreetype6-dev

RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd
RUN docker-php-ext-install mysqli



ENV CASPERJS_VERSION=1.1.3

RUN apt-get update && apt-get install -y fontconfig python tar bzip2 npm locales unzip
RUN locale-gen fr_FR.UTF-8
ENV LANG fr_FR.UTF-8
ENV LANGUAGE fr_FR:fr
ENV LC_ALL us_US.UTF-8

# Downloading phantomjs
ADD https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 /tmp/phantomjs-2.1.1-linux-x86_64.tar.bz2

# Installing phantomjs
RUN cd /tmp/ && tar -xjvf /tmp/phantomjs-2.1.1-linux-x86_64.tar.bz2 && cp /tmp/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /bin && chmod +x /bin/phantomjs && rm /tmp/phantomjs-2.1.1-linux-x86_64.tar.bz2

# Installing casperjs
RUN npm install casperjs --global

RUN mkdir /data
VOLUME /data

## APCu
RUN pecl install apcu-5.1.8 \
RUN docker-php-ext-enable apcu

