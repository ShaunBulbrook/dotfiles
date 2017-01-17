#!/usr/bin/env bash

dfs() {
	if [ "$#" -eq 0 ]; then
		hdfs dfs -ls
	else
		hdfs dfs "$@"
	fi
}
