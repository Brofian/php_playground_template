# Start with the default php fpm image
FROM php:fpm

# Install composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

#   install pdo and pdo_mysql
RUN docker-php-ext-install pdo pdo_mysql

# Update and Upgrade
RUN apt-get update && \
	apt-get upgrade -y

# Install git (you should not use it inside of the container... but you could... just saying)
RUN apt-get install -y git

# Install zip and unzip, just in case
RUN apt-get install -y zip
RUN apt-get install -y unzip

# Install vim, to have at least some editor installed
RUN apt-get install -y vim