#!/bin/bash
set -e
#cp ~/.ssh/id* base/
docker build -t owuor/hdfs-base:latest ./base
docker build -t owuor/hdfs-namenode:latest ./namenode
docker build -t owuor/hdfs-datanode:latest ./datanode