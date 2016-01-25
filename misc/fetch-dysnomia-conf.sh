#!/usr/bin/env bash

dir='/home/pi/.btsync'
src=$1

curl -sSL $src | gpg --passphrase-file $dir/passphrase.txt -d > $dir/sync.new.conf

diff $dir/sync.conf $dir/sync.new.conf >/dev/null 2>&1
status=$?

if [ $status -ne 0 ]; then
	mv $dir/sync.new.conf $dir/sync.conf
	chown pi: $dir/sync.conf
	killall btsync && $dir/btsync --config $dir/sync.conf
fi
