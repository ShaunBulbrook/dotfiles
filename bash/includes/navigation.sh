#!/usr/bin/env bash

up() {
	COUNTER=$1
	while [[ $COUNTER -gt 0 ]]
	do
		UP="${UP}../"
		COUNTER=$(( $COUNTER -1 ))
	done
	echo "cd $UP"
	cd $UP
	UP=''
}

cd() {
	new_directory="$*";
	if [ $# -eq 0 ]; then
		new_directory=${HOME};
	fi;
	builtin cd "${new_directory}" && ls
}

mkcd() {
	direc="$*";
	mkdir "${direc}" && cd "${direc}"
}
