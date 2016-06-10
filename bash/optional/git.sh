#!/usr/bin/env bash

alias gc='git commit -m'
alias gp='git push'
alias ga='git add --all --verbose'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit -n 10"

g() {
	if [ "$#" -eq 0 ]; then
		/mingw64/bin/git status --short --branch
	else
		/mingw64/bin/git "$@"
	fi
}
