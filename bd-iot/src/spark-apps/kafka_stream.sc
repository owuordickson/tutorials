import org.apache.spark.sql.functions._
import org.apache.spark.sql.SparkSession
import org.apache.spark.sql.types.{IntegerType,StringType,StructType}

val spark = SparkSession
  .builder
  .appName("KafkaStream")
  .getOrCreate()
  
import spark.implicits._

// Subscribe to 1 topic
val df = spark.readStream.format("kafka")
  .option("kafka.bootstrap.servers", "kafka:9092") // OR localhost:9092
  .option("subscribe", "iot-temp")
  .option("startingOffsets", "earliest") // From starting
  .load();


val string_df = df.selectExpr("CAST(value AS STRING)")

val schema = new StructType()
      .add("Source",StringType)
      .add("Value",IntegerType)

 val iot_df = string_df.select(from_json(col("value"), schema).as("data"))
   .select("data.*")


val query = iot_df.writeStream
  .format("memory")
  .outputMode("append")
  .queryName("tbl_iot")
  .start()


spark.table("tbl_iot").show()