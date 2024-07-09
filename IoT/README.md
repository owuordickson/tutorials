# IoT Software Tools

A Docker implementation of Fritzing and Node-RED with InfluxDB

## Requirements

You will be required to download install the following software:

1. **Docker Desktop** via the link: <https://www.docker.com/products/docker-desktop/>

2. X-Server **(X11/Xorg/XQuartz)** application. Depending on your Operating System, install this via:
    - for MacOS install [XQuartz]: <https://www.xquartz.org/> OR ```brew install --cask xquartz```
    - for Windows [Xming]: <http://www.straightrunning.com/XmingNotes/>
    - for Linux [Xorg]: ```sudo apt-get install xorg```

3. Launch (X11/Xorg/XQuartz) application.
    - Under the XQuartz menu, select Preferences. Go to the security tab and ensure *"Allow connections from network clients"* is checked.
    - Restart your PC.

## Installation

1. Download package from GitHub.

2. Start your Docker Desktop and (X11/Xorg/XQuartz) applications.

3. Use a command line program **(Terminal/CMD)** with the local package:
    - Type and execute the command: ```xhost + 127.0.0.1```. *(Output: 127.0.0.1 being added to access control list)*.
    - Navigate to **IoT** folder and execute the command: ```docker compose up -d```


## Usage

* The Fritzing application should start and be visible on your screen (immediately after the *docker-compose*).
    - To start/stop the application: Open the **Docker Desktop** and start/stop the **fritzing** container

* **Node-RED** and **InfluxDB** are accessible from your browser after starting their respective containers. Launch your *Browser* and go to:
    - Node-RED: <http://localhost:1880>
    - InfluxDB: <http://localhost:8086>


## Resources:

* <https://gist.github.com/palmerj/315053c0d940f4c63dee7655ce037ade>

