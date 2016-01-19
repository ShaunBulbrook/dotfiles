# ======================
# DEFAULT BASHRC STUFF
# ======================
case $- in
    *i*) ;;
      *) return;;
esac

shopt -s checkwinsize
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable bash completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# ======================
# BEGIN OWN STUFF
# ======================

dfd="$HOME/.dotfiles"
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"

if [[ -f ${dfd}/bash/settings.sh ]]; then
    source ${dfd}/bash/settings.sh
else
    source ${dfd}/bash/settings.default.sh
    echo "Using default settings. Fix:"
    echo "cp ~/.dotfiles/bash/settings.default.sh ~/.dotfiles/bash/settings.sh"
fi

if [ -d ${dfd}/bash/includes ]; then
    for f in ${dfd}/bash/includes/*.sh; do
        source $f
    done
fi

# Set terminal title if using xterm
# After reading PS1 from includes, above
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

for f in $OPTIONALS; do
    source ${dfd}/bash/optional/$f.sh
done
