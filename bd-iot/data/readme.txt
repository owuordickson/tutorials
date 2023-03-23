In order to upload a CSV file to HDF5, we do the following:

1. Create a folder "data" from the namenode URL - http://localhost:9870

2. To save CSV file, go into the namenode terminal and do the following:

    a. Create a 'csv' file using "touch bank.csv"

    b. Copy and paste data into the csv file using "nano bank.csv"

    c. Copy the csv file to the HDF5 via "hadoop fs -put bank.csv /data"

    d. Delete the redundant csv file via "rm bank.csv"

3. To preview the CSV file: hdfs dfs -cat /data/bank.csv | head

4. Perform interactive analytics using a Zeppelin notebook


-------------------------------------------------------------------------

Write IoT data to Hadoop HDF5 using Node-RED and Kafka

1. Create Kafka topic 'iot-temp' from the terminal:

    /opt/bitnami/kafka/bin/kafka-topics.sh --create --topic iot-temp --bootstrap-server kafka:9092

2. Using node-red:

    a. Import the following libraries from Palette ''

    b. Import and deploy the flow 'mqtt-kafka.json'

3. Using Zeppelin:

    a. Modify the Flink interpreter

        add FLINK_HOME
        add dependency

    b. Copy note and run it