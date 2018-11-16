Workshop flow:<br>
1) [Install Docker](InstallDocker.md)<br>
2) [Configure hosts](localproxy/HOSTS.md)<br>
Optional [Configure DNSMasq](localproxy/DNSMASQ.md) (All .loc domains will point to 127.0.0.1)<br>
3) Create docker bridge network
```
docker network create localnet
```
4) Run proxy 
```
cd localproxy
docker-compose up -d
cd ..
```
5) Run php-example
```
#create folder for drupal files
mkdir php-example/app/docroot/sites/default/files
#change owner of files folder to www-data 
sudo chown -R 82:82 php-example/app/docroot/sites/default/files
#Run containers
cd php-example/provision/local
docker-compose pull
docker-compose up -d
```
open http://php.workshop.loc and follow Drupal installer instructions

