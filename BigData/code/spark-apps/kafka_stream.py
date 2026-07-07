from pyspark.sql import SparkSession
from pyspark.sql.functions import col, from_json
from pyspark.sql.types import StructType, StringType, IntegerType

# Initialize Spark Session
spark = SparkSession.builder \
    .appName("KafkaStream") \
    .getOrCreate()

# 1. Subscribe to the Kafka topic
# Note: Ensure you use 'kafka:29092' if connecting within the internal Docker network 
# or 'kafka:9092' if relying on external cluster routes.
df = spark.readStream \
    .format("kafka") \
    .option("kafka.bootstrap.servers", "kafka:29092") \
    .option("subscribe", "iot-temp") \
    .option("startingOffsets", "earliest") \
    .load()

# 2. Cast binary Kafka value payload into plain readable string
string_df = df.selectExpr("CAST(value AS STRING)")

# 3. Define the schema matching your JSON structures
schema = StructType() \
    .add("source", StringType()) \
    .add("timestamp", IntegerType()) \
    .add("value", IntegerType()) \
    .add("status", StringType())

# 4. Parse JSON column string into structured columns
iot_df = string_df.select(from_json(col("value"), schema).alias("data")).select("data.*")

# 5. Stream 1: Write outputs to HDFS CSV partitions every 30 seconds
query_hdfs = iot_df.writeStream \
    .format("csv") \
    .option("header", "true") \
    .option("checkpointLocation", "hdfs://namenode:9000/iot_data/checkpoints/") \
    .option("path", "hdfs://namenode:9000/iot_data/") \
    .trigger(processingTime="30 seconds") \
    .outputMode("append") \
    .start()

# 6. Stream 2: Print rows straight to your Spark container logs console output
query_console = iot_df.writeStream \
    .format("console") \
    .outputMode("append") \
    .start()

# Keep the streaming context alive until explicitly killed
query_console.awaitTermination()
