USE MockData
GO

IF OBJECT_ID('USP_GenerateRandomPostCode') IS NULL
  EXEC ('CREATE PROCEDURE USP_GenerateRandomPostCode AS RETURN 0;')
GO

ALTER PROCEDURE USP_GenerateRandomPostCode @count INT = 1
AS
BEGIN


SET NOCOUNT ON


DECLARE @Upper INT;
DECLARE @Lower INT;
DECLARE @Random1 INT;
DECLARE @Random2 INT;
DECLARE @Random3 INT;
DECLARE @Random4 INT;
DECLARE @Random5 INT;
DECLARE @Random6 INT;

DECLARE @RandomString1 Char(1)
DECLARE @RandomString2 Char(1)
DECLARE @RandomString3 Char(1)
DECLARE @RandomString4 Char(1)
DECLARE @Counter INT


SET @Counter = 0

--Create table for Postcodes

TRUNCATE TABLE data.PostCode

/*
IF OBJECT_ID('PostCode','u') IS NOT NULL
BEGIN
DROP TABLE PostCode
END

CREATE TABLE PostCode(
ID INT IDENTITY NOT NULL PRIMARY KEY,
Name Varchar(7) NOT NULL
)
*/

--Create String Table

IF OBJECT_ID('tempdb.dbo.#RandomString') IS NOT NULL
BEGIN
DROP Table #RandomString;
END;


CREATE Table #RandomString 
(Id INT IDENTITY NOT NULL, 
String VARCHAR(1))
INSERT INTO #RandomString(String)
VALUES
('A'), ('B'), ('C'), ('D'), ('E'), ('F'), ('G'), ('H'), ('I'), ('J'),
('K'), ('L'), ('M'), ('N'), ('O'), ('P'), ('Q'), ('R'), ('S'), ('T'),
('U'), ('V'), ('W'), ('X'), ('Y'), ('Z')


WHILE @Counter < @count
BEGIN

--Create random string view

---- This will create a random number between 1 and 999
SET @Lower = 1 ---- The lowest random number
SET @Upper = 9 ---- The highest random number
SELECT @Random1 = ROUND(((@Upper - @Lower -1) * RAND() + @Lower), 0)
SELECT @Random2 = ROUND(((@Upper - @Lower -1) * RAND() + @Lower),0)
SELECT @Random3 = ROUND(((@Upper - @Lower -1) * RAND() + @Lower),0)
SELECT @Random4 = ROUND(((@Upper - @Lower -1) * RAND() + @Lower),0)
SELECT @Random5 = ROUND(((@Upper - @Lower -1) * RAND() + @Lower),0)
SELECT @Random6 = ROUND(((@Upper - @Lower -1) * RAND() + @Lower),0)


SELECT @RandomString1 = String FROM #RandomString WHERE id = @Random3
SELECT @RandomString2 = String FROM #RandomString WHERE id = @Random4
SELECT @RandomString3 = String FROM #RandomString WHERE id = @Random5
SELECT @RandomString4 = String FROM #RandomString WHERE id = @Random6


INSERT INTO data.PostCode(Name)
SELECT @RandomString1 + @RandomString2 + CAST(@Random1 AS varchar) + ' ' + CAST(@Random2 AS Varchar) + @RandomString3 + @RandomString4

SET @Counter = @Counter + 1
END


DROP Table #RandomString;

--SELECT * FROM data.PostCode

END

--Example - Create 100 PostCodes
--EXECUTE USP_GenerateRandomPostCode 100