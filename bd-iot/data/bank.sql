CREATE DATABASE IF NOT EXISTS db_bank;


CREATE TABLE IF NOT EXISTS tbl_bank (
	ID int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	age int(11),
	job varchar(255),
	marital varchar(255),
	education varchar(255),
	balance float(10),
	housing varchar(255)
);



INSERT IGNORE INTO tbl_bank (age, job, marital, education, balance, housing)
	VALUES
	(30,'unemployed','married','primary',1787,'no'),
	(33,'services','married','secondary',4789,'yes'),
	(35,'management','single','tertiary',1350,'yes'),
	(30,'management','married','tertiary',1476,'yes'),
	(59,'blue-collar','married','secondary',0,'yes'),
	(35,'management','single','tertiary',747,'no'),
	(54,'self-employed','married','tertiary',307,'yes'),
	(39,'technician','married','secondary',147,'yes'),
	(41,'entrepreneur','married','tertiary',221,'yes'),
	(43,'services','married','primary',-88,'yes'),
	(39,'services','married','secondary',9374,'yes'),
	(43,'admin.','married','secondary',264,'yes'),
	(36,'technician','married','tertiary',1109,'no'),
	(20,'student','single','secondary',502,'no'),
	(31,'blue-collar','married','secondary',360,'yes'),
	(40,'management','married','tertiary',194,'no'),
	(54,'technician','married','secondary',4073,'no'),
	(37,'admin.','single','tertiary',2317,'yes'),
	(25,'blue-collar','single','primary',-221,'yes'),
	(31,'services','married','secondary',132,'no')
