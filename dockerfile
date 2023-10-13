FROM php:7.4.33-zts-alpine3.16
#FROM php:8.2-apache-bullseye
RUN apt-get update
RUN apt-get install --yes \
wget=1.21-1+deb11u1 \
ffmpeg=7:4.3.6-0 \
unzip \
librabbitmq-dev

RUN docker-php-ext-install bcmath
RUN docker-php-ext-install sockets


RUN <<EOF
curl --silent --show-error https://getcomposer.org/installer --output /tm/composer-setup.php
php /tm/composer-setup.php --install-dir=/usr/local/bin --filename=composer -version=2.5.6
EOF

RUN composer update
RUN composer install