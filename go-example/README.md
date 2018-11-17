1) Run containers<br>
```
cd provision/local
docker-compose pull
docker-compose up -d
```
2) Get into container<br>
```
docker-compose exec golang /bin/bash 
```
3) Install dependencies<br>
```
cd src/github.com/josephspurrier/gowebapp
go get ./...
```
4) Run application<br>
```
go run gowebapp.go
```
5) Open http://golang.workshop.loc/



