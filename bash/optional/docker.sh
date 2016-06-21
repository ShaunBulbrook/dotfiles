if [ "$(docker-machine status)" == "Running" ] ; then
	eval $(docker-machine env default)
fi

alias composer='docker run --rm -v "/`pwd`:/app" -v "/`realpath ~/.ssh`:/root/.ssh" composer/composer $@'
