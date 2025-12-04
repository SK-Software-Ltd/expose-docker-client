FROM php:8.2-cli

# Install system deps
RUN apt-get update && apt-get install -y \
    git unzip curl \
    && rm -rf /var/lib/apt/lists/*

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Install Expose client globally
RUN composer global require beyondcode/expose

# Add global composer bin to PATH
ENV PATH="/root/.composer/vendor/bin:${PATH}"

# Copy config file
COPY config.php /app/config.php

# Set config file location
ENV EXPOSE_CONFIG_FILE="/app/config.php"
