#!/usr/bin/env bash

function beautify {
	if [ $# -lt 1 ]; then
		echo "Usage: $FUNCNAME <file...>"
		return 1
	fi

	for file in "$@"; do
		js-beautify --jslint-happy --indent-with-tabs --end-with-newline -f "$file" -o "$file"
	done
}
