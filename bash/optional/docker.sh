#!/usr/bin/env bash

alias composer='docker run --rm -v "/`pwd`:/app" -v "/`realpath ~/.ssh`:/root/.ssh" composer/composer $@'
