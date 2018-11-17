1) Run containers<br>
```
cd provision/local
docker-compose pull
docker-compose up -d
```
2) Get into container<br>
```
docker-compose exec nodejs /bin/sh 
```
3) Install dependencies<br>
```
cd app
npm i
```
4) Run application<br>
```
npm start
```
5) Open http://nodejs.workshop.loc/



