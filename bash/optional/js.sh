#!/usr/bin/env bash

PATH="$PATH:~/.npm-global:~/.npm-global/bin"

function beautify {
	if [ $# -lt 1 ]; then
		echo "Usage: $FUNCNAME <file...>"
		return 1
	fi

	for file in "$@"; do
		js-beautify --config "~/.jsbeautifyrc" -f "$file" -o "$file"
	done
}
