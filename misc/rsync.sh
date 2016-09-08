#!/usr/bin/env bash

if [ "$#" -lt 2 ]; then
	echo "Usage: $0 <source> <destination>"
	exit 1
fi

src=$1
dest=$2

if ! screen -list | grep -q "rsync"; then
	screen -dmS rsync rsync -avz --delete --progress --exclude "/*/.sync/" "$src" "$dest"
fi
