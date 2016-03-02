#!/usr/bin/env bash

if [ "$#" -ne 2 ]; then
	echo "Usage: $0 <path> <destination>"
	exit 1
fi

path=$(readlink -f "$1")
destination=$(readlink -f "$2")

# Empty all finished folders
find "$path" -empty -type d -delete
mkdir -p "$path"

find "$path" -type f -print0 | while IFS= read -r -d $'\0' filepath; do
	filename=$(basename "$filepath")
	fullpath=$(readlink -f "$filepath")
	hash=$(md5sum "$fullpath" | awk '{print $1}')

	if ! screen -list | grep -q "rsync_$hash"; then
		screen -dmS "rsync_$hash" rsync --progress --remove-source-files "$fullpath" "$destination/$filename"
	fi
done
