# Loading Libraries
library(arules)
library(arulesViz)
library(RColorBrewer)


# import the Groceries dataset
data() #Other datasets in arules package
data(Groceries)

#Get a summary of the Groceries dataset
summary(Groceries)
inspect(Groceries[1:10])

arules::itemFrequencyPlot(Groceries, topN = 20, 
                          col = brewer.pal(8, 'Pastel2'),
                          main = 'Relative Item Frequency Plot',
                          type = "absolute", #use relative or absolute
                          ylab = "Item Frequency (Relative)")




# MINING FREQUENT PATTERNS

?apriori
patterns <- apriori(Groceries, 
                    parameter = list(supp = 0.001, conf = 0.8, target="frequent itemsets"))
inspect(patterns)


patterns <- apriori(Groceries, 
                    parameter = list(supp = 0.001, conf = 0.8, target="frequent"),
                    appearance = list(items =c("whole milk", "honey", "yogurt")))
inspect(patterns)




# CLUSTERING

#km <- kmeans(mydata, 5) # 5 cluster solution, based on all columns
# clusplot(mydata, km$cluster, color=TRUE, shade=TRUE, labels=2, lines=0) # based on all columns


# CLASSIFICATION

## 1. DECISION TREES

#sale_cat <- ifelse(mydata$Sales<=8,"No","Yes")
#data <- data.frame(mydata,sale_cat)
#head(data)





