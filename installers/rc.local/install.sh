#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <Pushbullet API key>"
	exit 1
fi

KEY=$1

cp rc.local rc.local.temp
sed -i "s/XXAPIKEYXX/$KEY/g" rc.local.temp

echo "Moving new rc.local to real location - password may be required"

sudo mv rc.local.temp /etc/rc.local
sudo chown root: /etc/rc.local
