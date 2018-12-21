USE MockData
GO

IF OBJECT_ID('dbo.Email','U') IS NOT NULL
BEGIN
DROP TABLE dbo.Email 
END

IF OBJECT_ID('dbo.Domain','U') IS NOT NULL
BEGIN
DROP TABLE dbo.domain 
END

CREATE TABLE dbo.Email(
ID INT Identity NOT NULL PRIMARY KEY,
NAME Varchar(20) NULL
)

INSERT INTO dbo.Email(Name)
VALUES('gmail.com'),
('Hotmail.com'),
('yahoo.com'),
('AOL.com'),
('Outlook.com'),
('Hush.net'),
('Monk.web'),
('Online.co.uk'),
('CSI.net'),
('Quantum.com'),
('Mail.com')

CREATE TABLE dbo.Domain(
ID INT IDENTITY NOT NULL PRIMARY KEY,
NAME Varchar(6) NOT NULL UNIQUE
)

INSERT INTO dbo.Domain(Name)
VALUES('.net'),
('.com'),
('.co.uk'),
('.web'),
('.gov'),
('.org'),
('.edu')
