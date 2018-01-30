FROM php:7.0-fpm
RUN apt-get update && apt-get install -y \
    # GD
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    # Mcrypt
    libmcrypt-dev \
    # Curl
    libssl-dev \
    libcurl4-openssl-dev \
    # xml
    libxml2-dev \
    # bzip2
    libbz2-dev \
    # GMP
    libgmp3-dev \
    # intl
    libicu-dev \
    # memcached
    libmemcached-dev \
    # imagick
    libmagickwand-dev \
    libmagickcore-dev \
  && docker-php-ext-install -j$(nproc) \
    mysqli \
    curl \
    mcrypt \
    mbstring \
    zip \
    xml \
    bz2 \
    gmp \
    bcmath \
    intl \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install -j$(nproc) gd \
  && pecl install \
    igbinary-2.0.5 \
    memcached-3.0.4 \
    imagick-3.4.3 \
  && docker-php-ext-enable \
    memcached \
    igbinary \
    imagick
