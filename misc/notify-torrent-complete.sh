#!/usr/bin/env bash
. /home/pi/.dotfiles/settings.sh

id=$1
name=$2
path=$3

bash $path/../rsyncmv.sh $path /media/nas/torrents

curl \
		-u "$PUSHBULLET_API_KEY:" https://api.pushbullet.com/v2/pushes \
		-d type=note \
		-d title="Torrent complete" \
		-d body="$name" \
		> /dev/null
exit 0
