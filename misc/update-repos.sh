#!/usr/bin/env bash

find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '
	(
		echo {} &&
		cd {} &&
		git fetch --all --prune &&
		git status --short --branch &&
		echo
	)
' \;