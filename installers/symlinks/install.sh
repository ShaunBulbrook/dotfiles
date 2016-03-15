#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in $DOTFILES
############################

DOTFILES="$HOME/.dotfiles"
BAK="$HOME/.old-dotfiles"

files="ansible.cfg bashrc gitconfig hgrc inputrc jshintrc minttyrc profile"

mkdir -p "$BAK"

for file in $files; do
	if [[ -f "$HOME/.$file" ]]; then
		if [[ ! -f "$BAK/.$file" ]]; then
			mv $HOME/.$file $BAK
			echo "Backed up .$file"
		else
			rm $HOME/.$file
		fi
		ln -s $DOTFILES/conf/$file $HOME/.$file && echo "Installed $file"
	else
		echo "Skipped unfound $file"
	fi
done
