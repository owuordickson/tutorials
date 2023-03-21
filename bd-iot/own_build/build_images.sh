#!/bin/bash
set -e
#cp ~/.ssh/id* base/
docker build -t owuor/hdfs-base:latest ./hadoop
docker build -t owuor/hdfs-namenode:latest ./namenode