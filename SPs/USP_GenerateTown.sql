USE MockData
GO
IF OBJECT_ID('USP_GenerateTown') IS NULL
  EXEC ('CREATE PROCEDURE USP_GenerateTown AS RETURN 0;')
GO


ALTER PROCEDURE USP_GenerateTown @Count INT = 1
AS
BEGIN

SET NOCOUNT ON

DECLARE @Random_Town_id INT;
DECLARE @Upper INT;
DECLARE @Lower INT;
DECLARE @Random_Town varchar(50);
DECLARE @Counter INT 
DECLARE @Random INT


SET @Counter = 0

TRUNCATE TABLE Data.Town

--Populate Table

IF Object_ID('tempdb.dbo.#Town','u') IS NOT NULL
BEGIN
DROP TABLE #Town
END

CREATE TABLE #Town
(Name Varchar(50) NOT NULL)


WHILE @Counter < @Count
BEGIN


SET @Lower = (SELECT MIN(countyid) FROM County) ---- The lowest random number
SET @Upper = (SELECT MAX(countyid) FROM County) ---- The highest random number
SELECT @Random_Town_id = ROUND(((@Upper - @Lower -1) * RAND() + @Lower), 0)

SELECT @Random_Town = Town.Name FROM Town
WHERE town_id = @Random_Town_id


INSERT INTO #Town(Name)
SELECT @Random_Town

SET @Counter = @Counter + 1
END

INSERT INTO data.Town(Name)
SELECT Name FROM #Town


DROP TABLE #Town


END


--Example create 100 Street Names
--EXECUTE USP_GenerateTown 100