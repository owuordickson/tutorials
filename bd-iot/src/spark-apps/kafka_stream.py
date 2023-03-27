from pyspark.sql import SparkSession
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
  .option("kafka.bootstrap.servers", "localhost:9092,localhost:9092") \
  .option("subscribe", "iot-temp") \
  .load()

df.selectExpr("CAST(key AS STRING)", "CAST(value AS STRING)").show()