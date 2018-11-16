1) create folder for drupal files<br>
```
cd php-example
mkdir app/docroot/sites/default/files

#change owner of files folder to www-data
sudo chown -R 82:82 app/docroot/sites/default/files
```
2) create settings.php file
```
cp app/docroot/sites/default/default.settings.php app/docroot/sites/default/settings.php

#change owner of file to www-data
sudo chown -R 82:82 app/docroot/sites/default/settings.php
```

3) Run containers<br>
```
cd provision/local
docker-compose pull
docker-compose up -d
```
4) Get generated mysql password (It will be used later)<br>
```
docker-compose logs mariadb | grep "GENERATED ROOT PASSWORD:"
```

5) Open http://php.workshop.loc/core/install.php?langcode=en and follow Drupal installer instructions<br>
6) For database setup use following db credentials:<br>
```
host: mariadb
user: root
pass: <was get at point 3>
db: drupal
```

