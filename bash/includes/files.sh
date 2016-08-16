#!/usr/bin/env bash

alias reconfig='source ~/.bashrc; clear'
alias exify='chmod u+x'
alias gpgify='gpg --encrypt --recipient $GPGKEY --trust-model always --armor'
alias tmp='cd $(mktemp -d)'

line() {
	sed -n "$1p"
}

rewrite() {
	echo "" > $1
	nano $1
}
