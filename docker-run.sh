#!/bin/bash
DOCKER_HOME='docker-home'
if [ ! -d "$DOCKER_HOME" ]; then
    mkdir $DOCKER_HOME
    cp setup.py $DOCKER_HOME
fi
username=`whoami`
docker run --rm -i -t \
    --name docker-${username} \
    --privileged \
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
