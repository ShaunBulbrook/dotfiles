#!/usr/bin/env bash
#--------------------------------------------------------------------------
# Install
#--------------------------------------------------------------------------
#
# Installs all configuration.
#
#
DFD="$HOME/.dotfiles"
[ -f "$HOME/.dotfiles/.env" ] && source "$HOME/.dotfiles/.env"

# Copies all link files to their dot-prefixed equivalent.
# I.e, config/link/bashrc => ~/.bashrc
for f in $DFD/config/link/*; do
	file="$HOME/.$(basename "$f")"
	rm "$file" 2> /dev/null
	cp "$f" "$file"
	echo ":: $file"
done

# Copies all Atom configuration.
for f in $DFD/config/atom/*; do
	file="$HOME/.atom/$(basename "$f")"
	rm "$file" 2> /dev/null
	cp "$f" "$file"
	echo ":: $file"
done

# Copies SSH configuration.
cp $DFD/config/ssh/config "$HOME/.ssh/config"
echo ":: $HOME/.ssh/config"

# Creates gitconfig.
cp "$DFD/config/git/gitconfig" "$DFD/tmp"
[ -z "$GIT_EMAIL" ] && _if_email=';'
[ -z "$GIT_NAME" ] && _if_name=';'
[ -z "$GIT_SIGNING_KEY" ] && _if_key=';'
sed -i "s/{{ _if_email }}/$_if_email/g" "$DFD/tmp"
sed -i "s/{{ GIT_EMAIL }}/$GIT_EMAIL/g" "$DFD/tmp"
sed -i "s/{{ _if_name }}/$_if_name/g" "$DFD/tmp"
sed -i "s/{{ GIT_NAME }}/$GIT_NAME/g" "$DFD/tmp"
sed -i "s/{{ _if_key }}/$_if_key/g" "$DFD/tmp"
sed -i "s/{{ GIT_KEY }}/$GIT_SIGNING_KEY/g" "$DFD/tmp"
sed -i "s/{{ GIT_EDITOR }}/$GIT_EDITOR/g" "$DFD/tmp"
mv "$DFD/tmp" "$HOME/.gitconfig"
echo ":: $HOME/.gitconfig"

# Creates a sample .env file.
if [ ! -f "$DFD/.env" ]; then
	cp "$DFD/example.env" "$DFD/.env"
	echo "Created .env file. Update this with your own settings, then run 'dotfiles reload'."
fi
