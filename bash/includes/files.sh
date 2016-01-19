#!/usr/bin/env bash

alias reconfig='source ~/.bashrc'
alias exify='chmod u+x'
alias gpgify='gpg --encrypt --recipient $GPGKEY --trust-model always --armor'
alias tmp='cd $(mktemp -d)'

rewrite() {
    echo "" > $1
    nano $1
}
