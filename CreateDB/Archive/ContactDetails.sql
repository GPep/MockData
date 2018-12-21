USE MockData
GO

IF OBJECT_ID('data.ContactDetails','u') IS NOT NULL
BEGIN
DROP TABLE data.ContactDetails
END

CREATE TABLE data.ContactDetails(
ID INT IDENTITY NOT NULL PRIMARY KEY,
Email Varchar(100) NOT NULL,
PhoneNumber INT NOT NULL
)


