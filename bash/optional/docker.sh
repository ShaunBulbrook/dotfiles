if [ "$(docker-machine status)" == "Running" ] ; then
	eval $(docker-machine env default)
fi
