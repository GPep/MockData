USE MockData
GO
-- Create Random street name
IF OBJECT_ID('USP_GenerateLocation') IS NULL
  EXEC ('CREATE PROCEDURE USP_GenerateLocation AS RETURN 0;')
GO


ALTER PROCEDURE USP_GenerateLocation @Count INT = 1
AS
BEGIN

SET NOCOUNT ON

DECLARE @Random_county_id INT;
DECLARE @Random_country_id INT;
DECLARE @Upper INT;
DECLARE @Lower INT;
DECLARE @Random_county varchar(50);
DECLARE @Random_country varchar(50);
DECLARE @Counter INT 
DECLARE @Random INT


SET @Counter = 0

TRUNCATE TABLE Data.Location

--Populate Table

IF Object_ID('tempdb.dbo.#Location','u') IS NOT NULL
BEGIN
DROP TABLE #Location
END

CREATE TABLE #Location
(County Varchar(50) NOT NULL,
Country Varchar(50) NOT NULL
)


WHILE @Counter < @Count
BEGIN


SET @Lower = (SELECT MIN(countyid) FROM County) ---- The lowest random number
SET @Upper = (SELECT MAX(countyid) FROM County) ---- The highest random number
SELECT @Random_County_id = ROUND(((@Upper - @Lower -1) * RAND() + @Lower), 0)

SELECT @Random_county = County.County FROM County
WHERE countyid = @Random_County_id

SELECT @Random_country_id = County.CountryID FROM County
WHERE countyid = @Random_county_id

SELECT @Random_Country = Country.Name FROM Country
WHERE CountryID = @Random_country_id


INSERT INTO #Location(County, Country)
SELECT @Random_county, @Random_country

SET @Counter = @Counter + 1
END

INSERT INTO data.Location(County, Country)
SELECT County, Country FROM #Location


DROP TABLE #Location


END


--Example create 100 Street Names
--EXECUTE USP_GenerateLocation 100