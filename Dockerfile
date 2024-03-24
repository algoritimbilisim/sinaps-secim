FROM php:8.2-apache

RUN apt-get update 

# GD eklentisini yükle
RUN apt-get install -y libpng-dev && \
    docker-php-ext-install gd

RUN apt-get install -y \
    libzip-dev \
    && docker-php-ext-install zip pdo_mysql \
    && a2enmod rewrite

 
WORKDIR /var/www/html
