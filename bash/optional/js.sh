#!/usr/bin/env bash

function beautify {
	if [ $# -lt 1 ]; then
		echo "Usage: $FUNCNAME <file...>"
		return 1
	fi

	for file in "$@"; do
		js-beautify --config "~/.jsbeautifyrc" -f "$file" -o "$file"
	done
}

function hgbeautify {
	dir=$(pwd)

	command cd $(hg root) # Use inbuilt to prevent LS after CD
	hg status --no-status | while read FILE; do
		if [ -f "$FILE" ]; then
			beautify $FILE
		else
			echo "Err: $FILE not found"
		fi
	done

	command cd $dir
}

function hglint {
	dir=$(pwd)

	command cd $(hg root) # Use inbuilt to prevent LS after CD
	hg status --no-status | while read FILE; do
		if [ -f "$FILE" ] && [ ${FILE: -3} == ".js" ]; then
			jshint "$FILE"
		else
			echo "Skipped $FILE"
		fi
	done
	command cd $dir
}
