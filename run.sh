#!/bin/bash
DOCKER_HOME='docker-home'
if [ ! -d "$DOCKER_HOME" ]; then
    mkdir $DOCKER_HOME
    cp setup.sh $DOCKER_HOME
    cp reset.sh $DOCKER_HOME
fi
docker run --rm -i -t \
    --privileged \
    --env TERM=xterm-256color \
    --workdir="/root" \
    --volume $HOME:/root/host \
    --volume $PWD:/root/dev-env \
    --volume $PWD/$DOCKER_HOME:/root \
    danguria/dev-env
