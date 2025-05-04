# docker-qbittorrent-nox
A docker instance of qBittorrent NoX

## How to install
```
git clone https://github.com/LarsHLunde/docker-qbittorrent-nox.git
cd qbittorrent-nox
docker build -t qbittorrent-nox .
docker run -t \
  -v /root/qBittorrent/Watch:/root/Watch \
  -v /root/qBittorrent/Downloads:/root/Downloads \
  -v /root/qBittorrent/Config:/root/.config/qBittorrent \
  -v /root/qBittorrent/Session:/root/.local/share/qBittorrent/BT_backup \
  -p 8080:8080 \
  -p 55555:55555 \
  --name qbittorrent-nox \
  --restart unless-stopped \
  qbittorrent-nox
docker start qbittorrent-nox
```
## Logging in  
The web interface should be available on http://docker.host.ip.here:8080  
and the username is **admin** and the password is **adminadmin**,  
### Please change both username and password for the admin user  
