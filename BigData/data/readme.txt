In order to upload a CSV file to HDF5, we do the following:

1. Navigate to (namenode) http://localhost:9870

2 . Create a folder "data" under "Utilities>>Browse the file system"

3. To save CSV file, go into the namenode terminal and do the following:

    a. Create a 'csv' file using "touch bank.csv"

    b. Copy and paste data into the csv file using "nano bank.csv"

    c. Copy the csv file to the HDF5 via "hadoop fs -put bank.csv /data"

    d. Delete the redundant csv file via "rm bank.csv"

4. To preview the CSV file: hdfs dfs -cat /data/bank.csv | head

5. Perform interactive analytics using a Zeppelin notebook (import zeppelin-notes\analytics_from_hdf5.json)


-------------------------------------------------------------------------

Write IoT data to Hadoop HDF5 using Node-RED and Kafka

1. Create Kafka topic 'iot-temp' from the terminal:

    /opt/kafka/bin/kafka-topics.sh \
  --bootstrap-server localhost:9092 \
  --create \
  --topic iot-temp \
  --partitions 1 \
  --replication-factor 1

    * Check active topics:
     /opt/kafka/bin/kafka-topics.sh --create --topic iot-temp --bootstrap-server

    * Check if messages are arriving?
    /opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server kafka:9092 --from-beginning --topic iot-temp --partition 1

2. Using node-red:

    a. Import the following libraries from Palette 'node-red-contrib-kafka-node-latest'

    b. Import and deploy the flow 'mqtt-kafka.json'

3. Using Spark-master:

    In order to build an ETL program that will store our IoT stream to HDFS, navigate to Terminal/CMD and type the following commands:

    a. cd /home

    b. spark-shell --packages org.apache.spark:spark-sql-kafka-0-10_2.11:2.4.8 -i kafka_stream.scala spark://spark-master:7077

4. Using Zeppelin:

    a. Copy notebook and run it (import \zeppelin-notes\analytics_from_kafka.zpln)


5. Exercise

    a. Analyze the IoT data and describe your discoveries, conclusions etc.
