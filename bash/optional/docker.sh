#!/usr/bin/env bash

alias composer='docker run --rm -v "/`pwd`:/app" -v "/`realpath ~/.ssh`:/root/.ssh" composer/composer $@'
alias jekyll='docker run -v "/`pwd`:/srv/jekyll" -p 4000:4000 jekyll/jekyll jekyll $@'
alias t='docker run -v /$HOME/.trc:/root/.trc dan1elhughes/docker-t $@'
