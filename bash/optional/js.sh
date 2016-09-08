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
