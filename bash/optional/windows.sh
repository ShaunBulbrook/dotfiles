#!/usr/bin/env bash

nano() {
	if [ "$#" -lt 1 ]; then
		echo "Usage: $FUNCNAME <file>"
	else
		("/c/Program Files (x86)/Notepad++/notepad++.exe" "$1" -multiInst -nosession &)
	fi
}
