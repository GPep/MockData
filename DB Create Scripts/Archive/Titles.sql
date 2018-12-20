IF OBJECT_ID('dbo.Title','u') IS NOT NULL
BEGIN
DROP TABLE dbo.title 
END

CREATE TABLE dbo.title(
ID INT IDENTITY NOT NULL PRIMARY KEY,
TITLE varchar(4) NOT NULL UNIQUE, 
GENDER CHAR(1) NOT NULL 
CONSTRAINT ck_genderTitle CHECK (GENDER IN ('M','F','B')) --B = Both
)
GO

INSERT INTO dbo.title(title, gender)
VALUES
('Mr','M'),
('Miss','F'),
('Mrs','F'),
('Ms','F'),
('Dr','B'),
('Rev','B'),
('Hon','B'),
('Dame','F'),
('Sir','M') 

GO


