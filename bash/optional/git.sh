#!/usr/bin/env bash

alias ga='git a'
alias gc='git c'
alias gd='git d'
alias gf='git f'
alias gl='git l'
alias gp='git p'

git="`which git`"

g() {
	if [ "$#" -eq 0 ]; then
		$git status --short --branch
	else
		$git "$@"
	fi
}
