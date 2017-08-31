#!/usr/bin/env bash

# Enable the * in `__git_ps1` when uncommited files
export GIT_PS1_SHOWDIRTYSTATE=1

reset="\[\e[0m\]"
usercol="\[\e[${USERNAMECOLOUR}m\]"
pwdcol="\[\e[${PWDCOLOUR}m\]"

PS1="\n${usercol}\h${reset} ${pwdcol}\w${reset}"

PS1+="\[\e[33m\]"
PS1+='`__git_ps1 " %s"`'
PS1+="${reset}"

PS1+="\n\[\e[90m\]>${reset} "

export PS1
