#!/usr/bin/env bash

r="\e[0m"
bold="\e[1m"
dim="\e[2m"

black="\e[30m"
red="\e[31m"
green="\e[32m"
yellow="\e[33m"
blue="\e[34m"
magenta="\e[35m"
cyan="\e[36m"
lightgray="\e[37m"
darkgray="\e[90m"
lightred="\e[91m"
lightgreen="\e[92m"
lightyellow="\e[93m"
lightblue="\e[94m"
lightmagenta="\e[95m"
lightcyan="\e[96m"
white="\e[97m"

usrcol="${!USERNAMECOLOUR}"
pwdcol="${!PWDCOLOUR}"

PS1=''

PS1+="\n${usrcol}\h${r} ${pwdcol}\w${r}"

PS1+="${lightgray}"
PS1+='`__git_ps1`'
PS1+="${r}"

PS1+="\n${darkgray}»${r} "

export PS1

# export PS1="\\w\$(__git_ps1 '(%s)') \$ "
