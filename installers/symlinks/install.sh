#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in $NEW
############################

USER=$(whoami)
HOME="/home/$USER"
NEW="$HOME/.dotfiles"
BAK="$HOME/.old-dotfiles"

files="bashrc ansible.cfg gitconfig profile inputrc"

mkdir -p "$BAK"

for file in $files; do
	if [[ -f "$HOME/.$file" ]]; then
		if [[ ! -f "$BAK/.$file" ]]; then
			mv $HOME/.$file $BAK
			echo "Backed up .$file"
		else
			rm $HOME/.$file
		fi
		ln -s $NEW/$file $HOME/.$file && echo "Installed $file"
	else
		echo "Skipped unfound $file"
	fi
done
