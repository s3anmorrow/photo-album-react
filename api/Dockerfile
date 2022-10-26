# build Docker image with command: docker build -t api-server .
# start up container with command: docker run -i -t -p 80:80 api-server
FROM php:7.4-apache

RUN apt-get update && apt-get upgrade -y \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# setting up CORs permissions on the container
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli \
    && a2enmod headers \
    && sed -ri -e 's/^([ \t]*)(<\/VirtualHost>)/\1\tHeader always set Access-Control-Allow-Origin "*"\n\tHeader always set Access-Control-Allow-Methods "GET, POST, OPTIONS, DELETE, PUT"\n\tHeader always set Access-Control-Allow-Headers "X-Requested-With, Content-Type, Origin, Authorization, Accept, Client-Security-Token, Accept-Encoding"\n\1\2/g' /etc/apache2/sites-available/*.conf

# setup working directory on container (server) for all commands after this
WORKDIR /var/www/html
# copy over all files in current folder (/server)
COPY . /var/www/html/

# this exposes the port 80 that the apache server runs on to the outside of the container - need to specify the port from the outside that gets routed to this port via the docker run command when running the container
EXPOSE 80