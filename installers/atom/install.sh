#!/bin/bash

USER=$(whoami)
HOME="/home/$USER"
SRC="$HOME/.dotfiles/atom"
DEST="$HOME/.atom"
BAK="$HOME/atom.bak"

files="config.cson keymap.cson styles.less"

mkdir -p "$BAK"

for file in $files; do
	if [[ -f "$DEST/$file" ]]; then
		if [[ ! -f "$BAK/$file" ]]; then
			mv $DEST/$file $BAK
			echo "Backed up existing $file"
		else
			rm $DEST/$file
		fi
		ln -s $SRC/$file $DEST/$file && echo "Installed $file"
	else
		echo "Skipped unfound $file"
	fi
done
