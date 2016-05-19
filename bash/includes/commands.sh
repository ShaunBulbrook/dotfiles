#!/usr/bin/env bash

alias get='apt-get install'
alias updateall='sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove -y && sudo apt-get clean'
alias ssh-forget='ssh-keygen -f "~/.ssh/known_hosts" -R '
alias gist='gist -op'
