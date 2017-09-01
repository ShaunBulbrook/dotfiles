#!/usr/bin/env bash
#--------------------------------------------------------------------------
# Install
#--------------------------------------------------------------------------
#
# Installs all configuration.
#
#
DFD="$HOME/.dotfiles"

# Creates a sample .env file.
if [ -f "$DFD/.env" ]; then
	source "$DFD/.env"
else
	cp "$DFD/example.env" "$DFD/.env"
	echo "Created .env file. Update this with your own settings, then run 'dotfiles reload'."
fi

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

# Creates gitconfig.
[ -z "$GIT_EMAIL" ] && _if_email=';'
[ -z "$GIT_NAME" ] && _if_name=';'
[ -z "$GIT_SIGNING_KEY" ] && _if_key=';'
cat "$DFD/config/git/gitconfig" | \
sed -e "s/{{ _if_email }}/$_if_email/g" | \
sed -e "s/{{ GIT_EMAIL }}/$GIT_EMAIL/g" | \
sed -e "s/{{ _if_name }}/$_if_name/g" | \
sed -e "s/{{ GIT_NAME }}/$GIT_NAME/g" | \
sed -e "s/{{ _if_key }}/$_if_key/g" | \
sed -e "s/{{ GIT_KEY }}/$GIT_SIGNING_KEY/g" | \
sed -e "s/{{ GIT_EDITOR }}/$GIT_EDITOR/g" \
> "$HOME/.gitconfig"
echo ":: $HOME/.gitconfig"

# Creates ssh config
SSH_CONTENT=''
if [ -n "$SSH_CONFIG" ]; then
	for server in $SSH_CONFIG; do
		IFS=':' read host user hostname <<< "$server"

		SSH_CONTENT=$SSH_CONTENT"Host $host\n"
		SSH_CONTENT=$SSH_CONTENT"\tUser $user\n"
		SSH_CONTENT=$SSH_CONTENT"\tHostName $hostname\n\n"
	done
	mkdir -p "$HOME/.ssh"
	echo -e "$SSH_CONTENT" > "$HOME/.ssh/config"
	echo ":: $HOME/.ssh/config"
fi
