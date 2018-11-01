This is a Vagrant project based on centos/7 image.
It sets up docker and docker-compose.
Docker is used to deploy these imgages:
- glassfish 5 - application server for Dev usage
- postgresql 11 - relational database for Dev usage
- adminer - web application to administer database
- gitea - simple gitlab-like application for version control system
- mariadb - database for gitea

Services became available on your local machine (localhost). All docker services share same network environment and are isolated from the host (vagrant VM) 
and available to each other by service names.

glassfish 
forwarded ports: 
4848 admin panel
80 http
8181 https
domain data(configuration, logs etc.) available in the directory web
service names - lab_web,web

postgresql 11
has no forwarded ports
postgresql database data available outside docker image in the vagrant VMs path 
/var/lib/docker/volumes/pgdata/_data
login to vagrant VM to reach it.
service names - lab_db,db

adminer
forwarded ports:
8088
service names - lab_adminer,adminer

gitea
forwarded ports:
3000 - web application
2222 - ssh access
service names - lab_gitea,gitea

gitea_db
forwarded ports:
service names - lab_gitea_db,gitea_db

Usage.
Install vagrant on your local system https://www.vagrantup.com/
Go to directory of the project environment - 
#cd glassfish

#vagrant plugin install vagrant-vbguest - installs a Vagrant plugin which automatically installs the host's VirtualBox Guest Additions on the guest system 

#vagrant up - starts this environment

#vagrant ssh - login to VM.

Other usefull commands:
#vagrant reload --provision - reloads and provision changes to vagrant and docker configuration.
#vagrant halt - stops this environment
