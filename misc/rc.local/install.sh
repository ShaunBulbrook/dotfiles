#!/usr/bin/env bash
#--------------------------------------------------------------------------
# rc.local
#--------------------------------------------------------------------------
#
# Sends boot notifications to a given Pushbullet API key
#
#

if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <Telegram config string>"
	exit 1
fi

TELEGRAM_CONFIG=$1

IFS='|' read chatID token <<< "$TELEGRAM_CONFIG"

cp rc.local rc.local.temp
chmod 755 rc.local.temp
sed -i "s/XXCHATIDXX/$chatID/g" rc.local.temp
sed -i "s/XXTOKENXX/$token/g" rc.local.temp

echo "Moving new rc.local to real location - password may be required"

sudo mv rc.local.temp /etc/rc.local
sudo chown root: /etc/rc.local
