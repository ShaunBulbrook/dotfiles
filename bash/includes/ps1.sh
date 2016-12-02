#!/usr/bin/env bash

# Enable the * in `__git_ps1` when uncommited files
export GIT_PS1_SHOWDIRTYSTATE=1

r="\[\e[0m\]"
bold="\[\e[1m\]"
dim="\[\e[2m\]"

black="\[\e[30m\]"
red="\[\e[31m\]"
green="\[\e[32m\]"
yellow="\[\e[33m\]"
blue="\[\e[34m\]"
magenta="\[\e[35m\]"
cyan="\[\e[36m\]"
lightgray="\[\e[37m\]"
darkgray="\[\e[90m\]"
lightred="\[\e[91m\]"
lightgreen="\[\e[92m\]"
lightyellow="\[\e[93m\]"
lightblue="\[\e[94m\]"
lightmagenta="\[\e[95m\]"
lightcyan="\[\e[96m\]"
white="\[\e[97m\]"

PS1="\n${bold}${!USERNAMECOLOUR}\h${r} ${!PWDCOLOUR}\w${r}"

PS1+="${yellow}"
PS1+='`__git_ps1 " %s"`'
PS1+="${r}"

PS1+="\n${bold}${darkgray}»${r} "

export PS1
