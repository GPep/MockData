USE MockData
GO

DECLARE @FilePath Varchar(200)
DECLARE @FileName Varchar(12)

SET @FilePath = '\\Dv-sqlcln-01\e$\DBA\MockData\'

SET @FileName = 'Surnames.csv'

IF OBJECT_ID('Surname','U') IS NOT NULL
BEGIN
DROP TABLE Surname
END

CREATE TABLE Surname(
ID INT IDENTITY NOT NULL PRIMARY KEY,
Surname Varchar(50) NOT NULL UNIQUE
)

--Temp Table
IF OBJECT_ID('tempdb.dbo.#surname','u') IS NOT NULL
BEGIN
DROP TABLE #surname
END

CREATE TABLE #Surname(
Surname Varchar(50) NOT NULL)

declare @sql varchar(max)
set @sql = 'BULK INSERT #Surname FROM ''' + @FilePath + @FileName + ''' WITH (
	ROWTERMINATOR = ''\n''
)'

exec (@sql)

INSERT INTO Surname(surname)
SELECT surname from #Surname
GO

SELECT * FROM surname

DROP TABLE #Surname
GO
