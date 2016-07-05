#!/usr/bin/env bash

alias ga='git a'
alias gc='git c'
alias gd='git d'
alias gl='git l'
alias gp='git p'

g() {
	if [ "$#" -eq 0 ]; then
		/mingw64/bin/git status --short --branch
	else
		/mingw64/bin/git "$@"
	fi
}
