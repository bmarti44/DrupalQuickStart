#!/bin/bash

sudo apt-get update
sudo apt-get install lxc-docker git
mkdir drupal
mkdir docker
cd drupal
git clone --branch 8.0.x https://github.com/drupal/drupal.git .
git checkout tags/8.0.0-beta12
mkdir sites/default/files
cp sites/default/default.services.yml sites/default/services.yml
cp sites/default/default.settings.php sites/default/settings.php
cd ../docker
git clone https://github.com/bmarti44/apache-php.git
git clone https://github.com/docker-library/mariadb.git
docker build -t bmarti44/apache-php apache-php/
docker build -t mariadb mariadb/5.5/
sudo docker run -d --name quickstart-mariadb --restart=always -it -p 3306:3306 -e MYSQL_DATABASE=quickstart -e MYSQL_ROOT_PASSWORD=root mariadb
sudo docker run -d --name quickstart-apache --restart=always -it -p 80:80 -e TERM=dumb -e ALLOW_OVERRIDE=true -e APACHE_RUN_USER=quickstart -e APACHE_RUN_GROUP=quickstart -v /var/www/html:/var/www/html --link quickstart-mariadb:mariadb bmarti44/apache-php
