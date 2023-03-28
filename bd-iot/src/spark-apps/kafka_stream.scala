import org.apache.spark.sql.functions._
import org.apache.spark.sql.SparkSession
import org.apache.spark.sql.streaming.Trigger
import org.apache.spark.sql.types.{IntegerType,StringType,StructType}


val spark = SparkSession.builder.appName("KafkaStream").getOrCreate()
  
import spark.implicits._

// Subscribe to 1 topic
val df = spark.readStream.format("kafka").option("kafka.bootstrap.servers", "kafka:9092").option("subscribe", "iot-temp").option("startingOffsets", "earliest").load();

val string_df = df.selectExpr("CAST(value AS STRING)")

val schema = new StructType().add("source",StringType).add("value",IntegerType)

val iot_df = string_df.select(from_json(col("value"), schema).as("data")).select("data.*")

iot_df.writeStream.format("csv").option("header", true).option("checkpointLocation", "hdfs://namenode:9000/iot_data/checkpoints/").option("path", "hdfs://namenode:9000/iot_data/").trigger(Trigger.ProcessingTime("30 seconds")).start()

iot_df.writeStream.format("console").outputMode("append").start().awaitTermination()

