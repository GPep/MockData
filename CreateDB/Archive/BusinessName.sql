USE MockData
GO

IF OBJECT_ID('dbo.BusinessName','u') IS NOT NULL
BEGIN
DROP TABLE dbo.businessName
END

CREATE Table dbo.BusinessName(
ID INT IDENTITY NOT NULL PRIMARY KEY,
Name Varchar(200) NOT NULL UNIQUE
)

DECLARE @FilePath Varchar(200)
DECLARE @FileName Varchar(50)

SET @FilePath = '\\Dv-sqlcln-01\e$\DBA\MockData\'

SET @FileName = 'BusinessData.csv'


--Temp object

IF OBJECT_ID('tempdb.dbo.#BusinessName','u') IS NOT NULL
BEGIN
DROP TABLE #businessname
END

CREATE TABLE #businessName(
Name Varchar(100) NOT NULL
)

DECLARE @sql varchar(max)
set @sql = 'BULK INSERT #businessName FROM ''' + @FilePath + @FileName + ''' WITH (
	ROWTERMINATOR = ''\n''
)'

exec (@sql)


INSERT INTO dbo.BusinessName
SELECT Name from #businessName

DROP TABLE #businessName

--Remove double quotes
UPDATE dbo.BusinessName
SET Name = SUBSTRING(Name, 2, LEN(Name))
WHERE LEFT(Name, 1) = '"'

UPDATE dbo.BusinessName
SET Name = SUBSTRING(Name, 1, LEN(Name)-1)
WHERE RIGHT(Name, 1) = '"'

