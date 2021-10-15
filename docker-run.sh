#!/bin/bash
username=`whoami`
docker run --rm -i -t \
    --privileged \
    --user $UID:$GID \
    --workdir="/home/$USER" \
    --volume $HOME:/home/${username}/host \
    --volume $PWD/docker-home:/home/${username} \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    danguria/dev-env
