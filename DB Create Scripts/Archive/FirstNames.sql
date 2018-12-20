USE MockData
GO

DECLARE @FilePath Varchar(200)
DECLARE @FileName Varchar(50)

SET @FilePath = '\\Dv-sqlcln-01\e$\DBA\MockData\'

SET @FileName = 'male.firstnames.csv'

IF OBJECT_ID('FirstNames','U') IS NOT NULL
BEGIN
DROP TABLE FirstNames
END

CREATE TABLE FirstNames(
ID INT IDENTITY NOT NULL PRIMARY KEY,
Name Varchar(50) NOT NULL,
GENDER CHAR(1) NOT NULL
CONSTRAINT ck_gender CHECK (GENDER IN ('M','F'))
)

--Temp Tables
IF OBJECT_ID('tempdb.dbo.#maleFirstNames','u') IS NOT NULL
BEGIN
DROP TABLE #maleFirstNames
END

CREATE TABLE #maleFirstNames(
Name Varchar(50) NOT NULL)

--Temp Table
IF OBJECT_ID('tempdb.dbo.#FemaleFirstNames','u') IS NOT NULL
BEGIN
DROP TABLE #FemaleFirstNames
END

CREATE TABLE #FemaleFirstNames(
Name Varchar(50) NOT NULL)


declare @sql varchar(max)
set @sql = 'BULK INSERT #maleFirstNames FROM ''' + @FilePath + @FileName + ''' WITH (
	ROWTERMINATOR = ''\n''
)'

exec (@sql)


SET @FileName = 'Female.firstnames.csv'


set @sql = 'BULK INSERT #FemaleFirstNames FROM ''' + @FilePath + @FileName + ''' WITH (
	ROWTERMINATOR = ''\n''
)'

exec (@sql)

INSERT INTO FirstNames(name, GENDER)
SELECT name, 'M' from #maleFirstNames
GO

INSERT INTO FirstNames(name, GENDER)
SELECT name, 'F' from #FemaleFirstNames
GO

SELECT * FROM FirstNames

DROP TABLE #maleFirstNames
DROP TABLE #FemaleFirstNames
GO
