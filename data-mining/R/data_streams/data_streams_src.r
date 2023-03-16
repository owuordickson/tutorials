# Docs: https://github.com/mhahsler/stream
# URL: https://cran.r-project.org/web/packages/stream/index.html

# 1. Installation
install.packages("stream")
install.packages("animation")
install.packages("mlpack")
any(grepl("stream", installed.packages())) # Check if installed (TRUE)
library("stream") # Load library
#-------------------------------------------





# 2. Documentation
??stream # Use help to check out the documentation
#-------------------------------------------





# 3. Setting up streams and visualizing
stream1 <- DSD_Benchmark(1) 
animate_data(stream1, horizon=100, n=5000, xlim=c(0,1), ylim=c(0,1))

# Cassini dataset
stream2 <- DSD_mlbenchGenerator("cassini")
animate_data(stream2)
#-------------------------------------------






# 4. Clustering
# 4a. A random data stream with 3 Gaussian clusters and 10% noise.
set.seed(2000)
stream3 <- DSD_Gaussians(k = 3, noise = 0.1)
plot(stream3)

# 4b. Cluster a stream of 1000 points using D-Stream.
dstream <- DSC_DStream(gridsize = 0.1)
update(dstream, stream3, 1000)
plot(dstream, stream3, grid = TRUE)
#-------------------------------------------






# 5. Reading and Writing
# creating data and writing it to disk 
stream4 <- DSD_Gaussians(k=3, d=5, outliers=1, space_limit=c(0,2), outlier_options = list(outlier_horizon=10))
plot(stream)
write_stream(stream4, "data.txt", n=10, header = TRUE, sep=",", class=TRUE, write_outliers=TRUE)

# reading the same data back (as a loop) 
stream5 <- DSD_ReadCSV(k=3, o=1, "data.txt", sep=",", header = TRUE, loop=TRUE, class="class", outlier="outlier") 
animate_data(stream2)
#-------------------------------------------




# 6. Classification (Assignment)
# DOCs: https://search.r-project.org/CRAN/refmans/mlpack/html/hoeffding_tree.html
# 6a. Identify the error in the lines of code below, 
# 6b. and rectify them to get the correct output.
??hoeffding_tree
output <- mlpack::hoeffding_tree(training=stream2, confidence=0.99)
tree <- output$output_model
