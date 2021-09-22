FROM ubuntu/apache2

RUN apt-get update
RUN DEBIAN_FRONTEND='noninteractive' apt-get install --yes software-properties-common
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y php7.0 php7.0-cgi libapache2-mod-fcgid
RUN apt-get install -y curl vim
RUN a2dismod mpm_event
RUN a2enmod fcgid mpm_worker rewrite

COPY fcgid.conf /etc/apache2/mods-available/
COPY php-wrapper /usr/local/bin/

RUN chmod +x /usr/local/bin/php-wrapper

COPY 000-default.conf /etc/apache2/sites-available/
COPY test.php /var/www/html

RUN service apache2 start

EXPOSE 80

WORKDIR /var/www/html
