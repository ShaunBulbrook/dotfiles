if [ $(docker-machine ls | grep -q default | grep -q Running) ] ; then
	eval $(docker-machine env default)
fi
