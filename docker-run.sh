#!/bin/bash


sudo docker run --rm -i -t \
  --privileged \
  -v $HOME:/host \
  -v docker-home:/home/ubuntu \
  danguria/dev-env
