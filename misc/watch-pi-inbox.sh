#!/usr/bin/env bash

if [ "$#" -lt 2 ]; then
	echo "Usage: $0 <input folder> <output folder>"
	exit 1
fi

. /home/pi/.dotfiles/settings.sh
shopt -s nullglob

input=$1
output=$2

find "$input" -type f -not -path '*/\.*' -print0 | while IFS= read -r -d $'\0' FILE; do
	filename=$(basename "$FILE")

	if [ ! -f "$output/$filename" ]; then
		mv "$FILE" "$output"

		if [[ $? -eq 0 ]]; then
			curl -sS \
			-u "$PUSHBULLET_API_KEY:" https://api.pushbullet.com/v2/pushes \
			-d type=note \
			-d title="File added to Sync" \
			-d body="$filename" \
			> /dev/null
		fi
	fi
done
