#!/usr/bin/env bash
#--------------------------------------------------------------------------
# Aliases
#--------------------------------------------------------------------------
#
# Shorthand commands.
#
#

# Defined as aliases to prevent infinite loops.
alias ls='ls --color -F --group-directories-first'
alias grep='grep --color=auto'
alias less='less -r'

# Git shorthands
alias ga='git a'
alias gc='git c'
alias gd='git d'
alias gf='git f'
alias gp='git p'
alias gpf='git pf'

# Git tab completion
__git_complete gc _git_checkout
__git_complete g _git

function reload() {
	clear; source "$HOME/.bashrc"
}

function please() {
	sudo "$(history -p \!\!)"
}

function repeat() {
	watch -n 1 "$(history -p \!\!)"
}

function exify() {
	chmod u+x
}

function tmp() {
	cd "$(mktemp -d)"
}

function line() {
	sed -n "$1p"
}

function g() {
	if [ "$#" -eq 0 ]; then
		git status --short --branch
	else
		git "$@"
	fi
}

function up() {
	COUNTER=$1
	while [[ $COUNTER -gt 0 ]]
	do
		UP="${UP}../"
		COUNTER=$(( $COUNTER -1 ))
	done
	echo "cd $UP"
	cd $UP
	UP=''
}

function cd() {
	new_directory="$*";
	if [ $# -eq 0 ]; then
		new_directory=${HOME};
	fi;
	builtin cd "${new_directory}" && ls
}

function mkcd() {
	mkdir "$*" && cd "$*"
}

function temp() {
	/opt/vc/bin/vcgencmd measure_temp
}

function vms() {
	vagrant global-status --prune
}

function vm() {
	if [ "$#" -eq 0 ]; then
		vagrant status
	else
		vagrant "$@"
	fi
}

function explorer() {
	if [ "$#" -eq 0 ]; then
		gtk-launch nautilus .
	else
		gtk-launch nautilus "$@"
	fi
}
