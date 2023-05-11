# Big Data Infrastructure 
### with Hadoop and Node-Red

A Docker implementation of Big Data infrastructure using Hadoop and Node-RED (as an IoT data sourse)

## Requirements

You will be required to install **Docker Desktop**

## Installation

1. Download packagefrom GitHub.

2. Start your Docker Desktop.

3. Use a command line program **(Terminal/CMD)** with the local package:
    - Navigate to **bd-iot** folder and execute the command: ```docker compose up -d```

## Usage

The *docker-compose* will create containers for the following software: Node-RED, Hadoop (namenode & datanode), Zeppelin, Spark, Kafka, Zookeeper.

All these software are accessible from your browser after starting their respective containers. Launch your *Browser* and go to:

* Node-RED: <http://localhost:1881>
* Namenode: <http://localhost:9870>
* Zeppelin: <http://localhost:8082>
* Spark: <http://localhost:8083>




