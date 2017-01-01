#!/usr/bin/env bash

alias vms='vagrant global-status --prune'

vm() {
	if [ "$#" -eq 0 ]; then
		vagrant status
	else
		vagrant "$@"
	fi
}
