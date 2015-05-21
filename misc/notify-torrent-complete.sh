#!/bin/bash
source /home/pi/.dotfiles/bash/settings.sh

curl \
	-u "$PUSHBULLET_API_KEY:" https://api.pushbullet.com/v2/pushes \
	-d type=note \
	-d title="Torrent complete" \
	-d body="$TR_TORRENT_NAME" \
	> /dev/null
exit 0
