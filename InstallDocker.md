# Ubuntu
## Install Docker

```
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

#remove script after successful installation
rm get-docker.sh
#Start docker service
sudo service docker start

# Replace placeholder with your username
sudo usermod -a -G docker <your username>

# Re-read user's group list 
su - $USER

# or Re-login or reboot before continue.
```

## Install Docker-Compose
```
# Download it and give exec permission
sudo curl -L https://github.com/docker/compose/releases/download/1.23.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

# MAC OSX

Download and Install Docker and Docker-Compose 
```
https://download.docker.com/mac/stable/Docker.dmg
```

# WINDOWS

Download and Install Docker and Docker-Compose 
```
https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe
```
