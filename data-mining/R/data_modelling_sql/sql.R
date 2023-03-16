
install.packages("RMariaDB")
install.packages("DBI")
install.packages("dbplyr")


library(RMariaDB)
library(DBI)
library(dplyr)
library(dbplyr)

??RMariaDB


con <- dbConnect(
  drv = RMariaDB::MariaDB(), 
  username = "root",
  password = "pass", 
  host = "localhost", 
  port = 3306
)


?dbConnect
?dbGetQuerys
?dbExecute

dbExecute(con, "CREATE DATABASE IF NOT EXISTS dsaDB;")


dbExecute(con, "USE dsaDB;")

dbExecute(con, 
"CREATE TABLE IF NOT EXISTS Persons (
  PersonID int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  LastName varchar(255),
  FirstName varchar(255),
  Address varchar(255),
  City varchar(255)
);")


dbExecute(con, 
"INSERT IGNORE INTO Persons (PersonID, LastName, FirstName, Address, City)
VALUES 
(1,'Erichsen','Tom ','1 Stavanger 4006','Oslo'),
(2,'Philips','James ','21 Folks Rd','Johannesburg'),
(3,'Lee','Kim ','2 Greg Rd','Nairobi'),
(4,'Doe','John ','55 Yawn Rd','Pretoria'),
(5,'Marks','Cindy ','22 Folks Rd','Abuja');")

dbGetQuery(con, "SELECT * FROM Persons;")

dbExecute(con, 
"UPDATE Persons
SET LastName = 'Schmidt', City= 'Frankfurt'
WHERE PersonID = 1;")

          
dbGetQuery(con, "SELECT LastName AS 'Surname' FROM Persons;")


        

