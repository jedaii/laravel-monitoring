FROM php:7.4-fpm

# Arguments defined in docker-compose.yml
ARG MYUSER=user
ARG MYUID=1000
# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create system user to run Composer and Artisan Commands
RUN useradd -G www-data,root -u $MYUID -d /home/$MYUSER $MYUSER
RUN mkdir -p /home/$MYUSER/.composer && \
    chown -R $MYUSER:$MYUSER /home/$MYUSER

# Set working directory
WORKDIR /var/www

USER $MYUSER
