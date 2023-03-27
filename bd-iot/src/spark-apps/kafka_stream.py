from pyspark.sql import SparkSession
#from pyspark.sql.streaming.DataStreamWriter import trigger
#from pyspark.sql.functions import explode
#from pyspark.sql.functions import split

spark = SparkSession \
    .builder \
    .appName("KafkaStream") \
    .getOrCreate()

# Subscribe to 1 topic
df = spark \
  .readStream \
  .format("kafka") \
  .option("kafka.bootstrap.servers", "localhost:9092") \
  .option("subscribe", "iot-temp") \
  .load()

# df1 = df.selectExpr("CAST(value AS STRING)", "CAST(timestamp AS TIMESTAMP)")#.as[(String, Timestamp)]
df1 = df.selectExpr("CAST(key AS STRING)", "CAST(value AS STRING)")

df1.writeStream \
  .outputMode("append") \
  .format("console") \
  .start() 
#  .awaitTermination()
#  .trigger(processingTime='5 seconds')
