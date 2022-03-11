#!/bin/bash

wget https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/amd64/docker-ce-cli_20.10.9~3-0~ubuntu-focal_amd64.deb
wget https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/amd64/docker-ce_20.10.9~3-0~ubuntu-focal_amd64.deb
wget https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/amd64/containerd.io_1.4.9-1_amd64.deb

sudo dpkg -i docker-ce-cli_20.10.9~3-0~ubuntu-focal_amd64.deb
sudo dpkg -i containerd.io_1.4.9-1_amd64.deb
sudo dpkg -i docker-ce_20.10.9~3-0~ubuntu-focal_amd64.deb

rm docker-ce-cli_20.10.9~3-0~ubuntu-focal_amd64.deb
rm containerd.io_1.4.9-1_amd64.deb
rm docker-ce_20.10.9~3-0~ubuntu-focal_amd64.deb

sudo docker run hello-world

sudo docker pull synomi/thingspeak
sudo docker run --name mysql55 -e MYSQL_ROOT_PASSWORD=speak -d mysql:5.5
sudo docker run --name thingspeak -p 80:80 --link mysql55:mysql -d synomi/thingspeak
