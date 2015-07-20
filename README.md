# Drupal 8 Quick Start
Drupal 8 quick start with vagrant, virtual box, and docker. This currrently only works
for mac (I also added an ubuntu script, please test it out and let me know how it works).

# Getting Started
Run the following command in a folder you'd like to contain your drupal install. For the rest
of this readme, we will pretend you ran the command in ~/DrupalQuickStart

For mac
> git clone https://github.com/bmarti44/DrupalQuickStart.git . && chmod +x quick-start-mac.sh && ./quick-start-mac.sh

For ubuntu
> git clone https://github.com/bmarti44/DrupalQuickStart.git . && chmod +x quick-start-ubuntu-14.04.sh && ./quick-start-ubuntu-14.04.sh

# So what just happened?
After the command finishes, you should be able to go to http://localhost:8080 and see your
Drupal installation. This will checkout the 8.0.0-beta12 branch of drupal to ~/DrupalQuickStart/drupal 
and this folder is now mounted as your webroot on the virtual box VM. So to continue setting 
everything up...

1. Go to http://localhost:8080
2. Select your language, timezone, etc.
3. For a database, you can use "quickstart" (without the quotes)
4. The database un/pw you'll use is username: "root" password: "root" (both without quotes)
5. The database server will need to be changed from "localhost" to "mariadb" (without the quotes, oh, and by the way I'm using MariaDB which is an API compatible MySQL replacement, don't worry, it's exactly the same as MySQL but much faster)
6. Wait a bit for it to install and you'll be all set!

The general idea here is I am using homebrew, vagrant, docker, and virtualbox together to provision a development environment.
You're development environment is a docker container running on a virtualbox VM.
Please take a look at the "Usefull commands" section below for accessing the virtualbox VM
and the docker containers running on it. 

# Useful commands
All these commands should be run in the directory where you executed the above install script.
The formatting of the commands below are "command" - explanation, the command does not include
the quotes.

* "vagrant up" - start up your virtualbox VM
* "vagrant halt" - shutdown your virtualbox VM
* "vagrant ssh" - ssh's you into the virualbox VM, this is where docker is installed and you'll run your containers
* "vagrant reload --provision" - reloads your VM and restarts the docker containers running on the VM, you'll want to do this if you make changes to the Vagrantfile, or one of the Dockerfiles
* "docker exec -it quickstart-mariadb /bin/bash" - after ssh'ing into the virtualbox VM using "vagrant ssh", this command runs bash on the maria db instance, you can use "mysql -u root -p" to administer the databases
* "docker exec -it quickstart-apache /bin/bash" - after ssh'ing into the virtualbox VM using "vagrant ssh", this command runs bash on the apache instance, you can use drush (I need to get that installed) to administer drupal, and composer

# Issues/Caveats

* The docker install/build process can take a quite a while, just be patient (one time it took like, 20 minutes, but my computer is kinda slow so...)
* I'm creating a new user called quickstart, with a UID of 1000. Apache runs as the quickstart user. This is because www-data's UID of 33 cannot modify the mounted valume
* I checkout the repos for the docker images, and build them locally. If you want the latest code, go into the /docker folder and do a pull
* Sometimes it takes a little while for the VM to get its network back after a "vagrant reload --provision", give it like 30 seconds after
* The ~/DrupalQuickStart/drupal folder contains a git checkout of 8.0.0-beta12, feel free to replace that with whatever you want. The /drupal folder will be mounted as  

# Still have questions?
If you want to figure out how all this works, take a look at the Vagrantfile in the root of this repo.
The Vagrantfile does most of the heavy lifting, and builds docker images that get cloned into the docker folder. 
If you want to modify the containers, change the Dockerfiles in apache-php and mariadb folders, and run the "vagrant reload --provision" command
to provision the containers again. This is my first time using docker and vagrant so please let me know if you have any recommendations

Contact me at brian@brianmartin.com
