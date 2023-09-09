#!/bin/sh

# update new package
sudo apt update
sudo apt install snapd -y

# change dns port
sudo mkdir -p /etc/systemd/resolved.conf.d
sudo tee /etc/systemd/resolved.conf.d/adguardhome.conf <<EOF
[Resolve]
DNS=127.0.0.1
DNSStubListener=no
EOF

sudo mv /etc/resolv.conf /etc/resolv.conf.backup
sudo ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf
sudo systemctl reload-or-restart systemd-resolved

# install newrelic


# install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# install adguardhome via dockere
sudo mkdir adguardhome
cd adguardhome
docker run --name adguardhome\
    --restart unless-stopped\
    -v ./:/opt/adguardhome/work\
    -v ./:/opt/adguardhome/conf\
    -p 53:53/tcp -p 53:53/udp\
    -p 80:80/tcp -p 443:443/tcp -p 443:443/udp -p 3000:3000/tcp\
    -d adguard/adguardhome