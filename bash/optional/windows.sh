#!/usr/bin/env bash

nano() {
	if [ "$#" -lt 1 ]; then
		echo "Usage: $FUNCNAME <file>"
	else
		("/c/Program Files/Notepad++/notepad++.exe" "$1" -multiInst -nosession &)
	fi
}
