#!/bin/bash
set -e
#cp ~/.ssh/id* base/
docker build -t owuordickson/fritzing:ubuntu ./fritzing

# https://l10nn.medium.com/running-x11-applications-with-docker-75133178d090
