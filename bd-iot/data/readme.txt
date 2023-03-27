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

    * Check if messages are arriving?
    /opt/bitnami/kafka/bin/kafka-console-consumer.sh --bootstrap-server kafka:9092 --from-beginning --topic iot-temp --partition 0

2. Using node-red:

    a. Import the following libraries from Palette 'node-red-contrib-kafka-node-latest'

    b. Import and deploy the flow 'mqtt-kafka.json'

3. Using Zeppelin:

    a. Modify the Apark interpreter

        add dependency: org.apache.spark:spark-sql-kafka-0-10_2.11:2.4.8

    b. Copy notebook and run it


spark-submit --packages org.apache.spark:spark-sql-kafka-0-10_2.12:3.3.2 kafka_stream.py spark://e69731fc043d:7077

spark-shell --packages org.apache.spark:spark-sql-kafka-0-10_2.12:3.3.2 kafka_stream.py spark://e69731fc043d:7077
