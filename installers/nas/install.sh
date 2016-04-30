#!/usr/bin/env bash

sudo apt-get install cifs-utils
sudo mkdir -p /media/nas
touch /home/pi/.smbcredentials
echo "//192.168.0.102/media/Videos /media/nas cifs credentials=/home/pi/.smbcredentials,uid=1000,gid=1000,iocharset=utf8 0 0"
