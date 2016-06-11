#!/usr/bin/env bash

alias ga='git add --all --verbose'
alias gc='git commit -m'
alias gd='git diff'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset%C(yellow)%d%Creset %s %Cgreen(%an)%Creset' -n 10"
alias gp='git push'

g() {
	if [ "$#" -eq 0 ]; then
		/mingw64/bin/git status --short --branch
	else
		/mingw64/bin/git "$@"
	fi
}
