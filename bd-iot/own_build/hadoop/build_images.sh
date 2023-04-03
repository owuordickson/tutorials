#!/bin/bash
set -e
#cp ~/.ssh/id* base/
docker build -t owuordickson/hdfs-base:latest ./base
docker build -t owuordickson/hdfs-namenode:latest ./namenode
docker build -t owuordickson/hdfs-datanode:latest ./datanode