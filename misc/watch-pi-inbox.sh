#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "Usage: $0 <input folder> <output folder>"
	exit 1
fi

source /home/pi/.dotfiles/bash/settings.sh
shopt -s nullglob

input=$1
output=$2

for FILE in "$input"/*; do
	sudo chown root: "$FILE"
	sudo mv "$FILE" "$output"
	filename=$(basename "$FILE")

	if [[ $? -eq 0 ]]; then
		curl -sS \
		-u "$PUSHBULLET_API_KEY:" https://api.pushbullet.com/v2/pushes \
		-d type=note \
		-d title="File added to Sync" \
		-d body="$filename" \
		> /dev/null
	fi
done
