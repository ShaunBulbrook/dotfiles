#!/bin/bash
source /home/pi/.dotfiles/bash/settings.sh

# Expand * to null if none found
shopt -s nullglob

for FILE in /home/pi/inbox/*; do
	sudo chown root: $FILE
	sudo mv $FILE /media/sync/Dan\ -\ Torrents/inbox

	if [[ $? -eq 0 ]]; then
		curl \
		-u "$PUSHBULLET_API_KEY:" https://api.pushbullet.com/v2/pushes \
		-d type=note \
		-d title="File added to Sync" \
		-d body="$(basename $FILE)" \
		> /dev/null
	fi
done
