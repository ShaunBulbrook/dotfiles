#!/usr/bin/env bash

if [ "$#" -lt 2 ]; then
	echo "Usage: $0 <input folder> <output folder>"
	exit 1
fi

. /home/pi/.dotfiles/.env
shopt -s nullglob

IFS='|' read chatID token <<< "$TELEGRAM_CONFIG"

input=$1
output=$2

find "$input" -type f -not -path '*/\.*' -print0 | while IFS= read -r -d $'\0' FILE; do
	filename=$(basename "$FILE")

	if [ ! -f "$output/$filename" ]; then
		mv "$FILE" "$output"

		if [[ $? -eq 0 ]]; then
			text="File added to Sync%0A$filename"
			curl -sS "https://api.telegram.org/bot$token/sendMessage?chat_id=$chatID&text=$text" > /dev/null
		fi
	fi
done
