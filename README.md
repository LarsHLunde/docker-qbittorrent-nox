# docker-qbittorrent-nox
A docker instance of qBittorrent NoX

## How to install
```
git clone https://github.com/LarsHLunde/docker-qbittorrent-nox.git
cd docker-qbittorrent-nox
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
```
## Logging in  
The web interface should be available on http://docker.host.ip.here:8080  
and the username is **admin** and the password is **adminadmin**,  
### Please change both username and password for the admin user  
## Nginx Reverse Proxy
Config for Nginx reverse proxy:  
```
location /qbt/ {
    proxy_pass         http://127.0.0.1:8080/;
    proxy_http_version 1.1;

    # headers recognized by qBittorrent
    proxy_set_header   Host               $proxy_host;
    proxy_set_header   X-Forwarded-For    $proxy_add_x_forwarded_for;
    proxy_set_header   X-Forwarded-Host   $http_host;
    proxy_set_header   X-Forwarded-Proto  $scheme;

    # optionally, you can adjust the POST request size limit, to allow adding a lot of torrents at once
    client_max_body_size 100M;

    # No longer required since qBittorrent v5.1:
    # Since v4.2.2, is possible to configure qBittorrent
    # to set the "Secure" flag for the session cookie automatically.
    # However, that option does nothing unless using qBittorrent's built-in HTTPS functionality.
    # For this use case, where qBittorrent itself is using plain HTTP
    # (and regardless of whether or not the external website uses HTTPS),
    # the flag must be set here, in the proxy configuration itself.
    # Note: If this flag is set while the external website uses only HTTP, this will cause
    # the login mechanism to not work without any apparent errors in console/network resulting in "auth loops".
    proxy_cookie_path  /                  "/; Secure";
}
```
