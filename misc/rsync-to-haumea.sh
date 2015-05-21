#!/bin/bash
source /home/pi/.dotfiles/bash/settings.sh

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 filename"
	exit 1
fi

rsync \
	-avz \
	-e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" \
	$1 \
	192.168.1.23:/home/pi/inbox \
	--remove-source-files \
    --progress

if [[ $? -eq 0 ]]; then
    TITLE="Sent to Haumea"
else
    TITLE="Rsync failed"
fi

curl \
-u "$PUSHBULLET_API_KEY:" https://api.pushbullet.com/v2/pushes \
	-d type=note \
	-d title="$TITLE" \
	-d body="$1" \
> /dev/null
