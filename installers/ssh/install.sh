#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <GitHub username>"
	exit 1
fi

PUBLICKEY=$(curl -sS https://github.com/$1.keys)
AUTHFILE="/home/$(whoami)/.ssh/authorized_keys"

if [[ ! -f "$AUTHFILE" ]]; then
	echo "Creating new authorized_keys file"
	touch $AUTHFILE
elif [[ "$(grep -cve '^\s*$' $AUTHFILE)" > 0 ]]; then
	echo "Your authorized_keys file already has content. Exiting to prevent overwriting"
	exit 2
fi

echo $PUBLICKEY > $AUTHFILE

echo "Moving SSH config to real location. May require root"
sudo cp sshd_config /etc/ssh/sshd_config
sudo chown root: /etc/ssh/sshd_config
