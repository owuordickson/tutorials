# IoT Software Tools

A Docker implementation of Fritzing and Node-RED with InfluxDB

## Requirements

You will be required to download install the following software:

* Docker Desktop via the link: <https://www.docker.com/products/docker-desktop/>

* X-Server (X11/Xorg/XQuartz) application. Depending on your Operating System, install this via:
    - for MacOS install [XQuartz]: <https://www.xquartz.org/> OR ```brew install --cask xquartz```
    - for Windows [Xming]: <http://www.straightrunning.com/XmingNotes/>
    - for Linux [Xorg]: ```sudo apt-get install xorg```

## Installation

1. Download package

2. Use a command line program with the local package:

``` shell
$docker compose up -d
```

## Usage

To run Fritzing: start the *fritzing* container.

Launch your *Browser* and go to:
* Node-RED: <http://localhost:1880>
* InfluxDB: <http://localhost:8086>


