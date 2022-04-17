#!/bin/bash

# If you build the container on the current machine for the first,
# then follow the instructions below
#
# 1. edit ~/.docker/config.json to include the following
# {
#    ...
#    "experimental" : "enable"
# } 
#
# 2. Restart Docker Desktop after that
# 
# If you're using Linux, just run the following command
#  docker run --privileged --rm docker/binfmt:a7996909642ee92942dcd6cff44b9b95f08dad64
#  service docker restart
# 
# 3. Create a new builder instance
#   docker buildx create --use
#   docker buildx ls
docker buildx build --platform linux/amd64,linux/arm64 -t danguria/dev-env --push .
