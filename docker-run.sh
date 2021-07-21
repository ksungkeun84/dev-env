#!/bin/bash

sudo docker run --rm -i -t \
  --privileged \
  -v $PWD/docker-home/:/home/sungkeun/ \
  -v $HOME:/home/sungkeun/host \
  danguria/dev-env
  
