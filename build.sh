#!/bin/bash

# Install PHP5.4 (with httpd2.4 as dep)
sudo yum -y install php54* --exclude=php54-mysqlnd 

# Install Nginx
sudo yum -y install nginx
# Install PHP-FPM
sudo yum -y install php54-fpm 
# Update all packages
sudo yum -y update

# Overwrite files in /etc and /opt
sudo mkdir /tmp/build
sudo git clone git://github.com/rubas/elasticbeanstalk-nginx-php.git /tmp/build
sudo cp -rf /tmp/build/etc /

# Install Composer
cd /tmp/
sudo curl -s http://getcomposer.org/installer | php
sudo mv composer.phar /usr/bin/composer

# Take ownership
sudo chown -R nginx:nginx /etc/nginx/conf.d \
                                           /usr/bin/composer \
                                           /var/log/nginx \
                                           /var/log/php-fpm

# Clear unneeded files
sudo rm -rf /etc/httpd \
       
       /tmp/build \
       /var/log/httpd \
       /var/log/nginx/* \
       /var/log/php-fpm/*