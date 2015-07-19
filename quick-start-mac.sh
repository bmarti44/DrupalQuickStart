#!/bin/bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update && brew uninstall brew-cask && brew install brew-cask && brew cleanup && brew cask cleanup
brew cask install virtualbox
brew cask install vagrant
brew cask install vagrant-manager
vagrant box add ubuntu/trusty64
mkdir drupal
mkdir docker
cd drupal
git clone --branch 8.0.x http://git.drupal.org/project/drupal.git .
git checkout tags/8.0.0-beta12
mkdir sites/default/files
cp sites/default/default.services.yml sites/default/services.yml
cp sites/default/default.settings.php sites/default/settings.php
cd ../docker
git clone https://github.com/bmarti44/apache-php.git
git clone https://github.com/docker-library/mariadb.git
vagrant up
