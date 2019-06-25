
FROM phpearth/php:7.2
LABEL maintainer="hitalos <hitalos@gmail.com>"

# Comment this to improve stability on "auto deploy" environments
RUN apk update && apk upgrade

# Install basic dependencies
RUN apk -u add bash git

# Install PHP extensions
ADD install-php.sh /usr/sbin/install-php.sh
ENV XDEBUG_VERSION 2.7.2
RUN /usr/sbin/install-php.sh

RUN mkdir -p /etc/ssl/certs && update-ca-certificates

WORKDIR /var/www
CMD ["/usr/local/bin/php"]