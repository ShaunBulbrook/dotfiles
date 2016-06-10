#!/usr/bin/env bash

alias gc='git commit -m'
alias gp='git push'
alias ga='git add --all --verbose'

g() {
	if [ "$#" -eq 0 ]; then
		/mingw64/bin/git status --short --branch
	else
		/mingw64/bin/git "$@"
	fi
}
