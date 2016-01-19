#!/usr/bin/env bash

echo ps1
PS1='\
\n\
\[\033[${USERNAMECOLOUR}\]\
\h\
\[\033[1;00m\] \
\[\033[${PWDCOLOUR}\]\
\w\
\[\033[1;00m\]\
\n\
$ '
