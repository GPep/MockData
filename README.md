# MockData
Creating Fake Data for Testing
One of the problems facing us in the new GDPR compliance world is scrambling/obfuscating production environment in our testing environments. I’ve certainly been guilty in the past of having multiple backups of production data lying around on test servers and also having production data in test environments which should be removed. 
It’s fairly easy to remove and scramble data but sometimes it is nice to have test data that resembles real data. 
So I created a database that can create test data for these purposes such as names, addresses, telephone numbers and email addresses. 
I’ve called the database MockData. It has a several tables that holds information such as surnames, first names, fake business names, towns, Counties, Countries and by using stored procedures, the data can populate a number of staging tables which can then be used to export to another database or to flat files. The staging tables have Primary Keys so that if you produce data for Names, addresses, telephone numbers and email addresses at the same time, these can be exported together and the keys can be used to link the data to form a full set of data for one person/customer or business. 
This database is merely part of my building blocks which I use to generate data to replace real production data in my test databases as well as create fake workloads for my own proof of concept databases. There’s no reason why you cannot create your own stored procedures to produce the data you require for your own purposes so feel free to install and modify the database so it fits your specifications. I will continue to update the database (i.e. I need to link the town names to counties and countries) but please feel free to do what you want with it. 
Installation
To install the database you can either download the backup files from here (2012, 2014 or 2016) or you can download the files from github and use the PowerShell script to install. If you choose the latter, you will have to place the .CSV files on the computer/server where you are installing the database and modify lines 1169, 1219, 1548, the ‘CreateTables_MockData’ script so it points to the location of the CSV files as it uses the BULK IMPORT method to import the data.
Now here is some further information about the database schema.
Tables
The staging tables are in the ‘Data’ schema. These tables are normally blank unless the stored procedures are run to populate them. Every time the stored procedures are run again, they truncate these tables as they should only be used for staging and exporting data. 
The tables in the Data schema are as follows:
•	Data.Address – Full customer address
•	Data.Birth_date – data of births
•	Data.Business – Business Names
•	Data.ContactDetails – Telephone Numbers and Email Addresses
•	Data.EmailAddress – Holds email addresses only
•	Data.FemaleIndividual – Holds Female Names
•	Data.Location – Holds County and  Country Locations
•	Data.MaleIndividual – Holds Male Names
•	Data.PhoneNumbers – Holds Phone numbers.
•	Data.PostCode – Holds Postcodes
•	Data.street_name – Holds street names only
•	Data.Town – Holds Town names only
The tables in the dbo Schema hold the data that is used to create the testing data which is then inserted into the data schema tables.
•	Dbo.BusinessName – Holds a random list of words and phrases used to generate test business names
•	Dbo.Country – Holds the list of countries that makes up the United Kingdom
•	Dbo.County  - Holds the list of counties as well as the country id from the country table.
•	Dbo.domain – Holds a list of web domains (.com, .co.uk, .net etc)
•	Dbo.email – holds a list of email address which can be used to generate random customer email addresses
•	Dbo.firstnames – holds a large list of first names used to create male and females individuals/customer data as well as street names.
•	Dbo.Street_type – holds a list of street types (road, avenue, mews, street) used to create street names 
•	Dbo.surname – holds a large list of surnames used to create male and female individuals/customers as well as street names.
•	Dbo.title – holds a list of name titles (Mr, Miss, Mrs, Ms, DR, Sir, Dame, etc) used to create male and female individuals and customers.
•	Dbo.Town – holds a large list of town names (these are not currently linked to the Counties table but they will be in a future version!)
Stored Procedures
There a number of stored procedures used to create fake data from the tables in the dbo.Schema and populates the tables in the data schema. These are all run with the @count parameter which you use to tell the stored procedure how many records to create. By default, it will create just one. 
e.g. EXECUTE USP_CreateFemaleIndividual @Count = 1000 will create 1000 Random Female names with email address in the data.femaleIndividual table.
•	USP_CreateBusiness – This will create business names held in the ‘Data.Business’ table
•	USP_CreateFemaleIndividual – This will create a list of Female names held in the Data.FemaleIndividual table. It also runs the usp_generateEmail for each record to produce an email address for each individual.
•	USP_CreateMale Individual – This will create a list of Male names held in the data.MaleIndividual table. It also runs the usp_generateEmail for each record to produce an email address for each individual.
•	USP_GenerateAddress – This will create an address list in the data.address table. It actually runs several other stored procedures to produce this list (USP_GenerateRandomPostCode, USP_generateTown, USP_GenerateLocation, USP_GenerateRandomStreetName)
•	USP_GenerateEmail – This will create a random email address. It uses the @id and @Surname parameters as it should be used in conjunction with creating a customer but can be used separately to create a single email address.
•	USP_GenerateLocation – This will create a list of County and Countries in the data.location table.
•	USP_GeneratePhoneNumber – This will create a list of phone numbers in the data.PhoneNumber table
•	USP_GenerateRandomPostCode – This will create a list of Post Codes held in the data.postcode table – These are randomly generated using letters and numbers to be 7 characters long (with a space in the middle), they bear no resemblance to real post codes but are made to look like they are. 
•	USP_GenerateRandomStreetName – This will create a list of random street names and populate the data.street_name table
•	USP_GenerateTown – This will create a list of random towns and populate the data.town table
•	USP_RandomBirthDate – this will create a list of random date of births and populate the data.Birth_Date table. This is normally used in conjunction with the stored procedures that create customers details but can also be used on its own.
•	USP_CreateMaleCustomer – This will run USP_CreateMaleIndividual, USP_GenerateAddress, USP_GeneratePhoneNumber, USP_RandomBirthDate stored procedures
•	USP_CreateFemaleCustomer – This will run USP_CreateFemaleIndividual, USP_GenerateAddress, USP_GeneratePhoneNumber, USP_RandomBirthDate stored procedures
•	USP_CreateBusinessCustomer – This will run USP_createBusiness, USP_generatePhoneNumber and USP_GenerateAddress stored procedures. 
Feel free to email me if you have any problems, spot any bugs or think there are any improvements that could be made. 
