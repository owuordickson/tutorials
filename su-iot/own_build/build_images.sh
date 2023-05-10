#!/bin/bash
set -e
#cp ~/.ssh/id* base/
docker build -t owuordickson/fritzing:ubuntu ./fritzing

# docker run -ti --rm -e DISPLAY=host.docker.internal:0 --name fritzing owuordickson/fritzing:ubuntu
