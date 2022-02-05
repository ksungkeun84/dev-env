#!/bin/bash
DOCKER_HOME='docker-home'
if [ ! -d "$DOCKER_HOME" ]; then
    mkdir $DOCKER_HOME
    cp setup.sh $DOCKER_HOME
    cp reset.sh $DOCKER_HOME
    cp oh-my-zsh-install.sh $DOCKER_HOME
fi
username=`whoami`
    #--name docker-${username} \
docker run --rm -i -t \
    --privileged \
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
