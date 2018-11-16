1) Create docker bridge network
```
docker network create localnet
```

2) [Configure hosts records](HOSTS.md)<br> 
    or <br>
   Optional [Configure DNSMasq](localproxy/DNSMASQ.md) (All .loc domains will point to 127.0.0.1)<br>
3) Run containers<br>
```
cd localproxy
docker-compose up -d
```
Done!
