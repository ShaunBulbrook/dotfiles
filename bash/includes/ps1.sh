#!/usr/bin/env bash

black='\e[0;30m'
red='\e[0;31m'
green='\e[0;32m'
brown='\e[0;33m'
purple='\e[0;35m'
blue='\e[0;34m'
cyan='\e[0;36m'
lightgray='\e[0;37m'
darkgray='\e[1;30m'
lightred='\e[1;31m'
lightgreen='\e[1;32m'
yellow='\e[1;33m'
lightblue='\e[1;34m'
lightpurple='\e[1;35m'
lightcyan='\e[1;36m'
white='\e[1;37m'

usrcol="\e[${USERNAMECOLOUR}"
pwdcol="\e[${PWDCOLOUR}"
r='\e[0m'

PS1="\n${usrcol}\h${r} ${pwdcol}\w${r}\n${darkgray}»${r} "
