Creating Fritzing Container
---------------------------

1. Make sure your system has X-Server (X11/Xorg) application installed. If not, install it.
    * for MacOS install [XQuartz]: https://www.xquartz.org/ OR brew install --cask xquartz
    * for Windows [Xming]: http://www.straightrunning.com/XmingNotes/
    * for Linux [Xorg]: sudo apt-get install xorg

2. Launch XQuartz/X11 application. Under the XQuartz menu, select Preferences. 
    a. Go to the security tab and ensure "Allow connections from network clients" is checked.
    b. Restart your PC.

3. Start your Docker desktop and X11 application.

4. Open your Terminal/CMD application and run the following commands:
    a. xhost + 127.0.0.1
    b. navigate to 'su-iot' folder and run: docker compose up -d
    OR
    c. docker run -ti --rm -e DISPLAY=host.docker.internal:0 --name fritzing owuordickson/fritzing:ubuntu

    * The Fritzing application should start and be visible on your screen.
    * To stop the application: Open the Docker Desktop and stop the fritzing container


Resources:
----------
* https://gist.github.com/palmerj/315053c0d940f4c63dee7655ce037ade