#!/usr/bin/env bash
#--------------------------------------------------------------------------
# GPG
#--------------------------------------------------------------------------
#
# Imports a public GPG key from a given public ID on pgp.mit.edu 
#
#

if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <GPG public ID>"
	exit 1
fi

if [[ $(gpg --list-keys | grep $1 | wc -l) == 0 ]]; then
	gpg --keyserver pgp.mit.edu --recv-keys $1
else
	echo "$1 is already saved"
fi
