#!/bin/bash


xhost +local:docker
sudo docker run --rm -i -t \
  --privileged \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v $HOME/.Xauthority:/home/sungkeun/.Xauthority \
  -v $PWD/docker-home/:/home/sungkeun/ \
  -v $HOME:/home/sungkeun/host \
  --hostname $(hostname) \
  danguria/dev-env
