#!/bin/bash

DOCKER_HOME='docker-home'
if [ ! -d "$DOCKER_HOME" ]; then
    mkdir $DOCKER_HOME
    cp setup.sh $DOCKER_HOME
fi

username=`whoami`
container_name=do-not-touch-${username}
while getopts u: flag
do
    case "${flag}" in
        u) container_name=${OPTARG};;
    esac
done

docker run --rm -i -t \
    --privileged \
    --name ${container_name} \
    --env TERM=xterm-256color \
    --user $UID:$GID \
    --workdir="/home/$USER" \
    --volume $HOME:/home/${username}/host \
    --volume $PWD:/home/${username}/dev-env \
    --volume $PWD/$DOCKER_HOME:/home/${username} \
    --volume /data:/home/${username}/data \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    danguria/dev-env
