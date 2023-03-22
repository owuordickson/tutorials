#!/bin/bash
set -e
#cp ~/.ssh/id* base/
docker build -t owuor/kafka:3.3.2 ./base
