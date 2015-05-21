# START COLOUR      \[\033[
# END COLOUR        \]

PS1='\
\n\
\[\033[${USERNAMECOLOUR}\]\
\u@\h\
\[\033[1;00m\] \
\[\033[${PWDCOLOUR}\]\
\w\
\[\033[1;00m\]\
\n\
$ '
