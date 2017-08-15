FROM alpine:edge

ENV S6_VERSION v1.20.0.0
ENV S6_ARCHITECTURE amd64

# Add NGINX-Webserver with NAXSI
RUN apk upgrade -U && apk --update \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    add \
        curl \
        bash \
        tar \
        nginx \
        shadow \
        openssl \
        php7 \
        php7-xml \
        php7-xsl \
        php7-pdo \
        php7-mcrypt \
        php7-curl \
        php7-json \
        php7-fpm \
        php7-phar \
        php7-openssl \
        php7-mysqli \
        php7-ctype \
        php7-opcache \
        php7-mbstring \
        php7-session \
        php7-pcntl

ADD /rootfs /

# Add S6-overlay to use S6 process manager
# https://github.com/just-containers/s6-overlay/#the-docker-way
RUN curl -o /tmp/s6-overlay.tar.gz -L "https://github.com/just-containers/s6-overlay/releases/download/${S6_VERSION}/s6-overlay-${S6_ARCHITECTURE}.tar.gz" && \
    tar xfz /tmp/s6-overlay.tar.gz -C /

# Small fixes
RUN ln -s /etc/php7 /etc/php && \
    ln -s /usr/sbin/php-fpm7 /usr/bin/php-fpm && \
    ln -s /usr/lib/php7 /usr/lib/php && \
    rm -fr /var/cache/apk/* && \
    usermod -u 1000 nginx

# Install composer global bin
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

# Expose Ports
EXPOSE 443
EXPOSE 80

VOLUME /var/www /var/log

ENTRYPOINT ["/init"]