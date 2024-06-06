FROM php:7.4.33-apache

LABEL authors="Mauro Chojrin <mauro.chojrin@leewayweb.com>"

ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN install-php-extensions mysqli
