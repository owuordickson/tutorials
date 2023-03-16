#Install and load the rvest package
install.packages("rvest")
library(rvest)

#Begin the extraction process
#Get the URL
wikiurl<-read_html("https://en.wikipedia.org/wiki/List_of_highest-grossing_films")

#Get the movie charts from wikipedia and pipe (%>%) and fill the table
moviecharts<-wikiurl%>%html_table(., fill=T)

#Since there are multiple tables in the page, specify the one you might need
moviecharts[[4]]


#Put the movie chart into a table
highestgrossfilms<-data.frame(moviecharts[[4]])
highestgrossfilms

#Numbers of rows and columns in the table
dim(highestgrossfilms)

#To add to a CSV file, check your working directory and set to your desired location
getwd()
setwd("C:/Users/OwuorJnr/Desktop") # change this section to yours

write.csv(highestgrossfilms,"gross.csv", row.names = TRUE)
