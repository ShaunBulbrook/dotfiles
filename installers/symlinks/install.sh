#!/usr/bin/env bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in $DOTFILES
############################

DOTFILES="$HOME/.dotfiles"
BAK="$HOME/.old-dotfiles"

# mkdir -p "$BAK"

CONFS="$DOTFILES/conf/*"

for f in $CONFS; do

	file="$HOME/.$(basename "$f")"

	if [[ -e "$file" ]]; then
		rm "$file"
	fi

	ln -s "$f" "$file" && echo "Installed $file"

done
