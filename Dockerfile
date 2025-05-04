FROM debian:12-slim
RUN mkdir /root/Watch
RUN mkdir /root/Downloads
RUN mkdir /script
RUN mkdir /install
RUN touch /install/firstrun
RUN apt-get update
RUN apt-get install -y dialog qbittorrent-nox
VOLUME ["/root/Watch", "/root/Downloads", "/root/.config/qBittorrent", "/root/.local/share/qBittorrent/BT_backup/"]
ADD init.sh /script/
EXPOSE 8080/tcp
EXPOSE 55555/tcp
ENTRYPOINT ["/bin/bash", "/script/init.sh"]
