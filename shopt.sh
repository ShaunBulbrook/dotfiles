#!/usr/bin/env bash

shopt -s checkwinsize

shopt -s histappend
HISTCONTROL=ignoreboth
HISTTIMEFORMAT="%h %d %H:%M:%S> "
HISTIGNORE="exit"
HISTSIZE=3000
HISTFILESIZE=6000
