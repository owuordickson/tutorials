from pyspark.sql import SparkSession
#from pyspark.sql.functions import explode
#from pyspark.sql.functions import split

spark = SparkSession \
    .builder \
    .appName("TwitterStream") \
    .getOrCreate()
