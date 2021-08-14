#!/bin/bash

docker run --rm -i -t \
  --privileged \
  -v $HOME:/home/ubuntu/host \
  -v $PWD/docker-home:/home/ubuntu \
  danguria/dev-env
