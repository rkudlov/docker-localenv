#Ubuntu

Create file /etc/NetworkManager/dnsmasq.d/local-tld and add to it
```
# Map all .loc domains to 127.0.0.1
address=/.loc/127.0.0.1
```
Save and close the file.
```
sudo service NetworkManager restart
```
If you got 'NetworkManager: unrecognized service' error, run instead:
```
sudo service network-manager restart
```

try ping google.loc

Done!

# MAC OSX

1) Install it.

```
brew install dnsmasq
mkdir -pv $(brew --prefix)/etc/
```

2) Open config

```
vi $(brew --prefix)/etc/dnsmasq.conf
```

3) Add code to the file (for .loc masq):

```
# Map all .loc domains to 127.0.0.1
address=/.loc/127.0.0.1
```

4) Save and close the file.

5) Make autostart for dnsmasq

```
sudo cp -v $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist /Library/LaunchDaemons
sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
sudo mkdir -v /etc/resolver
sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/dev'
```

5) Add local DNS to search order in System Preferences:

Open:

> System Preferences > Network > Wi-Fi (or whatever you use) > Advanced... > DNS 

add "127.0.0.1" to top of the list.

6) If Docker is running, restart Docker (little icon on top of the screen)

```

try ping google.loc

DONE!


