FROM php:7.4-fpm

RUN apt-get update
RUN apt-get install -y zlib1g-dev libjpeg-dev libpng-dev libfreetype6-dev

RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install bcmath

# FANN
RUN apt-get install -qy libfann-dev &&\
    rm -r /var/lib/apt/lists/* &&\
    pecl install fann &&\
    docker-php-ext-enable fann

ENV CASPERJS_VERSION=1.1.3

RUN apt-get update && apt-get install -y fontconfig python tar nodejs bzip2 locales unzip
RUN locale-gen fr_FR.UTF-8
ENV LANG fr_FR.UTF-8
ENV LANGUAGE fr_FR:fr
ENV LC_ALL us_US.UTF-8

# Downloading phantomjs
ADD https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 /tmp/phantomjs-2.1.1-linux-x86_64.tar.bz2

# Installing phantomjs
RUN cd /tmp/ && tar -xjvf /tmp/phantomjs-2.1.1-linux-x86_64.tar.bz2 && cp /tmp/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /bin && chmod +x /bin/phantomjs && rm /tmp/phantomjs-2.1.1-linux-x86_64.tar.bz2

# Installing casperjs
#RUN npm --g add casperjs

# Install node
#RUN apt-get install nodejs npm

# Install node legacy
RUN apt-get install nodejs

# Install bower and grunt cli
#RUN npm --g add bower grunt-cli

RUN mkdir /data
VOLUME /data

## APCu -useless with php7 which already use an opcache
#RUN pecl install apcu-5.1.17 \
#RUN docker-php-ext-enable apcu

