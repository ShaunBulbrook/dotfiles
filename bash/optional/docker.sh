#!/usr/bin/env bash

alias composer='docker run --rm -v "/`pwd`:/app" -v "/`realpath ~/.ssh`:/root/.ssh" composer/composer $@'
alias jekyll='docker run -v "/`pwd`:/srv/jekyll" -p 4000:4000 jekyll/jekyll jekyll $@'
alias t='docker run -v /$HOME/.trc:/root/.trc dan1elhughes/docker-t $@'
alias mongod='docker run -d -p 27017:27017 -v mongodbdata:/data/db mongo'
alias httpd='docker run --name httpd -dit --rm -v /"`pwd`":/usr/local/apache2/htdocs/ -p 8080:80 --sig-proxy=false httpd'
