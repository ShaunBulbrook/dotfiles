#!/usr/bin/env bash

alias get='apt-get install'
alias updateall='sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove -y && sudo apt-get clean'
alias ssh-forget='ssh-keygen -f "~/.ssh/known_hosts" -R '
alias gist='gist -op'

nano() {
	if [ "$#" -lt 1 ]; then
		echo "Usage: $FUNCNAME <file>"
	else
		("/c/Program Files (x86)/Notepad++/notepad++.exe" "$1" -notabbar -multiInst -nosession &)
	fi
}
