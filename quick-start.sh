#!/bin/bash

mkdir ~/DrupalQuickStart
cd ~/DrupalQuickStart

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
cd ../docker
git clone https://github.com/tutumcloud/apache-php.git
git clone https://github.com/docker-library/mariadb.git
vagrant init
vagrant up
