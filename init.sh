#!/bin/bash

writewatched () {
cat <<EOF > ~/.config/qBittorrent/watched_folders.json
{
    "/root/Watch": {
        "add_torrent_params": {
            "category": "",
            "download_limit": -1,
            "download_path": "",
            "operating_mode": "AutoManaged",
            "ratio_limit": -2,
            "save_path": "/root/Watch",
            "seeding_time_limit": -2,
            "skip_checking": false,
            "tags": [
            ],
            "upload_limit": -1,
            "use_auto_tmm": false
        },
        "recursive": false
    }
}
EOF
}

FILE=/install/firstrun
if test -f "$FILE"; then
    rm -f /install/firstrun
    echo "Configuring QBittorrent NoX..."
    timeout 1s sh -c 'echo y | /usr/bin/qbittorrent-nox'
    sed -i 's/^Session\\Port=.*/Session\\Port=55555/' ~/.config/qBittorrent/qBittorrent.conf
    writewatched
    echo "Docker QBittorrent NoX has been installed"
    echo "Please start the container again normally"
    exit 0
fi

echo y | /usr/bin/qbittorrent-nox
